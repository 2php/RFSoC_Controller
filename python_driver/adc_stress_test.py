# -*- coding: utf-8 -*-
"""
Created on Mon Jul 29 14:57:33 2019

@author: Marandi Group Vivado
"""

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

try:
#initialize the board object and get the board back
    board = ib.init_board_object("COM4")
    
    wf_dummy_locking = rf.WaveFile("dummy_locking_file.txt", 4, 0, 1, 1, 0)
    #add a channel and set the period to 2 over the main frequency
    wf_pulse = rf.WaveFile("2_dc_square_wave.txt", 50*4, 0, 1, 0, 0)
    wf_ramp = rf.WaveFile("sawtooth.txt", 50*4, 0, 1, 0, 0)

    
    num_triggers = 1
    #trigger once
    print("Triggering until x is recieved, will trigger on every other input")
    
    while(1):
        
        c1 = rf.Channel(1, 5, wf_dummy_locking, wf_pulse if num_triggers % 2 == 0 else wf_ramp)

        #flush the bord buffers
        board.flush_buffer()
        
        #upload the waveform
        board.add_channel(c1)
    
        
        board.write_all_channels()
        
        #set the trigger mode
        board.set_trigger_mode(rf.TRIGGER_CYCLES)
        
        #set the loopback mode
        board.set_loopback(rf.YES)
        
        #set the adc to collect 800 samples
        board.set_adc_cycles(1000)
        
        choice = input()
        if choice == 'x':
            break
        board.trigger()
        print("Triggered, run number: " + str(num_triggers))
        num_triggers += 1
        samples = board.read_adc()
        wp.plot_waveform(samples)
        
        
    
    board.flush_buffer()
    
    print("Buffer flushed")
    
except:
    print("Exiting program...")