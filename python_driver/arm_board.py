# -*- coding: utf-8 -*-
"""
Created on Fri Jul 12 09:36:43 2019

@author: Marandi Group Vivado
"""
import init_board_int as ib
import sys
import RFSoC_Board as rf

#load the board state
board = ib.load_board()
if(board == None):
    print("Error, unable to load board state from disk.")
    sys.exit()
    
board.flush_buffer()
    
#set locking select
board.set_locking_select()

board.write_all_channels()


#set the loopback mode
board.set_loopback(rf.YES)

#set the trigger mode
board.set_trigger_mode(rf.TRIGGER_CYCLES)

board.set_adc_cycles(3000)

print("Board is armed, trigger using trigger_board.py")
