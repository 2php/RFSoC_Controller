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
    
#channels should be an array of channels    
def plot_waveforms(channels):
    
    scale = 1800/32767
    
    try:
         fig, ax = plt.subplots()
         
         for c in channels:
             #get the experimental waveform
             w_ex = c.experiment_wf
             pre_waveform = w_ex.pre_waveform_wordstream
             #get the pre and post delays
             pre_delay = w_ex.delay / 4 # in nanoseconds
             post_delay = round(w_ex.post_delay * 4) # in nanoseconds
             #get the period
             period = w_ex.period # in nanoseconds
             total_period = c.get_total_period()
             reps = c.repeat_cycles
             #construct the time array
             t = []
             t_now = 0
             t_final = pre_delay + (period * reps) + post_delay + 4
             wave = []
             while(t_now <= t_final):
                 #figure out our current value
                 
                 #if we're in the pre_delay
                 if(t_now < pre_delay):
                     wave.append(0)
                 #if we're in the pre-waveform
                 elif(t_now < (pre_delay + 4)):
                     t_wave = (t_now - pre_delay) % 4
                     wave.append((pre_waveform[round(t_wave * 4)]) * scale)
                 #if we're in the waveform
                 elif(t_now < (pre_delay + 4 + total_period)):
                     #figure our where in the waveform we are
                     t_wave = (t_now - pre_delay - 4) % period
                     wave.append((w_ex.wordstream[round(t_wave * 4)]) * scale)
                 else:
                     wave.append(0)
                
                 #increment our time
                 t.append(t_now)
                 t_now += 0.25
                 
             ax.plot(t, wave, label="channel " + str(c.number+1))
             
         
         
         ax.set(xlabel='Time (ns)', ylabel='Voltage (mV)', title='ADC Waveform')
         ax.grid()
         plt.legend(loc='upper left')
        
         #fig.savefig("test.png")
         plt.show()
        
    except:
       print("Error while attempting to plot waveform data.")
        
        
        