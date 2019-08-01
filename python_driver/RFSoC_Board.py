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
DEFAULT_BAUD = 230400#115200
DAC_MAX_VALUE = 32767#0x7FFF
DAC_MIN_VALUE = -32768#0x8000
DAC_WORD_PERIOD = 1/250250820 #in seconds, time taken to playback one 256-bit word
DAC_WORD_FREQ = 250250820
NANOSECONDS_PER_DAC_WORD = 4
ADC_TIMEOUT = 1
INPUT_WAVEFORM_MIN = -1
INPUT_WAVEFORM_MAX = 1

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
RF_SET_ZERO_DELAY = 0x0A
RF_SET_ADC_CYCLES = 0x10
RF_READ_ADC = 0x11
RF_FLUSH_ADC = 0x12

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
    
     if(old_max == old_min):
        return stream
    
     new_stream = []
     
     new_height = max(abs(old_min), abs(old_max))
     
     #add the minimum value to everyrthing to eliminate the offset
     for i in range(0, len(stream)):
         pre_val = stream[i] / new_height
         fin_val = pre_val * new_max
         new_stream.append(fin_val)
         

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
    repeat_cycles = 0
    repeat_clock_cycles = 0
    locking_wf = None
    experiment_wf = None

    def __init__(self, n, rc, lf, ef):
        self.number = n
        self.repeat_cycles = rc
        self.locking_wf = lf
        self.experiment_wf = ef
        
    def get_byte_stream(self):
        return self.experiment_wf.bytestream
    
    def get_word_stream(self):
        return self.experiment_wf.wordstream
    
    def get_pre_waveform_byte_stream(self):
        return self.experiment_wf.pre_waveform_bytestream
    
    def get_zero_delay_bytes(self):
        return self.experiment_wf.zero_delay_bytestream
    
    def get_repeat_clock_cycle_bytes(self):
        return int_to_bytestream((self.repeat_cycles * (len(self.experiment_wf.wordstream)/16)), 4)
        
   
    
class WaveFile:
    
    fileName = ""
    columName = ""
    wordstream = []
    bytestream = []
    period = 0 #in nanoseconds
    delay = 0 #in number of DAC samples (16-bit samples), converted from nanoseconds
    amp_factor = 1
    pre_waveform_bytestream = []
    zero_delay_bytestream = []
    is_locking = 0
    locking_shift = 0
    
        
    def __init__(self, fn, per, d, af, il, lshift):
        self.delay = round(d * 4) #to get to number of 16-bit samples
        self.period = per
        self.fileName = fn
        self.amp_factor = af
        self.is_locking = il
        self.locking_shift = lshift
        self.gen_word_stream()
        
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
        num_samples = self.period * NANOSECONDS_PER_DAC_WORD
        
        #next we need to set up variables for interpolation
        disc_time = list(range(0,len(vals)))
        scaled_time = np.arange(0,len(vals), len(vals)/num_samples)
        
        #rescale the values into the word stream
        prescale_wordstream = np.interp(scaled_time, disc_time, vals)
        final_wordstream = stream_scale(prescale_wordstream, min(prescale_wordstream), max(prescale_wordstream), DAC_MIN_VALUE, DAC_MAX_VALUE)
        #if we need to adjust our amplitudes
        if(self.amp_factor != 1):
            for i in range(0,len(final_wordstream)):
                final_wordstream[i] = final_wordstream[i] * self.amp_factor
                
        #if we're a locking waveform
        if(self.is_locking):
            #just shift the waveform and return
            #self.wordstream = stream_shift(final_wordstream, self.locking_shift)
            self.wordstream = stream_shift(final_wordstream, self.locking_shift)            
            self.bytestream = self.gen_byte_stream_from_wordstream(self.wordstream)
            return
            
        
        #figure out the pre_waveform bytes
        pre_waveform_wordstream = []
        pr_index = 0
        fine_delay = self.delay%16
        for i in range (0, 16):
            if(i >= fine_delay):
                pre_waveform_wordstream.append(final_wordstream[pr_index])
                pr_index += 1
            else:
                pre_waveform_wordstream.append(0x0000)
        
        #shift the final wordstream to match
        self.wordstream = stream_shift(final_wordstream, (16 - fine_delay)*-1)
        
        #generate the bytestream
        self.bytestream = self.gen_byte_stream_from_wordstream(self.wordstream)
        
        #generate the prewaveform bytestream
        self.pre_waveform_bytestream = self.gen_byte_stream_from_wordstream(pre_waveform_wordstream)
        
        #generate the zero delay bytestream
        self.zero_delay_bytestream = int_to_bytestream(round((self.delay - fine_delay)/16), 4)
        
        
        
        
            
        
    def gen_byte_stream_from_wordstream(self, wordstream):
        bytestream = []
        #loop throuhg all the words
        for i in range (0, len(wordstream)):
            #get the bytes
            bytes = int_to_bytestream(wordstream[i], 2)
            #append the two bytes to the bytestream
            bytestream.append(bytes[0])
            bytestream.append(bytes[1])
            
        return bytestream
    

class RFSoC_Board:
    port = None
    channels = []
    locking_waveform = None
    adc_capture_time = 0 #in nanoseconds
    
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
            #self.port.reset_input_buffer()
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
            #self.port.reset_input_buffer()
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
            if self.write_channel(c.number) == 1:
                return 1
        return 0
    
    #returns ACK_RESPONSE if ack successfully recieved
    def wait_ack(self):
        try:
            retval = self.port.read(1)
            #self.port.reset_input_buffer()
            return retval[0]
        except:
            return 15
        
    def receive_bytes(self, num_bytes):
        try:
            #self.port.open()
            #self.port.reset_input_buffer()
            retval = self.port.read(num_bytes)
            #self.port.close()
            return retval
        except:
            return None
        
    def write_channel(self, channel_num):
        if(channel_num >= 16):
            print("Error, target channel not found: " + str(channel_num) + "\n")
            return 1
        #look up the appropriate channel
        target_channel = None
        for i in range(0,len(self.channels)):
            if(channel_num == self.channels[i].number):
                target_channel = self.channels[i]
                break
            
        if(target_channel == None):
            print("Error, target channel not found: " + str(channel_num) + "\n")
            return 1
        
        #get the channel bytestream
        bs = target_channel.get_byte_stream();
        
        #send the write channel command
        ack_val = self.write_bytes([RF_LOAD_WAVEFORM])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending write_channel command, ack error code was: " + str(ack_val) + "\n")
            return 1 
        
        #send the channel number
        ack_val = self.write_bytes([channel_num & 0xFF])
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending channel number, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        #send the repeat cycles
        cycle_bytes = target_channel.get_repeat_clock_cycle_bytes()
        ack_val = self.write_bytes(cycle_bytes)
        
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set repeat cycles value, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        #send the zero cycles
        zero_bytes = target_channel.get_zero_delay_bytes()
        ack_val = self.write_bytes(zero_bytes)
        
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set zero cycles value, ack error code was: " + str(ack_val) + "\n")
            return 1 
        
        #send the locking waveform
        ack_val = self.write_bytes(target_channel.locking_wf.bytestream)
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending locking waveform bytes, ack error code was: " + str(ack_val) + "\n")
            return 1 
        
        #send the prewaveform bytes
        ack_val = self.write_bytes(target_channel.get_pre_waveform_byte_stream())
         #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending prewaveform bytes, ack error code was: " + str(ack_val) + "\n")
            return 1 
        
        #send the length
        ack_val = self.write_bytes(int_to_bytestream(len(bs),4))
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending bytestream size, ack error code was: " + str(ack_val) + "\n")
            return 1 
        
        #send the bytestream
        ack_val = self.write_bytes(bs)
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending bytestream, ack error code was: " + str(ack_val) + "\n")
            return 1  
            
        return 0
        
    def set_loopback(self, choice):
        
        #get a choice byte
        choice_byte = choice & 0xFF
        
        #send the set loopback command
        ack_val = self.write_bytes([RF_SET_LOOPBACK])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set loopback command, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        #send the choice byte
        ack_val = self.write_bytes([choice_byte])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending loopback choice, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        return 0
        
    def set_trigger_mode(self, mode):
        
        #send the set trigger mode command
        ack_val = self.write_bytes([RF_SET_TRIGGER_MODE])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set trigger mode, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        #send the mode byte
        ack_val = self.write_bytes([mode & 0xFF])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending trigger mode value, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        return 0
        
    def trigger(self):
        
        #send the trigger command
        ack_val = self.write_bytes([RF_TRIGGER])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending trigger command, ack error code was: " + str(ack_val) + "\n")
            return 1
        return 0
            
    def flush_buffer(self):
        
         #send the flush buffer command
        ack_val = self.write_bytes([RF_FLUSH_BUFFER])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending flush buffer command, ack error code was: " + str(ack_val) + "\n")
            return 1
        return 0
            
        
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
    
        print("Error, bad acknowledgement recieved from board while sending locking waveform bytes, ack error code was: " + str(ack_val) + "\n")
            
    def set_locking_select(self):
        
        #depreciated function
        return
#        bs = self.get_locking_bytes()
#        
#        #send the set lockign waveform command
#        ack_val = self.write_bytes([RF_SET_LOCKING_SELECT])
#        
#        #if we get a bad acknowledgement back
#        if(ack_val != ACK_RESPONSE):
#            print("Error, bad acknowledgement recieved from board while sending set locking select command, ack error code was: " + str(ack_val) + "\n")
#            
#        #send the locking bytes
#        ack_val = self.write_bytes(bs)
#        
#        #if we get a bad acknowledgement back
#        if(ack_val != ACK_RESPONSE):
#            print("Error, bad acknowledgement recieved from board while sending locking select bytes, ack error code was: " + str(ack_val) + "\n")

    def set_adc_cycles(self, cycles):
        
        #send the set adc cycles command
        ack_val = self.write_bytes([RF_SET_ADC_CYCLES])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set adc cycles command, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        #send the cycle bytes
        ack_val = self.write_bytes(int_to_bytestream(int(cycles), 4))
    
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending adc cycles, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        return 0
    
    
     #Returns an array of adc samples       
    def read_adc(self):
        self.port.timeout = ADC_TIMEOUT
         #send the read command
        #ack_val = self.write_bytes([RF_READ_ADC])
        self.port.open()
        self.port.write([RF_READ_ADC])
        ack_val = self.port.read(1)
        #if we get a bad acknowledgement back
        if(len(ack_val) != 1 or ack_val[0] != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending set adc cycles command, ack error code was: " + str(ack_val) + "\n")
           
        #read the length of the bytestream
        len_bytes = self.receive_bytes(4)
        
        if(len(len_bytes) != 4):
            print("Error while receiving ADC bytestream, stream length bytes not correct! Board must be reset to continue.")
            return
        
        leng = (len_bytes[0] << 24) | (len_bytes[1] << 16) | (len_bytes[2] << 8) | len_bytes[3]
        
        #get the bytestream
        #adc_bytestream = self.receive_bytes(leng)
        adc_bytestream = []
        
        for i in range(0, leng):
            bs = self.receive_bytes(1)
            if(len(bs) != 1):
                print("Error while receiving adc bytestream, timeout occured")
                print("Warning, expected " + str(leng) + " bytes from board for ADC capture, received " + str(len(adc_bytestream)))
                return None
            
            adc_bytestream.append(bs[0])
        
        self.port.close()
        self.port.timeout = 1

        #return the rebuilt samples
        return self.rebuild_adc_stream(adc_bytestream)
     
    
    def flush_adc_buffer(self):
        #send the set adc cycles command
        ack_val = self.write_bytes([RF_FLUSH_ADC])
        
        #if we get a bad acknowledgement back
        if(ack_val != ACK_RESPONSE):
            print("Error, bad acknowledgement recieved from board while sending flush adc buffer command, ack error code was: " + str(ack_val) + "\n")
            return 1
        
        return 0
    
    def get_locking_bytes(self):
        
        locking_val = 0x0000
        for c in self.channels:
            if(c.is_locking):
                locking_val = locking_val | (1 << c.number)
                
        return int_to_bytestream(locking_val, 2)
    
    def rebuild_adc_stream(self, stream):
        
        samples = []
        for i in range(0, int(len(stream)/2)):
            #Conbine the two bytes
            sample = (stream[2*i] << 8) | stream[(2*i) + 1]
            samples.append(self.s16(sample))
            
        for i in range(0, int(len(samples)/2)):
            temp = samples[2*i]
            samples[2*i] = samples[(2*i)+1] * (1800/32768)
            samples[(2*i)+1] = temp * (1800/32768)
            
        #return stream_scale(samples, -32768, +32768, -1800, +1800)
        return samples
    
    def s16(self, value):
        return -(value & 0x8000) | (value & 0x7fff)