# -*- coding: utf-8 -*-
"""
Created on Fri Jul 12 09:36:43 2019

@author: Marandi Group Vivado
"""
import init_board_int as ib
import sys
import RFSoC_Board as rf
import waveform_plotter as wp

#First argument is nanoseconds to run ADC for
#second argument is 1 for display uploaded waveforms
#third argument is number of adc averages


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
if(board.check_adc() == 0):

    if(len(sys.argv) > 1):
        adc_cycles = round(int(sys.argv[1])/4)
    
    if board.set_adc_cycles(adc_cycles) != 0:
        print("Error while setting ADC trigger time, check to make sure board connection is up")
        sys.exit()
        
    adc_shift = 0
    if(len(sys.argv) > 3):
        import math
        try:
            adc_shift = round(math.log2(int(sys.argv[3])))
        except:
            print("ADC averages input was invalid.")
        
    board.set_adc_shift(adc_shift)
    
    print("ADC capture time set to " + str(adc_cycles*4) + " ns")
    print("ADC averages set to " + str(pow(2,adc_shift)))
    
    
else:
    print("ADC clock is not connected.")
    
print("Board is armed, trigger using trigger_board.py")


board.adc_capture_time = adc_cycles * 4

if(len(sys.argv) > 2):
    #if we're being told to plot everything
    if(int(sys.argv[2]) == 1):
        wp.plot_waveforms(board.channels)

if(ib.save_board(board)):
    print("Error while saving board to disk")