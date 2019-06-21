*************************************************************************
   ____  ____ 
  /   /\/   / 
 /___/  \  /   
 \   \   \/    © Copyright 2018 Xilinx, Inc. All rights reserved.
  \   \        This file contains confidential and proprietary 
  /   /        information of Xilinx, Inc. and is protected under U.S. 
 /___/   /\    and international copyright and other intellectual 
 \   \  /  \   property laws. 
  \___\/\___\ 
 
*************************************************************************

Vendor: Xilinx 
Current readme.txt Version: 1.0
Date Last Modified:  08NOV2018
Date Created: 08NOV2018

Associated Filename: rdf0477-zcu1275-system-controller-2018-3.zip
Associated Document: UG1285, ZCU1275 Characterization Board User Guide

Supported Device(s): Zynq® UltraScale+™ RFSoC 
   
*************************************************************************

Disclaimer: 

      This disclaimer is not a license and does not grant any rights to 
      the materials distributed herewith. Except as otherwise provided in 
      a valid license issued to you by Xilinx, and to the maximum extent 
      permitted by applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE 
      "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL 
      WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
      INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, 
      NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and 
      (2) Xilinx shall not be liable (whether in contract or tort, 
      including negligence, or under any other theory of liability) for 
      any loss or damage of any kind or nature related to, arising under 
      or in connection with these materials, including for any direct, or 
      any indirect, special, incidental, or consequential loss or damage 
      (including loss of data, profits, goodwill, or any type of loss or 
      damage suffered as a result of any action brought by a third party) 
      even if such damage or loss was reasonably foreseeable or Xilinx 
      had been advised of the possibility of the same.

Critical Applications:

      Xilinx products are not designed or intended to be fail-safe, or 
      for use in any application requiring fail-safe performance, such as 
      life-support or safety devices or systems, Class III medical 
      devices, nuclear facilities, applications related to the deployment 
      of airbags, or any other applications that could lead to death, 
      personal injury, or severe property or environmental damage 
      (individually and collectively, "Critical Applications"). Customer 
      assumes the sole risk and liability of any use of Xilinx products 
      in Critical Applications, subject only to applicable laws and 
      regulations governing limitations on product liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS 
FILE AT ALL TIMES.

*************************************************************************

This readme file contains these sections:

1. REVISION HISTORY
2. OVERVIEW
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. DESIGN FILE HIERARCHY
5. INSTALLATION AND OPERATING INSTRUCTIONS
6. OTHER INFORMATION (OPTIONAL)
7. SUPPORT


1. REVISION HISTORY 

            Readme  
Date        Version      Revision Description
=========================================================================
08NOV2018   1.0          Initial Xilinx release.
=========================================================================



2. OVERVIEW

This readme describes how to use the files that come with UG1285

The design includes the System Controller User Interface (SCUI) and 
clock files for configuring the SuperClock-RF2 module clocks sources.


3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS

* Windows 7
* USB port on host computer
* Xilinx Vivado 2013.1 or higher

4. DESIGN FILE HIERARCHY

<Describe the file hierarchy by type (HDL files, simulation files, etc.)>

<For example:>
The directory structure underneath this top-level folder is described 
below:

\BoardUI
 |   This folder contains the BoardUI.exe executable for launching the SCUI.
 |       
 +-----  \tests\ZCU1275\clockFiles
 |       Contains directories for each pll on the SuperClock-RF2.  Do not
 |       change the name of any of the directories in this structure or the
 |       SCUI will not work.
 |       
 |           +--\lmk04208
 |           Contains txt files with register values for configuring the 
 |           lmk04208.  The target frequency for each file is in the filename.
 |
 |           +--\lmx2592a
 |           Contains txt files with register values for configuring the 
 |           lmx2592a.  The target frequency for each file is in the filename.
 |
 |           +--\lmx2592b
 |           Contains txt files with register values for configuring the 
 |           lmx2592a.  The target frequency for each file is in the filename.
 |
 |           +--\lmx2592c
 |           Contains txt files with register values for configuring the 
 |           lmx2592a.  The target frequency for each file is in the filename.
 |
\Firmware
 |   This folder contains the BoardUI.exe executable for launching the SCUI.



5. INSTALLATION AND OPERATING INSTRUCTIONS 

Refer to UG1285 Appendix D for information on using the SCUI

To reprogram or update the system controller firmware follow these steps.
1) Plug the Xilinx Platform USB-II Cable into J3
2) Install Jumper onto J61 header with board power Off
3) Turn Board Power On
4) Remove Jumper J61
5) Open Vivado Hardware Manager
7) Click "Open target -> Auto Connect"
8) On the right side click "xc7z010_1" and then click "Add Configuration Memory Device..."
9) Scroll down in the bottom window of the popup dialog until you see "n25q128-qspi-x4-single".
10) With "n25q128-qspi-x4-single" selected, click 'OK'
11) Click 'OK' on the next dialog indicating you want to program the device now.
12) Click the "..." next to "Configuration file:" and navigate to "\Firmware\BOOT.bin" or the
      firmware update BOOT.bin.
13) Click the "..." next to "Zynq FSBL" and navigate to "\Firmware\zynq_1b_debug_fsbl.elf".
14) Change the Address Range to "Entire Configuration Memory Device"
15) Click 'OK' and wait for the device to be programmed.
16) After everything is programed power cycle the board and close out of Vivado


6. OTHER INFORMATION (OPTIONAL) 



7. SUPPORT

To obtain technical support for this reference design, go to 
www.xilinx.com/support to locate answers to known issues in the Xilinx
Answers Database.  
