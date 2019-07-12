# -*- coding: utf-8 -*-
"""
Created on Thu Jul 11 17:24:19 2019

@author: Marandi Group Vivado
"""

# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 11:59:59 2019

@author: James Williams
"""
import sys
import getPorts as gp
import RFSoC_Board as rf
import pickle

def init_board_object(port = None):

    #define our database file
    f = None
    
    #try to open it
    try:
        f = open("database.txt", "wb")
    except FileNotFoundError:
        #create the file if it doesn't exist
        f = open("database.txt","wb+")
        
    #clear the file contense if there's anything in there
    f.truncate(0)
    
    portname = ""
    #if we weren't passed any arguments
    if(len(sys.argv) == 1 and port == None):
        print("Type the name of the port used to access the board:")
        portname = input()
    elif port != None:
        portname = port
    else:
        portname = sys.argv[1]
    
    
    #make sure the provided port name is correct
    if portname not in gp.get_port_list():
        print("Invalid port name: " + sys.argv[1])
        quit()
    
    #make a new RFSoC object
    board = rf.RFSoC_Board(portname)
    
    #test the connection
    print("Connection to board is " + ("up!" if board.ping_board() else "down!"))
    
    #write the board object to file
    pickle.dump(board, f)
    f.flush()
    
    f.close()
    f = open("database.txt", "rb")
    #try loading the object back
    board_cpy = pickle.load(f)
    
    if board_cpy.port.port == portname:
        print("Successfully wrote database!")
    else:
        print("Unable to write database!")
        
    return board


def load_board():
    try:
        #open the database
        f = open("database.txt", "rb")
        board = pickle.load(f)
        f.close()
        return board
    except:
        print("Error loading board, unable to open database file, was init_board.py before trying to perform this action?")
        return None
    
def save_board(board):
    try:
        #open the database
        f = open("database.txt", "wb")
        #clear the old state
        f.truncate(0)
        #write the board object to file
        pickle.dump(board, f)
        f.flush()
        f.close()
        return 0
    except:
        print("Error while trying to save board to disk")
        return 1