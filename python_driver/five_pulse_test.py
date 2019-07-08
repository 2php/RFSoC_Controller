# -*- coding: utf-8 -*-
"""
Created on Sun Jul  7 18:34:38 2019

@author: Marandi Group Vivado
"""
import init_board as ib
import RFSoC_Board as rf
import time
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
board.set_repeat_cycles(15)

#set the loopback mode
board.set_loopback(rf.YES)

#trigger until stopped
while 1:
    print("Triggering board...\n")
    board.trigger()
    time.sleep(1)