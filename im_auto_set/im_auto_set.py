# -*- coding: utf-8 -*-
"""
Created on Mon Aug 19 14:41:50 2019

@author: Marandi Group Vivado
"""




from tkinter import *
import im as IM
import re

root = Tk()

#size of the window
root.geometry("800x150")

class Window(Frame):

    sweep_buttons = [] #list of our sweep buttons
    min_max_menus = []
    min_max_old = []
    im_list = []
    status_labels = []#list of the status labels
    v_set_labels = []
    v_read_labels = []
    v_manual_boxes = []

    def __init__(self, master=None):
        Frame.__init__(self, master)                 
        self.master = master
        self.init_window()
        
        #populate the IM list
        for i in range(0, IM.num_channels):
            self.im_list.append(IM.IM(i, i, IM.MIN))

    #Creation of init_window
    def init_window(self):

        # changing the title of our master widget      
        self.master.title("Intensity Modulator Control")

        # allowing the widget to take the full space of the root window
        #self.pack(fill=BOTH, expand=1)
        self.grid(row = 0, column = 0)
        
        #Make the sweep buttons
        for i in range(0, IM.num_channels):
            sb = Button(self, text="Sweep Channel " + str(i), command= lambda n = i: self.handle_sweep_button(n))
            self.sweep_buttons.append(sb)
            sb.grid(column = 0, row = i, padx = 10)
            
       
        
        #make the min max menus
        for i in range(0, IM.num_channels):
            
            # Create a Tkinter variable for the min max menu
            tkvar = StringVar(root)
            
            # Dictionary with options
            choices = {'min', 'max'}
            tkvar.set('min') # set the default option
            popupMenu = OptionMenu(self, tkvar, *choices)
            Label(self, text="Set point:").grid(row = i, column = 1)
            popupMenu.grid(row = i, column =2)
            #tkvar.trace('w', self.change_dropdown)
            tkvar.trace('w', self.change_dropdown)
            self.min_max_menus.append(tkvar)
            self.min_max_old.append('min')
            
        #make the status label, set voltage label and read voltage label
        for i in range(0, IM.num_channels):
            
            #status label
            sl_textvar = StringVar(root)
            sl_textvar.set("Status: IDLE     ")
            sl = Label(self, textvar = sl_textvar)
            sl.grid(row = i, column = 3)
            self.status_labels.append(sl_textvar)
            
            
            #Vset labels
            vs_textvar = StringVar(root)
            vs_textvar.set("Vset: 0.0V")
            vs = Label(self, textvar = vs_textvar)
            vs.grid(row = i, column = 4)
            self.v_set_labels.append(vs_textvar)
            
            #Vread labels
            vr_textvar = StringVar(root)
            vr_textvar.set("Vread: 0.0V")
            vr = Label(self, textvar=vr_textvar)
            vr.grid(row = i, column = 5)
            self.v_read_labels.append(vr_textvar)
        
        #Make the manual votlage entry boxes
        for i in range(0, IM.num_channels):
            
            #make the label for the box
            Label(self, text="Manual entry:").grid(row = i, column = 6)
            
            #make the text box
            e1 = Entry(self)
            e1.grid(row = i, column = 7)
            self.v_manual_boxes.append(e1)
            
            #make the button
            vb = Button(self, text="Set Voltage", command= lambda n = i: self.set_manual_voltage(n))
            vb.grid(row = i, column = 8, padx = 10)
            
        
    def client_exit(self):
        print("Exiting...")
        exit()
        
    def set_manual_voltage(self, channel_num):
        
        #Get the voltage
        v_str = self.v_manual_boxes[channel_num].get()
        
        try:
            v = float(v_str)
            IM.write_channel(channel_num, v)
            self.v_manual_boxes[channel_num].config({"background": "White"})
            #update vset and vread
            self.v_read_labels[channel_num].set("Vread: " + str(round(IM.read_average(channel_num, IM.num_avgs), 3)) + " V")
            self.v_set_labels[channel_num].set("Vset: " + str(round(v, 3)) + " V")
        except:
            print("Error while parsing voltage, voltage was: " + v_str)
            self.v_manual_boxes[channel_num].config({"background": "Red"})
        
    def handle_sweep_button(self, channel_num):
        
        #Disable this button
        self.sweep_buttons[channel_num].config(state="disabled")
        
        #Change the channel status to sweeping
        self.status_labels[channel_num].set("Status: SWEEPING")
        root.update()
        
        #Sweep the associated channel
        self.im_list[channel_num].sweep_range()
        
        #update the labels
        self.v_read_labels[channel_num].set("Vread: " + str(round(self.im_list[channel_num].v_best, 3)) + " V")
        self.v_set_labels[channel_num].set("Vset: " + str(round(self.im_list[channel_num].v_set, 3)) + " V")
        
        #Change the channel status to idle
        self.status_labels[channel_num].set("Status: IDLE    ")
        
        #enable the button
        self.sweep_buttons[channel_num].config(state="normal")

        
    def change_dropdown(self, *args):
        
        
        #check which one changed
        channel_num = -1
        i = 0
        for setting in self.min_max_menus:
            if(setting.get() != self.min_max_old[i]):
                channel_num = i
                self.min_max_old[i] = setting.get()
                break
            else:
                i += 1
        
        if(channel_num == -1):
            print("Error, no channel changes detected")
            return
            
        #get the channel number
        #channel_num = (int(re.search(r'\d+', args[0]).group())+1)%IM.num_channels
        print("Handling channel " + str(channel_num))
        #figure out the current setting
        setting = self.min_max_menus[channel_num]
        
        #change the channel setting
        self.im_list[channel_num].fix_point = IM.MAX if setting.get() == "max" else IM.MIN
        
        
        
        
        #print("Dropdown for " + str(channel_num) + " was changed...")




app = Window(root)
root.mainloop() 

