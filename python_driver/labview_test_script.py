# -*- coding: utf-8 -*-
"""
Created on Fri Jul 12 10:26:47 2019

@author: Marandi Group Vivado
"""


#List of arguments
#1 channel number between 1 and 16
#2 waveform filename
#3 waveform period in nanoseconds, will be rounded to the nearest 4 nanoseconds
#4 waveform phase, can be a float but will be rounded to nearest quarter nanosecond
#5 waveform amplitude multiplication factor, must be between 0 and 1
#6 number of cycles to playback the waveform
#7 delay before experiment in nanoseconds, will be rounded to the nearest 4 nanoseconds
#8 is locking channel? Must be either 0 or 1
#9 locking waveform amplitude factor, must be between 0 and 1
#10 locking phase in nanoseconds, can be a float but will be rounded to nearest quarter nanosecond
#11 is the locking file name

import os

os.system("python init_board.py COM4 && PAUSE")

os.system("python add_channel.py 1 2_dc_square_wave.txt 200 0 1 200 400 1 1 0 locking_waveform.txt && PAUSE")
os.system("python add_channel.py 2 2_dc_square_wave.txt 200 0 1 200 1600 0 && PAUSE")
os.system("python arm_board.py && PAUSE")
os.system("python trigger_board.py && PAUSE")