# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 16:07:30 2019

@author: Marandi Group Vivado
"""


import nidaqmx
import time

#Max light at min voltage
#Min light at max voltage

#voltage definitions
vmin = -10
vmax = 10

#internal defines
MIN = 0
MAX = 1
vstep = 0.2
num_avgs = 1
debug = 1
avg_delay = 0.02 #in seconds
num_channels = 4
device_id = "USB-6529"

#channel definitions
input_channels = [device_id + "/ai0", device_id + "/ai1", device_id + "/ai2", device_id + "/ai3"]
output_channels = [device_id + "/ao0", device_id + "/ao1", device_id + "/ao2", device_id + "/ao3"]

def read_channel(number):
    with nidaqmx.Task() as task:
        task.ai_channels.add_ai_voltage_chan(input_channels[number])
        return abs(task.read())

#value should be in volts
def write_channel(number, value):
    with nidaqmx.Task() as task:
        task.ao_channels.add_ao_voltage_chan(output_channels[number])
        task.write([value], auto_start=True)
        
def read_average(channel, num_averages):
    avg = 0
    for i in range(0, num_averages):
        avg += read_channel(channel)/num_averages
        time.sleep(avg_delay)
    return abs(avg)


class IM:
    
    input_channel = 0
    output_channel = 0
    fix_point = MIN
    v_set = None #best known output voltage
    v_best = 0 #best known input voltage
    
    def __init__(self, ic, oc, fp):
        self.input_channel = ic;
        self.output_channel = oc;
        if(fp != MIN and fp != MAX):
            raise Exception("Error, fix point argument must be either IM.MIN or IM.MAX.")
        if(ic >= num_channels or oc >= num_channels):
            raise Exception("Error, channel number must be between 0 and " + str(num_channels - 1))
        self.fix_point = fp
        
    #Sweeps the voltage range and finds the minimum or maximum point    
    def sweep_range(self):
        
        if(debug == 1):
            print("Sweeping voltage range...")
        
        v = vmin;
        v_array = []
        meas_array = []
        while(v <= vmax):
            #set the output channel to the desired voltage
            write_channel(self.output_channel, v)
            
            #read back the value of the PIN diode
            meas_array.append(read_average(self.input_channel, num_avgs))
            v_array.append(v)
            v = round(vstep + v, 1)
            if(debug == 1 and v%1 == 0):
                print("Vout: " + str(v) + ", Vin: " + str(meas_array[len(meas_array)-1]))
        
        target_index = 0
        
        #figure out what point we're looking for
        if(self.fix_point == MAX):
            target_index = meas_array.index(min(meas_array))
            self.v_best = min(meas_array)
        else:
            target_index = meas_array.index(max(meas_array))
            self.v_best = max(meas_array)
    
        target_v = v_array[target_index]
        
        #set our output to the target voltage
        write_channel(self.output_channel, target_v)
        
        if(debug == 1):
            print(("Vmin" if self.fix_point == MIN else "Vmax") + " found at " + str(target_v))
        
        self.v_set = target_v
        
    
    def optimize(self):   
        
        if(debug == 1):
            print("Optmimxing, v_set = " + str(self.v_set) + ", v_best = " + str(self.v_best))
        
        if(self.v_set == None):
            self.sweep_range()
            
        #if we're not about to exceed max voltage
        if(self.v_set + vstep <= vmax):
                
            #Go up one voltage step
            write_channel(self.output_channel, round(self.v_set + vstep, 1))
            
            #measure the PIN voltage
            v_meas = read_average(self.input_channel, num_avgs)
            
            #if that was better and we're looking for a maximum
            if(v_meas < self.v_best and self.fix_point == MAX):
                #update our output voltage and v_best
                self.v_best = v_meas
                self.v_set = round(self.v_set + vstep, 1)
                #we're done
                return
            
            
            #if that was better and we're looking for a minimum
            if(v_meas > self.v_best and self.fix_point == MIN):
                #update our output voltage and v_best
                self.v_best = v_meas
                self.v_set = round(self.v_set + vstep, 1)
                #we're done
                return   
            
            #Must have been worse, go back to set point
            write_channel(self.output_channel, self.v_set)
        
        #if we're not about to exceed min voltage
        if(self.v_set - vstep >= vmin):
        
            #If not, must have been worse try the other direction
            
            #Go down one voltage step
            write_channel(self.output_channel, round(self.v_set - vstep, 1))
            
            #measure the PIN voltage
            v_meas = read_average(self.input_channel, num_avgs)
            
            #if that was better and we're looking for a maximum
            if(v_meas < self.v_best and self.fix_point == MAX):
                #update our output voltage and v_best
                self.v_best = v_meas
                self.v_set = round(self.v_set - vstep, 1)
                #we're done
                return
            
            
            #if that was better and we're looking for a minimum
            if(v_meas > self.v_best and self.fix_point == MIN):
                #update our output voltage and v_best
                self.v_best = v_meas
                self.v_set = round(self.v_set - vstep, 1)
                #we're done
                return
            
            #Must have been worse, go back to set point
            write_channel(self.output_channel, self.v_set)