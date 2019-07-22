# -*- coding: utf-8 -*-
"""
Created on Mon Jul 22 08:38:34 2019

@author: Marandi Group Vivado
"""
import matplotlib.pyplot as plt
import init_board_int as ib

#initialize the board object and get the board back
board = ib.init_board_object("COM4")

#set the adc to collect 800 samples
board.set_adc_cycles(100)

#trigger the board
board.trigger()

samples = board.read_adc()



plt.plot(samples)
plt.ylabel('ADC Value')
plt.xlabel('ADC Sample Number')
plt.show()