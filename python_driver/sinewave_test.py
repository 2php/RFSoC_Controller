# -*- coding: utf-8 -*-
"""
Created on Thu May  2 14:07:21 2019

@author: James Williams
"""

import math
import RFSoC_Board as rf
import pickle
#import init_board
import matplotlib.pyplot as plt

#initialize the board
#init_board.init("COM10")

#Generate a 1MHz sine wave 
sine_wave = []
time = []
omega = 1.18
t = 0
t_step = 0.001
#generate the required number of words
for i in range (rf.CHANNEL_DEPTH*rf.WORDS_PER_REG):
    time.append(t)
    sine_wave.append((2**(rf.WORD_LEN*8))*math.sin(omega*t))
    t = t + t_step
   

#plot the wave
plt.plot(time, sine_wave)
plt.show()


#create a board device
f = open("database.txt", "rb")
board = pickle.load(f)
for i in range(16):
    #create a waveform
    wf = rf.WaveFile(None, sine_wave)
    c = rf.Channel(i, 50, wf)
    board.add_channel(c)

#load the waveform
board.write_bytestream()

#arm the board
while(1)
    board.arm()
    