

import init_board_int as ib
import sys

#if we weren't passed a port as an argument
if(len(sys.argv) == 1):
    print("Error, please provide a portname as an argument..., usage is \"init_board.py PORTNAME\"")
    sys.exit()
    
port_choice = sys.argv[1]
print("\n\n***** Initializing board on port: " + port_choice + " *****\n")
board = ib.init_board_object(port_choice)

if(board == None):
    print("Error initializing board, was the port choice correct?")
    sys.exit()

if(board.flush_buffer()):
    print("Error while flushing board buffers")
    
    



    
