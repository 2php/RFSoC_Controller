# -*- coding: utf-8 -*-
"""
Created on Tue Jul 23 09:56:01 2019

@author: Marandi Group Vivado
"""

#import matplotlib
#matplotlib.use('WXAgg',warn=False, force=True)
from matplotlib import pyplot as plt
#print ("Switched to:",matplotlib.get_backend())

def plot_waveform(data):
    
    if(data == None):
        print("Error, unable to plot waveform, adc bytestream was empty.")
        return
    
    fig, ax = plt.subplots()
    
    #rebuild the time array
    t = [] #in nanoseconds
    for i in range(0, len(data)):
        t.append(i*0.5)
        
    ax.plot(t, data)
    
    ax.set(xlabel='Time (ns)', ylabel='Voltage (mV)',
           title='ADC Waveform')
    ax.grid()
    
    #fig.savefig("test.png")
    plt.show()
    #plt.pause(5)
    #choice = input()
    #plt.close()
    
#IF YOU'RE HAVING PROBLEMS< REMEMBER TO ADD THE PATH LIBRARY/BIN and ANACONDA TO SYSTEM PATH