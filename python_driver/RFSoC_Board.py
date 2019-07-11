# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 22:52:31 2019

@author: James Williams
"""

import serial
from binascii import unhexlify
import re
import numpy as np


#Parameters
ENDIAN = 'big'#big endian
SIZE_LEN = 4 #number of bytes sent when transmitting bytestream size
DEFAULT_BAUD = 115200
DAC_MAX_VALUE = 0x7FFF
DAC_WORD_PERIOD = 1/250250820 #in seconds, time taken to playback one 256-bit word

#Commands
PING_BOARD = 0x00
RF_LOAD_WAVEFORM = 0x01
RF_TRIGGER = 0x02
RF_SET_TRIGGER_MODE = 0x03
RF_FLUSH_BUFFER = 0x04
RF_SET_LOOPBACK = 0x05
RF_SET_REPEAT_CYCLES = 0x06
RF_SET_TRIGGER = 0x07
RF_SET_LOCKING_WAVEFORM = 0x08
RF_SET_LOCKING_SELECT = 0x09

#Board responses
ACK_RESPONSE = 0x00

#board defines
TRIGGER_CONTINUOUS = 0x00
TRIGGER_CYCLES = 0x01
YES = 0x00
NO = 0x01
ON = 0x01
OFF = 0x00

def stream_scale(stream, old_min, old_max, new_min, new_max):
     new_stream = []
     
     #add the minimum value to everyrthing to eliminate the offset
     for i in range(0, len(stream)):
         no_negative = stream[i]-old_min
         new_stream.append((no_negative/(old_max-old_min))*(new_max-new_min))
         

     return new_stream

def stream_shift(stream, shift):
    new_stream = []
    index = shift*-1
    #fix the index
    if(index < 0):
        index += len(stream)
        
    for i in range(0, len(stream)):
        #append the current index to the new stream
        new_stream.append(stream[index])
        #find the next index value
        if(index == len(stream)-1):
            index = 0
        else:
            index += 1
            
    return new_stream
         


def long_to_bytes (val, endianness='big'):
    """
    Use :ref:`string formatting` and :func:`~binascii.unhexlify` to
    convert ``val``, a :func:`long`, to a byte :func:`str`.

    :param long val: The value to pack

    :param str endianness: The endianness of the result. ``'big'`` for
      big-endian, ``'little'`` for little-endian.

    If you want byte- and word-ordering to differ, you're on your own.

    Using :ref:`string formatting` lets us use Python's C innards.
    """

    # one (1) hex digit per four (4) bits
    width = val.bit_length()

    # unhexlify wants an even multiple of eight (8) bits, but we don't
    # want more digits than we need (hence the ternary-ish 'or')
    width += 8 - ((width % 8) or 8)

    # format width specifier: four (4) bits per hex digit
    fmt = '%%0%dx' % (width // 4)

    # prepend zero (0) to the width, to zero-pad the output
    s = unhexlify(fmt % val)

    if endianness == 'little':
        # see http://stackoverflow.com/a/931095/309233
        s = s[::-1]

    return s

def int_to_bytestream(n, l):
    bs = []
    for i in range(0, l):
        if(ENDIAN == 'little'):
            b = (int(n) >> (i*8)) & 0xFF
        else:
            b = (int(n) >> ((l - 1 - i)*8)) & 0xFF
        bs.append(b)
    return bs

class Channel:
    number = 0
    wf = None

    def __init__(self, n, f):
        self.number = n
        self.wf = f
        
    def get_byte_stream(self):
        return self.wf.bytestream
    
    def get_word_stream(self):
        return self.wf.wordstream
        
   
    
class WaveFile:
    
    fileName = ""
    columName = ""
    wordstream = []
    bytestream = []
    period = 0 #in seconds
    shift = 0 #in number of DAC samples (16-bit samples)
    
        
    def __init__(self, fn, per, s):
        self.shift = s
        self.period = per
        self.fileName = fn
        self.gen_word_stream()
        self.gen_byte_stream()
        
    def gen_word_stream(self):
        #read out the file as a string
        f = open(self.fileName, "r")
        fileString = f.read()
        
        #parse out all of the numbers in the file stream
        prevals = re.findall(r'[-+]?[0-9]+\.?[0-9]*', fileString)
        
        vals = []
        
        #parse out the comma
        for i in range (0, len(prevals)):
            #get the string without the number
            string_val = prevals[i]
            vals.append(float(string_val))
        
        #first we need to figure out how many samples our final wordstream will have
        num_samples = round((self.period/DAC_WORD_PERIOD)*16)
        
        #next we need to set up variables for interpolation
        disc_time = list(range(0,len(vals)))
        scaled_time = np.arange(0,len(vals), len(vals)/num_samples)
        
        #rescale the values into the word stream
        prescale_wordstream = np.interp(scaled_time, disc_time, vals)
        final_wordstream = stream_scale(prescale_wordstream, min(prescale_wordstream), max(prescale_wordstream), 0, DAC_MAX_VALUE)
        if(self.shift == 0):
            self.wordstream = final_wordstream
            return
        self.wordstream = stream_shift(final_wordstream, self.shift)
        
            
        
    def gen_byte_stream(self):
        self.bytestream = []
        #loop throuhg all the words
        for i in range (0, len(self.wordstream)):
            #get the bytes
            bytes = int_to_bytestream(self.wordstream[i], 2)
            #append the two bytes to the bytestream
            self.bytestream.append(bytes[0])
            self.bytestream.append(bytes[1])
    

class RFSoC_Board:
    port = None
    channels = []
    locking_waveform = None
    
    def __init__(self, portname):
        self.channels = []
        self.port = serial.Serial()
        self.port.baudrate = DEFAULT_BAUD
        self.port.port = portname
        self.port.timeout = 1
        
    def close(self):
        self.port.close()

    def ping_board(self):
        try:
            self.port.open()
            self.port.reset_input_buffer()
            self.port.write([PING_BOARD])
            self.port.flush()
            result = self.wait_ack()
            self.port.reset_input_buffer()
            self.close()
            if result == ACK_RESPONSE:
                return 1
            else:
                return 0
        except:
            self.close()
            return 0
        
    def write_bytes(self, b):
        try:
            self.port.open()
            if not self.port.is_open:
                return 0
            self.port.reset_input_buffer()
            self.port.write(b)
            #Wait until everything is written
            self.port.flush()
            #wait for the ack
            ret_val = self.wait_ack()
            #close the port
            self.close()
            return ret_val
        except:
            self.close()
            return 0
        
    def add_channel(self, c):
        #look and see if we have the channel already
        for i in range(0, len(self.channels)):
            if self.channels[i].number == c.number:
                self.channels[i] = c
                
        self.channels.append(c)
        
        
    def write_all_channels(self):
        for c in self.channels:
            self.write_channel(c.number)
        return
    
    #returns ACK_RESPONSE if ack successfully recieved
    def wait_ack(self):
        try:
            retval = self.port.read(1)
            self.port.reset_input_buffer()
            return retval[0]
        except:
            return 15
        
        
    def write_channel(self, channel_num):
        if(channel_num >= 16):
            print("Error, target channel not found: " + str(channel_num) + "\n")
            return
        #look up the appropriate channel
        target_channel = None
        for i in range(0,len(self.channels)):
            if(channel_num == self.channels[i].number):
                target_channel = self.channels[i]
                break
            
        if(target_channel == None):
            print("Error, target channel not found: " + str(channel_num) + "\n")
            return
        
        #get the channel bytestream
        bs = target_channel.get_byte_stream();
        
        #send the write channel command
        ack_val = self.write_bytes([RF_LOAD_WAVEFORM])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending write_channel command, ack error code was: " + str(ack_val) + "\n")
        
        #send the channel number
        ack_val = self.write_bytes([channel_num & 0xFF])
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending channel number, ack error code was: " + str(ack_val) + "\n")
        
        #send the length
        ack_val = self.write_bytes(int_to_bytestream(len(bs),4))
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending bytestream size, ack error code was: " + str(ack_val) + "\n")
            
        #send the bytestream
        ack_val = self.write_bytes(bs)
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending bytestream, ack error code was: " + str(ack_val) + "\n")
        
    def set_repeat_cycles(self, num_cycles):
        
        #get the number of cycles as a byte stream
        cycle_bytes = int_to_bytestream(num_cycles, 4)
        
        #send the repeat cycles command
        ack_val = self.write_bytes([RF_SET_REPEAT_CYCLES])
        
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set repeat cycles command, ack error code was: " + str(ack_val) + "\n")
        
         #send the cycle bytes
        ack_val = self.write_bytes(cycle_bytes)
        
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set repeat cycles value, ack error code was: " + str(ack_val) + "\n")
            
        
    def set_loopback(self, choice):
        
        #get a choice byte
        choice_byte = choice & 0xFF
        
        #send the set loopback command
        ack_val = self.write_bytes([RF_SET_LOOPBACK])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set loopback command, ack error code was: " + str(ack_val) + "\n")
            
        
        #send the choice byte
        ack_val = self.write_bytes([choice_byte])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending loopback choice, ack error code was: " + str(ack_val) + "\n")
            
    def set_trigger_mode(self, mode):
        
        #send the set trigger mode command
        ack_val = self.write_bytes([RF_SET_TRIGGER_MODE])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set trigger mode, ack error code was: " + str(ack_val) + "\n")
            
        
        #send the mode byte
        ack_val = self.write_bytes([mode & 0xFF])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending trigger mode value, ack error code was: " + str(ack_val) + "\n")
        
        
    def trigger(self):
        
        #send the trigger command
        ack_val = self.write_bytes([RF_TRIGGER])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending trigger command, ack error code was: " + str(ack_val) + "\n")
            
    def flush_buffer(self):
        
         #send the flush buffer command
        ack_val = self.write_bytes([RF_FLUSH_BUFFER])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending flush buffer command, ack error code was: " + str(ack_val) + "\n")
            
        
    def set_trigger(self, state):
        #send the set trigger mode command
        ack_val = self.write_bytes([RF_SET_TRIGGER])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set trigger mode, ack error code was: " + str(ack_val) + "\n")
            
        
        #send the mode byte
        ack_val = self.write_bytes([state & 0xFF])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending trigger mode value, ack error code was: " + str(ack_val) + "\n")
    
    def set_locking_waveform(self, wf):
        if(len(wf.bytestream) != 32):
            print("Error, locking waveform must be exactly 16 samples...")
            return
        #send the set lockign waveform command
        ack_val = self.write_bytes([RF_SET_LOCKING_WAVEFORM])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set locking waveform command, ack error code was: " + str(ack_val) + "\n")
            
        #send the locking bytes
        ack_val = self.write_bytes(wf.bytestream)
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending locking waveform bytes, ack error code was: " + str(ack_val) + "\n")
            
    def set_locking_select(self, bs):
        if(len(bs) != 2):
            print("Error, locking select must be exactly 2 bytes...")
            return
        #send the set lockign waveform command
        ack_val = self.write_bytes([RF_SET_LOCKING_SELECT])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set locking select command, ack error code was: " + str(ack_val) + "\n")
            
        #send the locking bytes
        ack_val = self.write_bytes(bs)
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending locking select bytes, ack error code was: " + str(ack_val) + "\n")
            