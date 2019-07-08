# -*- coding: utf-8 -*-
"""
Created on Thu Apr 18 22:03:37 2019

@author: James Williams
"""
import RFSoC_Board as rf
import matplotlib.pyplot as plt

def channel_test():
    
    wf = rf.WaveFile("sample_waveform.txt", 50/250250820)
    c = rf.Channel(0, wf)
    print("length: " + str(len(c.get_byte_stream())))
    for b in c.get_byte_stream():
        print(hex(b) + " ", end = '')
    plt.plot(c.get_word_stream())
    plt.show()
    
    
channel_test()
