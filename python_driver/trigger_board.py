# -*- coding: utf-8 -*-
"""
Created on Fri Jul 12 10:14:37 2019

@author: Marandi Group Vivado
"""

import init_board_int as ib
import sys
#import RFSoC_Board as rf

#load the board state
board = ib.load_board()

if(board == None):
    print("Error, unable to load board state from disk.")
    sys.exit()
    
if(board.trigger()):
    print("Error triggering board, is the connection up?")
else:
    print("Board triggered!")    
