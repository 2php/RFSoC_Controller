# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 21:43:58 2019

@author: James Williams
"""

import serial
import serial.tools.list_ports


def get_port_list():
    ports = list(serial.tools.list_ports.comports())
    ps = []
    for p in ports:
        ps.append(p.device)
    return ps

def print_port_list():
    ports = list(serial.tools.list_ports.comports())
    
    
    for p in ports:
       
        ser = serial.Serial()
        ser.baudrate = 19200
        ser.port = p.device
        try:
            ser.open()
            print(p.description + " is " + "writable" if ser.writable() else "UNWRITABLE")
            ser.close()
        except:
            print("Unable to open: " + p.description)
            
            
    print("Namelist:")   
    for p in ports:
        print(p.device)
    
