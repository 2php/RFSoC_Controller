# -*- coding: utf-8 -*-
"""
Created on Mon Jul  8 17:00:22 2019

@author: Marandi Group Vivado
"""

import init_board as ib
import RFSoC_Board as rf
#initialize the board object and get the board back
board = ib.init_board_object("COM4")

#add a channel and set the period to 2 over the main frequency
wf = rf.WaveFile("five_pulses.txt", 3*rf.DAC_WORD_PERIOD)
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
board.set_trigger_mode(rf.TRIGGER_CYCLES)

#set the trigger cycles
board.set_repeat_cycles(3*10)

#set the loopback mode
board.set_loopback(rf.YES)

print("Pulses loaded onto board, buffer will be flushed when next character is recieved...")
input()

board.flush_buffer()