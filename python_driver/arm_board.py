# -*- coding: utf-8 -*-
"""
Created on Fri Jul 12 09:36:43 2019

@author: Marandi Group Vivado
"""
import init_board_int as ib
import sys
import RFSoC_Board as rf

#First argument is nanoseconds to run ADC for

#load the board state
board = ib.load_board()
if(board == None):
    print("Error, unable to load board state from disk.")
    sys.exit()
    
if board.flush_buffer() != 0:
    print("Error while attempting to flush waveform buffer, check to make sure board is running.")
    sys.exit()

if board.write_all_channels() != 0:
    print("Error while writing channels to board buffers, check to make sure board connection is up")
    sys.exit()


#set the loopback mode
if board.set_loopback(rf.YES) != 0:
    print("Error while setting buffer loopback, check to make sure board connection is up")
    sys.exit()

#set the trigger mode
if board.set_trigger_mode(rf.TRIGGER_CYCLES) != 0:
    print("Error while setting buffer trigger mode, check to make sure board connection is up")
    sys.exit()

adc_cycles = 0
if(len(sys.argv) > 1):
    adc_cycles = round(int(sys.argv[1])/4)

if board.set_adc_cycles(adc_cycles) != 0:
    print("Error while setting ADC trigger time, check to make sure board connection is up")
    sys.exit()

print("ADC capture time set to " + str(adc_cycles*4) + " ns")
print("Board is armed, trigger using trigger_board.py")
