# -*- coding: utf-8 -*-
"""
Created on Wed Sep 18 10:55:44 2019

@author: James Williams
"""

import RFSoC_Board as rf
import waveform_plotter as wp


filename = "phase_file.txt"
period = 200 #in nanoseconds
delay_after_experiment = 10000
amplitude_multiplication_factor = 1
playback_cycles = 1
delay_before_experiment = 806.75

#First create the wavefile object

wf = rf.WaveFile(filename, period, delay_before_experiment, delay_after_experiment, 1, 0, 0)


locking_amp_factor = 0
locking_phase = 0
locking_filename = "dummy_locking_file.txt"

locking_file = rf.WaveFile(locking_filename, 4, 0, 0, locking_amp_factor, 1, round(locking_phase * 4)) 

c = rf.Channel(1, playback_cycles, locking_file, wf)

wp.plot_waveforms([c])





