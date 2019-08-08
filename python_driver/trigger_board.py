# -*- coding: utf-8 -*-
"""
Created on Fri Jul 12 10:14:37 2019

@author: Marandi Group Vivado
"""

import init_board_int as ib
import sys
import waveform_plotter as wp
import numpy
import time
#import RFSoC_Board as rf

#argument 1 is save waveform as csv?
#argument 2 is plot waveform?

def save_waveform(data):
    timestr = time.strftime("%Y-%m-%d--%H-%M-%S")
    numpy.savetxt(timestr + "_adc_data", data, delimiter=",")
    return

#load the board state
board = ib.load_board()

#flush the adc buffer
if(board.flush_adc_buffer() != 0):
    print("Error while trying to flush adc buffer, is the connection up?")
    sys.exit()

if(board == None):
    print("Error, unable to load board state from disk.")
    sys.exit()
    
num_trigs = 1
if(len(sys.argv) > 3):
    num_trigs = int(sys.argv[3])
    
for i in range(0, num_trigs):
    if(board.trigger()):
        print("Error triggering board, is the connection up?")
    else:
        print("Board triggered!")
    
if(len(sys.argv) > 1):
    
    if(board.adc_capture_time == 0 and (int(sys.argv[1]) == 1 or int(sys.argv[2]) == 1)):
        print("Cannot save or display waveform, capture time was set to 0 ns")
        sys.exit()
    
    #If we need to save the waveform as a csv or plot it
    if(int(sys.argv[1]) == 1 or int(sys.argv[2]) == 1):
        data = board.read_adc()
        
        #if we need to save it
        if(int(sys.argv[1]) == 1):
            save_waveform(data)
    
        if(int(sys.argv[2]) == 1):
            wp.plot_waveform(data)
