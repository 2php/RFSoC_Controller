# -*- coding: utf-8 -*-
"""
Created on Thu Jul 11 17:36:26 2019

@author: Marandi Group Vivado
"""
import sys
import os.path
import init_board_int as ib
import RFSoC_Board as rf

#get all of our variables first
channel_number = sys.argv[1]
if channel_number > 16 or channel_number < 1:
    print("Error, invalid channel number: " + str(channel_number) + ", valid channel numbers are between 1 and 16.")
    sys.exit()

waveform_filename = sys.argv[2]
if not os.path.isfile(waveform_filename):
    print("Error, cannot find waveform file: " + waveform_filename)
    sys.exit()

waveform_period = sys.argv[3]

waveform_phase = sys.argv[4] #in nanoseconds, can be negative

amp_mul_factor = sys.argv[5] #between 0 and 1
if(amp_mul_factor < 0 or amp_mul_factor > 1):
    print("Error, waveform amplitude multiplication factor must be between 0 and 1")
    sys.exit()

num_cycles = sys.argv[6]

zero_delay = sys.argv[7] #in nanoseconds, must be positive
if(zero_delay < 0):
    print("Error, delay before experiment must be positive or 0")
    sys.exit()


#####IF we're the locking channel###########

is_locking = sys.argv[8] #0 or 1

if(is_locking):

    locking_amp_factor = sys.argv[9] #between 0 and 1
    if(locking_amp_factor < 0 or locking_amp_factor > 1):
        print("Error, locking amplitude multiplication factor must be between 0 and 1")
        sys.exit()
    
    locking_phase = sys.argv[10] #in nanoseconds, can be negative
    
    
    locking_filename = sys.argv[11]
    if not os.path.isfile(locking_filename):
        print("Error, cannot find locking waveform file: " + locking_filename)
        sys.exit()
else:
    locking_amp_factor = 0
    locking_phase = 0
    locking_file = "dummy_locking_file.txt"

board = ib.load_board()

if(board == None):
    print("Error, unable to load board.")
    sys.exit()
    
#If the board is valid, add the channelw
waveform_file = rf.WaveFile(waveform_filename, waveform_period, waveform_phase, amp_mul_factor)
locking_file = rf.WaveFile(locking_filename, rf.DAC_WORD_PERIOD, locking_phase, locking_amp_factor)

c = rf.Channel(channel_number, round(zero_delay/4), round(num_cycles * waveform_period * rf.DAC_WORD_FREQ), locking_file, waveform_file)


board.add_channel(c)

ib.save_board(board)
