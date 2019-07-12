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

import init_board_int as ib
import RFSoC_Board as rf
#initialize the board object and get the board back
board = ib.init_board_object("COM4")


wf_locking = rf.WaveFile("locking_waveform.txt", rf.DAC_WORD_PERIOD, 2*4, 1)
#add a channel and set the period to 2 over the main frequency
wf0 = rf.WaveFile("2_dc_square_wave.txt", 50*rf.DAC_WORD_PERIOD, 0, 1)
wf1 = rf.WaveFile("2_dc_square_wave.txt", 50*rf.DAC_WORD_PERIOD, 0*4, 1)
wf2 = rf.WaveFile("2_dc_square_wave.txt", 4*rf.DAC_WORD_PERIOD, 0, 1)
c0 = rf.Channel(0, 450, 200*50, wf_locking, wf0)
c1 = rf.Channel(1, 500, 200*50, wf_locking, wf1)
c2 = rf.Channel(2, 0, 200*50, wf_locking, wf2)



#flush the bord buffers
board.flush_buffer()

#upload the waveform
board.add_channel(c0)
board.add_channel(c1)
board.add_channel(c2)

board.write_all_channels()

board.set_locking_select([0x00, 0x01])

#set the trigger mode
board.set_trigger_mode(rf.TRIGGER_CYCLES)

#set the loopback mode
board.set_loopback(rf.YES)
num_triggers = 1
#trigger once
print("Triggering until x is recieved, will trigger on every other input")

while(1):
    choice = input()
    if choice == 'x':
        break
    board.trigger()
    print("Triggered, run number: " + str(num_triggers))
    num_triggers += 1
    

board.flush_buffer()

print("Buffer flushed")