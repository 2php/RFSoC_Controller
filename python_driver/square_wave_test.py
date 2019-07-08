# -*- coding: utf-8 -*-
"""
Created on Mon Jul  8 14:27:45 2019

@author: Marandi Group Vivado
"""

import init_board as ib
import RFSoC_Board as rf
#initialize the board object and get the board back
board = ib.init_board_object("COM4")

#add a channel and set the period to 2 over the main frequency
wf = rf.WaveFile("10_dc_square_wave.txt", 50*rf.DAC_WORD_PERIOD)
c = rf.Channel(0, wf)

#flush the bord buffers
board.flush_buffer()

#upload the waveform
board.add_channel(c)

board.write_channel(0)

#set the trigger mode
board.set_trigger_mode(rf.TRIGGER_CONTINUOUS)


#set the loopback mode
board.set_loopback(rf.YES)

#trigger until console anything is recived
board.set_trigger(rf.ON)

print("Trigger active until input recieved...")
portname = input()

board.set_trigger(rf.OFF)
