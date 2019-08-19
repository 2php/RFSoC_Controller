# -*- coding: utf-8 -*-
"""
Created on Wed Jul 10 09:37:32 2019

@author: Marandi Group Vivado
"""

# -*- coding: utf-8 -*-
"""
Created on Mon Jul  8 14:27:45 2019

@author: Marandi Group Vivado
"""

import waveform_plotter as wp
import init_board_int as ib
import RFSoC_Board as rf
import time

try:
#initialize the board object and get the board back
    board = ib.init_board_object("COM4")
    
    
    wf_locking = rf.WaveFile("locking_waveform.txt", 4, 0, 0, 0.2, 1, 0)
    wf_dummy_locking = rf.WaveFile("dummy_locking_file.txt", 4, 0, 0, 1, 1, 0)
    #add a channel and set the period to 2 over the main frequency
    #wf0 = rf.WaveFile("sawtooth.txt", 50*4, 0, 0, 0.05, 0, 0)
    #wf1 = rf.WaveFile("2_dc_square_wave.txt", 50*4, 0, 200, 0.75, 0, 0)
    wf2 = rf.WaveFile("2_dc_square_wave.txt", 50*4, 0, 0, 0.75, 0, 0)
    #wf3 = rf.WaveFile("locking_waveform.txt", 4, 0, 0, 1, 0, 0)
    #wf2 = rf.WaveFile("2_dc_square_wave.txt", 50*4, 0.75, 1, 0, 0)
    #wf2 = rf.WaveFile("2_dc_square_wave.txt", 4*rf.DAC_WORD_PERIOD, 0, 1)
    #wf4 = rf.WaveFile("2_dc_square_wave.txt", 50*rf.DAC_WORD_PERIOD, 0*4, 1)
    c0 = rf.Channel(0, 5, wf_locking, wf2)
    #c1 = rf.Channel(1, 5, wf_locking, wf2)
    #c2 = rf.Channel(4, 10, wf_dummy_locking, wf2)
    #c2 = rf.Channel(2, 500, 200*50, wf_locking, wf2, 0)
    #c4 = rf.Channel(15, 450, 200*50, wf_locking, wf2, 1)
    
    
    
    #flush the bord buffers
    board.flush_buffer()
    
    #upload the waveform
    board.add_channel(c0)
    #board.add_channel(c1)
    #board.add_channel(c2)
    #board.add_channel(c4)
    
    board.write_all_channels()
    
    #set the trigger mode
    board.set_trigger_mode(rf.TRIGGER_CYCLES)
    
    #set the loopback mode
    board.set_loopback(rf.YES)
    
    #set the adc to collect 800 samples
    board.set_adc_cycles(100)
    
    adc_shift = 8
    board.set_adc_shift(adc_shift)
    
    board.flush_adc_buffer()
    
    #num_triggers = 1
    #trigger once
    #print("Triggering until x is recieved, will trigger on every other input")
    
#    while(1):
#        choice = input()
#        if choice == 'x' or num_triggers == 2:
#            break
#        board.trigger()
#        print("Triggered, run number: " + str(num_triggers))
#        num_triggers += 1
#        #samples = board.read_adc()
#        #wp.plot_waveform(samples)
        
    #board.trigger()
    for i in range(0,pow(2,adc_shift)):
        board.trigger()
        time.sleep(0.1)
    
    samples = board.read_adc()
    wp.plot_waveform(samples)
    board.flush_buffer()
    
    print("Buffer flushed")
    
except:
    print("Exiting program...")