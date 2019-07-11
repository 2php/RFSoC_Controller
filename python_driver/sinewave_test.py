# -*- coding: utf-8 -*-
"""
Created on Thu May  2 14:07:21 2019

@author: James Williams
"""

import init_board as ib
import RFSoC_Board as rf
#initialize the board object and get the board back
board = ib.init_board_object("COM4")

#add a channel and set the period to 2 over the main frequency
wf = rf.WaveFile("sine_wave.txt", 1*rf.DAC_WORD_PERIOD, 0)
c0 = rf.Channel(0, wf)
c1 = rf.Channel(1, wf)

#flush the bord buffers
board.flush_buffer()

#upload the waveform
board.add_channel(c0)
board.add_channel(c1)

board.write_channel(0)
board.write_channel(1)

#set the trigger mode
board.set_trigger_mode(rf.TRIGGER_CONTINUOUS)


#set the loopback mode
board.set_loopback(rf.YES)

#trigger until console anything is recived
board.set_trigger(rf.ON)

print("Trigger active until input recieved...")
portname = input()

board.set_trigger(rf.OFF)
board.flush_buffer()