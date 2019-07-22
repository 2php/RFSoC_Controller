
################################################################
# This is a generated script based on design: top_level
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source top_level_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# channel_select

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu29dr-ffvf1760-2-e
   set_property BOARD_PART xilinx.com:zcu1275:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name top_level

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB

  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB


  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set adc0_clk_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc0_clk_0 ]

  set app_leds [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 app_leds ]

  set dac0_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {4000000000.0} \
   ] $dac0_clk

  set dac1_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac1_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000.0} \
   ] $dac1_clk

  set dac2_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac2_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000.0} \
   ] $dac2_clk

  set dac3_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac3_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000.0} \
   ] $dac3_clk

  set diff_clock_rtl [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 diff_clock_rtl ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $diff_clock_rtl

  set sysref_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in ]

  set vin00_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin00_0 ]

  set vout00 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00 ]

  set vout01 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout01 ]

  set vout02 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout02 ]

  set vout03 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout03 ]

  set vout10 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout10 ]

  set vout11 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout11 ]

  set vout12 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout12 ]

  set vout13 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout13 ]

  set vout20 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout20 ]

  set vout21 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout21 ]

  set vout22 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout22 ]

  set vout23 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout23 ]

  set vout30 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout30 ]

  set vout31 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout31 ]

  set vout32 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout32 ]

  set vout33 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout33 ]


  # Create ports
  set ext_trigger_0_0 [ create_bd_port -dir I ext_trigger_0_0 ]
  set resetn [ create_bd_port -dir I -type rst resetn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $resetn
  set rx_0 [ create_bd_port -dir I rx_0 ]
  set tx_0 [ create_bd_port -dir O tx_0 ]

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_ALL_OUTPUTS_2 {1} \
   CONFIG.C_GPIO2_WIDTH {16} \
   CONFIG.C_GPIO_WIDTH {8} \
   CONFIG.C_IS_DUAL {1} \
   CONFIG.GPIO2_BOARD_INTERFACE {Custom} \
   CONFIG.GPIO_BOARD_INTERFACE {app_leds} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_0

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {115200} \
 ] $axi_uartlite_0

  # Create instance: channel_select_0, and set properties
  set block_name channel_select
  set block_cell_name channel_select_0
  if { [catch {set channel_select_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $channel_select_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_1 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
   CONFIG.CLKOUT1_JITTER {101.475} \
   CONFIG.CLKOUT1_PHASE_ERROR {77.836} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {4.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {3.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.PRIM_IN_FREQ {300.000} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.USE_LOCKED {true} \
 ] $clk_wiz_1

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_SIZE {32} \
   CONFIG.C_M_AXI_ADDR_WIDTH {32} \
   CONFIG.C_USE_UART {1} \
 ] $mdm_1

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_FSL_LINKS {16} \
   CONFIG.C_I_LMB {1} \
   CONFIG.C_USE_EXTENDED_FSL_INSTR {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {4} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: proc_sys_reset_2, and set properties
  set proc_sys_reset_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_2 ]

  # Create instance: proc_sys_reset_3, and set properties
  set proc_sys_reset_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_3 ]

  # Create instance: proc_sys_reset_4, and set properties
  set proc_sys_reset_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_4 ]

  # Create instance: rfsoc_adc_data_captu_0, and set properties
  set rfsoc_adc_data_captu_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_adc_data_capture:1.0 rfsoc_adc_data_captu_0 ]

  # Create instance: rfsoc_data_pipeline_0, and set properties
  set rfsoc_data_pipeline_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_0 ]

  # Create instance: rfsoc_data_pipeline_1, and set properties
  set rfsoc_data_pipeline_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_1 ]

  # Create instance: rfsoc_data_pipeline_2, and set properties
  set rfsoc_data_pipeline_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_2 ]

  # Create instance: rfsoc_data_pipeline_3, and set properties
  set rfsoc_data_pipeline_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_3 ]

  # Create instance: rfsoc_data_pipeline_4, and set properties
  set rfsoc_data_pipeline_4 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_4 ]

  # Create instance: rfsoc_data_pipeline_5, and set properties
  set rfsoc_data_pipeline_5 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_5 ]

  # Create instance: rfsoc_data_pipeline_6, and set properties
  set rfsoc_data_pipeline_6 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_6 ]

  # Create instance: rfsoc_data_pipeline_7, and set properties
  set rfsoc_data_pipeline_7 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_7 ]

  # Create instance: rfsoc_data_pipeline_8, and set properties
  set rfsoc_data_pipeline_8 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_8 ]

  # Create instance: rfsoc_data_pipeline_9, and set properties
  set rfsoc_data_pipeline_9 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_9 ]

  # Create instance: rfsoc_data_pipeline_10, and set properties
  set rfsoc_data_pipeline_10 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_10 ]

  # Create instance: rfsoc_data_pipeline_11, and set properties
  set rfsoc_data_pipeline_11 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_11 ]

  # Create instance: rfsoc_data_pipeline_12, and set properties
  set rfsoc_data_pipeline_12 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_12 ]

  # Create instance: rfsoc_data_pipeline_13, and set properties
  set rfsoc_data_pipeline_13 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_13 ]

  # Create instance: rfsoc_data_pipeline_14, and set properties
  set rfsoc_data_pipeline_14 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_14 ]

  # Create instance: rfsoc_data_pipeline_15, and set properties
  set rfsoc_data_pipeline_15 [ create_bd_cell -type ip -vlnv xilinx.com:user:rfsoc_data_pipeline:1.0 rfsoc_data_pipeline_15 ]

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create instance: trigger_controller_0, and set properties
  set trigger_controller_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:trigger_controller:1.0 trigger_controller_0 ]

  # Create instance: usp_rf_data_converter_0, and set properties
  set usp_rf_data_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:usp_rf_data_converter:2.1 usp_rf_data_converter_0 ]
  set_property -dict [ list \
   CONFIG.ADC0_Enable {1} \
   CONFIG.ADC0_Fabric_Freq {250.000} \
   CONFIG.ADC0_PLL_Enable {true} \
   CONFIG.ADC0_Refclk_Freq {250.000} \
   CONFIG.ADC_Decimation_Mode00 {1} \
   CONFIG.ADC_Dither00 {true} \
   CONFIG.ADC_Mixer_Type00 {0} \
   CONFIG.ADC_Slice00_Enable {true} \
   CONFIG.DAC0_Enable {1} \
   CONFIG.DAC0_Fabric_Freq {250.000} \
   CONFIG.DAC0_Outclk_Freq {250.000} \
   CONFIG.DAC0_PLL_Enable {true} \
   CONFIG.DAC0_Refclk_Freq {250.000} \
   CONFIG.DAC0_Sampling_Rate {4} \
   CONFIG.DAC1_Enable {1} \
   CONFIG.DAC1_Fabric_Freq {250.000} \
   CONFIG.DAC1_Outclk_Freq {250.000} \
   CONFIG.DAC1_PLL_Enable {true} \
   CONFIG.DAC1_Refclk_Freq {250.000} \
   CONFIG.DAC1_Sampling_Rate {4} \
   CONFIG.DAC2_Enable {1} \
   CONFIG.DAC2_Fabric_Freq {250.000} \
   CONFIG.DAC2_Outclk_Freq {250.000} \
   CONFIG.DAC2_PLL_Enable {true} \
   CONFIG.DAC2_Refclk_Freq {250.000} \
   CONFIG.DAC2_Sampling_Rate {4} \
   CONFIG.DAC3_Enable {1} \
   CONFIG.DAC3_Fabric_Freq {250.000} \
   CONFIG.DAC3_Outclk_Freq {250.000} \
   CONFIG.DAC3_PLL_Enable {true} \
   CONFIG.DAC3_Refclk_Freq {250.000} \
   CONFIG.DAC3_Sampling_Rate {4} \
   CONFIG.DAC_Interpolation_Mode00 {1} \
   CONFIG.DAC_Interpolation_Mode01 {1} \
   CONFIG.DAC_Interpolation_Mode02 {1} \
   CONFIG.DAC_Interpolation_Mode03 {1} \
   CONFIG.DAC_Interpolation_Mode10 {1} \
   CONFIG.DAC_Interpolation_Mode11 {1} \
   CONFIG.DAC_Interpolation_Mode12 {1} \
   CONFIG.DAC_Interpolation_Mode13 {1} \
   CONFIG.DAC_Interpolation_Mode20 {1} \
   CONFIG.DAC_Interpolation_Mode21 {1} \
   CONFIG.DAC_Interpolation_Mode22 {1} \
   CONFIG.DAC_Interpolation_Mode23 {1} \
   CONFIG.DAC_Interpolation_Mode30 {1} \
   CONFIG.DAC_Interpolation_Mode31 {1} \
   CONFIG.DAC_Interpolation_Mode32 {1} \
   CONFIG.DAC_Interpolation_Mode33 {1} \
   CONFIG.DAC_Mixer_Type00 {0} \
   CONFIG.DAC_Mixer_Type01 {0} \
   CONFIG.DAC_Mixer_Type02 {0} \
   CONFIG.DAC_Mixer_Type03 {0} \
   CONFIG.DAC_Mixer_Type10 {0} \
   CONFIG.DAC_Mixer_Type11 {0} \
   CONFIG.DAC_Mixer_Type12 {0} \
   CONFIG.DAC_Mixer_Type13 {0} \
   CONFIG.DAC_Mixer_Type20 {0} \
   CONFIG.DAC_Mixer_Type21 {0} \
   CONFIG.DAC_Mixer_Type22 {0} \
   CONFIG.DAC_Mixer_Type23 {0} \
   CONFIG.DAC_Mixer_Type30 {0} \
   CONFIG.DAC_Mixer_Type31 {0} \
   CONFIG.DAC_Mixer_Type32 {0} \
   CONFIG.DAC_Mixer_Type33 {0} \
   CONFIG.DAC_Slice00_Enable {true} \
   CONFIG.DAC_Slice01_Enable {true} \
   CONFIG.DAC_Slice02_Enable {true} \
   CONFIG.DAC_Slice03_Enable {true} \
   CONFIG.DAC_Slice10_Enable {true} \
   CONFIG.DAC_Slice11_Enable {true} \
   CONFIG.DAC_Slice12_Enable {true} \
   CONFIG.DAC_Slice13_Enable {true} \
   CONFIG.DAC_Slice20_Enable {true} \
   CONFIG.DAC_Slice21_Enable {true} \
   CONFIG.DAC_Slice22_Enable {true} \
   CONFIG.DAC_Slice23_Enable {true} \
   CONFIG.DAC_Slice30_Enable {true} \
   CONFIG.DAC_Slice31_Enable {true} \
   CONFIG.DAC_Slice32_Enable {true} \
   CONFIG.DAC_Slice33_Enable {true} \
 ] $usp_rf_data_converter_0

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create interface connections
  connect_bd_intf_net -intf_net adc0_clk_0_1 [get_bd_intf_ports adc0_clk_0] [get_bd_intf_pins usp_rf_data_converter_0/adc0_clk]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports app_leds] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net dac0_clk_1 [get_bd_intf_ports dac0_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac0_clk]
  connect_bd_intf_net -intf_net dac1_clk_1 [get_bd_intf_ports dac1_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac1_clk]
  connect_bd_intf_net -intf_net dac2_clk_1 [get_bd_intf_ports dac2_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac2_clk]
  connect_bd_intf_net -intf_net dac3_clk_1 [get_bd_intf_ports dac3_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac3_clk]
  connect_bd_intf_net -intf_net diff_clock_rtl_1 [get_bd_intf_ports diff_clock_rtl] [get_bd_intf_pins clk_wiz_1/CLK_IN1_D]
  connect_bd_intf_net -intf_net microblaze_0_M0_AXIS [get_bd_intf_pins microblaze_0/M0_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_0/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M10_AXIS [get_bd_intf_pins microblaze_0/M10_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_10/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M11_AXIS [get_bd_intf_pins microblaze_0/M11_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_11/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M12_AXIS [get_bd_intf_pins microblaze_0/M12_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_12/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M13_AXIS [get_bd_intf_pins microblaze_0/M13_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_13/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M14_AXIS [get_bd_intf_pins microblaze_0/M14_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_14/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M15_AXIS [get_bd_intf_pins microblaze_0/M15_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_15/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M1_AXIS [get_bd_intf_pins microblaze_0/M1_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_1/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M2_AXIS [get_bd_intf_pins microblaze_0/M2_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_2/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M3_AXIS [get_bd_intf_pins microblaze_0/M3_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_3/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M4_AXIS [get_bd_intf_pins microblaze_0/M4_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_4/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M5_AXIS [get_bd_intf_pins microblaze_0/M5_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_5/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M6_AXIS [get_bd_intf_pins microblaze_0/M6_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_6/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M7_AXIS [get_bd_intf_pins microblaze_0/M7_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_7/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M8_AXIS [get_bd_intf_pins microblaze_0/M8_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_8/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M9_AXIS [get_bd_intf_pins microblaze_0/M9_AXIS] [get_bd_intf_pins rfsoc_data_pipeline_9/S_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI] [get_bd_intf_pins usp_rf_data_converter_0/s_axi]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins mdm_1/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net rfsoc_adc_data_captu_0_M_AXIS_0 [get_bd_intf_pins microblaze_0/S0_AXIS] [get_bd_intf_pins rfsoc_adc_data_captu_0/M_AXIS_0]
  connect_bd_intf_net -intf_net rfsoc_adc_data_captu_0_M_AXIS_1 [get_bd_intf_pins microblaze_0/S1_AXIS] [get_bd_intf_pins rfsoc_adc_data_captu_0/M_AXIS_1]
  connect_bd_intf_net -intf_net rfsoc_adc_data_captu_0_M_AXIS_2 [get_bd_intf_pins microblaze_0/S2_AXIS] [get_bd_intf_pins rfsoc_adc_data_captu_0/M_AXIS_2]
  connect_bd_intf_net -intf_net rfsoc_adc_data_captu_0_M_AXIS_3 [get_bd_intf_pins microblaze_0/S3_AXIS] [get_bd_intf_pins rfsoc_adc_data_captu_0/M_AXIS_3]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_0_m_axis_0 [get_bd_intf_pins rfsoc_data_pipeline_0/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s00_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_10_m_axis [get_bd_intf_pins rfsoc_data_pipeline_10/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s22_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_11_m_axis [get_bd_intf_pins rfsoc_data_pipeline_11/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s23_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_12_m_axis [get_bd_intf_pins rfsoc_data_pipeline_12/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s30_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_13_m_axis [get_bd_intf_pins rfsoc_data_pipeline_13/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s31_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_14_m_axis [get_bd_intf_pins rfsoc_data_pipeline_14/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s32_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_15_m_axis [get_bd_intf_pins rfsoc_data_pipeline_15/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s33_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_1_m_axis_0 [get_bd_intf_pins rfsoc_data_pipeline_1/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s01_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_2_m_axis_0 [get_bd_intf_pins rfsoc_data_pipeline_2/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s02_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_3_m_axis_0 [get_bd_intf_pins rfsoc_data_pipeline_3/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s03_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_4_m_axis [get_bd_intf_pins rfsoc_data_pipeline_4/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s10_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_5_m_axis [get_bd_intf_pins rfsoc_data_pipeline_5/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s11_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_6_m_axis [get_bd_intf_pins rfsoc_data_pipeline_6/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s12_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_7_m_axis [get_bd_intf_pins rfsoc_data_pipeline_7/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s13_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_8_m_axis [get_bd_intf_pins rfsoc_data_pipeline_8/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s20_axis]
  connect_bd_intf_net -intf_net rfsoc_data_pipeline_9_m_axis [get_bd_intf_pins rfsoc_data_pipeline_9/m_axis] [get_bd_intf_pins usp_rf_data_converter_0/s21_axis]
  connect_bd_intf_net -intf_net sysref_in_1 [get_bd_intf_ports sysref_in] [get_bd_intf_pins usp_rf_data_converter_0/sysref_in]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m00_axis [get_bd_intf_pins rfsoc_adc_data_captu_0/s_axis] [get_bd_intf_pins usp_rf_data_converter_0/m00_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout00 [get_bd_intf_ports vout00] [get_bd_intf_pins usp_rf_data_converter_0/vout00]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout01 [get_bd_intf_ports vout01] [get_bd_intf_pins usp_rf_data_converter_0/vout01]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout02 [get_bd_intf_ports vout02] [get_bd_intf_pins usp_rf_data_converter_0/vout02]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout03 [get_bd_intf_ports vout03] [get_bd_intf_pins usp_rf_data_converter_0/vout03]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout10 [get_bd_intf_ports vout10] [get_bd_intf_pins usp_rf_data_converter_0/vout10]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout11 [get_bd_intf_ports vout11] [get_bd_intf_pins usp_rf_data_converter_0/vout11]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout12 [get_bd_intf_ports vout12] [get_bd_intf_pins usp_rf_data_converter_0/vout12]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout13 [get_bd_intf_ports vout13] [get_bd_intf_pins usp_rf_data_converter_0/vout13]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout20 [get_bd_intf_ports vout20] [get_bd_intf_pins usp_rf_data_converter_0/vout20]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout21 [get_bd_intf_ports vout21] [get_bd_intf_pins usp_rf_data_converter_0/vout21]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout22 [get_bd_intf_ports vout22] [get_bd_intf_pins usp_rf_data_converter_0/vout22]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout23 [get_bd_intf_ports vout23] [get_bd_intf_pins usp_rf_data_converter_0/vout23]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout30 [get_bd_intf_ports vout30] [get_bd_intf_pins usp_rf_data_converter_0/vout30]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout31 [get_bd_intf_ports vout31] [get_bd_intf_pins usp_rf_data_converter_0/vout31]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout32 [get_bd_intf_ports vout32] [get_bd_intf_pins usp_rf_data_converter_0/vout32]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout33 [get_bd_intf_ports vout33] [get_bd_intf_pins usp_rf_data_converter_0/vout33]
  connect_bd_intf_net -intf_net vin00_0_1 [get_bd_intf_ports vin00_0] [get_bd_intf_pins usp_rf_data_converter_0/vin00]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins axi_gpio_0/gpio2_io_o] [get_bd_pins channel_select_0/gpio_in] [get_bd_pins rfsoc_adc_data_captu_0/gpio_in] [get_bd_pins rfsoc_data_pipeline_0/gpio_in] [get_bd_pins rfsoc_data_pipeline_1/gpio_in] [get_bd_pins rfsoc_data_pipeline_10/gpio_in] [get_bd_pins rfsoc_data_pipeline_11/gpio_in] [get_bd_pins rfsoc_data_pipeline_12/gpio_in] [get_bd_pins rfsoc_data_pipeline_13/gpio_in] [get_bd_pins rfsoc_data_pipeline_14/gpio_in] [get_bd_pins rfsoc_data_pipeline_15/gpio_in] [get_bd_pins rfsoc_data_pipeline_2/gpio_in] [get_bd_pins rfsoc_data_pipeline_3/gpio_in] [get_bd_pins rfsoc_data_pipeline_4/gpio_in] [get_bd_pins rfsoc_data_pipeline_5/gpio_in] [get_bd_pins rfsoc_data_pipeline_6/gpio_in] [get_bd_pins rfsoc_data_pipeline_7/gpio_in] [get_bd_pins rfsoc_data_pipeline_8/gpio_in] [get_bd_pins rfsoc_data_pipeline_9/gpio_in] [get_bd_pins trigger_controller_0/gpio_in]
  connect_bd_net -net Net1 [get_bd_pins proc_sys_reset_1/peripheral_aresetn] [get_bd_pins rfsoc_data_pipeline_4/rf_resetn] [get_bd_pins rfsoc_data_pipeline_5/rf_resetn] [get_bd_pins rfsoc_data_pipeline_6/rf_resetn] [get_bd_pins rfsoc_data_pipeline_7/rf_resetn] [get_bd_pins usp_rf_data_converter_0/s1_axis_aresetn]
  connect_bd_net -net Net2 [get_bd_pins proc_sys_reset_2/peripheral_aresetn] [get_bd_pins rfsoc_data_pipeline_10/rf_resetn] [get_bd_pins rfsoc_data_pipeline_11/rf_resetn] [get_bd_pins rfsoc_data_pipeline_8/rf_resetn] [get_bd_pins rfsoc_data_pipeline_9/rf_resetn] [get_bd_pins usp_rf_data_converter_0/s2_axis_aresetn]
  connect_bd_net -net Net3 [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins rfsoc_data_pipeline_0/rf_clock] [get_bd_pins rfsoc_data_pipeline_1/rf_clock] [get_bd_pins rfsoc_data_pipeline_2/rf_clock] [get_bd_pins rfsoc_data_pipeline_3/rf_clock] [get_bd_pins trigger_controller_0/rf_clk] [get_bd_pins usp_rf_data_converter_0/clk_dac0] [get_bd_pins usp_rf_data_converter_0/s0_axis_aclk]
  connect_bd_net -net Net4 [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins rfsoc_data_pipeline_0/rf_resetn] [get_bd_pins rfsoc_data_pipeline_1/rf_resetn] [get_bd_pins rfsoc_data_pipeline_2/rf_resetn] [get_bd_pins rfsoc_data_pipeline_3/rf_resetn] [get_bd_pins trigger_controller_0/rf_reset] [get_bd_pins usp_rf_data_converter_0/s0_axis_aresetn]
  connect_bd_net -net axi_uartlite_0_tx [get_bd_ports tx_0] [get_bd_pins axi_uartlite_0/tx]
  connect_bd_net -net channel_select_0_ch0 [get_bd_pins channel_select_0/ch0] [get_bd_pins rfsoc_data_pipeline_0/is_selected]
  connect_bd_net -net channel_select_0_ch1 [get_bd_pins channel_select_0/ch1] [get_bd_pins rfsoc_data_pipeline_1/is_selected]
  connect_bd_net -net channel_select_0_ch2 [get_bd_pins channel_select_0/ch2] [get_bd_pins rfsoc_data_pipeline_2/is_selected]
  connect_bd_net -net channel_select_0_ch3 [get_bd_pins channel_select_0/ch3] [get_bd_pins rfsoc_data_pipeline_3/is_selected]
  connect_bd_net -net channel_select_0_ch4 [get_bd_pins channel_select_0/ch4] [get_bd_pins rfsoc_data_pipeline_4/is_selected]
  connect_bd_net -net channel_select_0_ch5 [get_bd_pins channel_select_0/ch5] [get_bd_pins rfsoc_data_pipeline_5/is_selected]
  connect_bd_net -net channel_select_0_ch6 [get_bd_pins channel_select_0/ch6] [get_bd_pins rfsoc_data_pipeline_6/is_selected]
  connect_bd_net -net channel_select_0_ch7 [get_bd_pins channel_select_0/ch7] [get_bd_pins rfsoc_data_pipeline_7/is_selected]
  connect_bd_net -net channel_select_0_ch8 [get_bd_pins channel_select_0/ch8] [get_bd_pins rfsoc_data_pipeline_8/is_selected]
  connect_bd_net -net channel_select_0_ch9 [get_bd_pins channel_select_0/ch9] [get_bd_pins rfsoc_data_pipeline_9/is_selected]
  connect_bd_net -net channel_select_0_ch10 [get_bd_pins channel_select_0/ch10] [get_bd_pins rfsoc_data_pipeline_10/is_selected]
  connect_bd_net -net channel_select_0_ch11 [get_bd_pins channel_select_0/ch11] [get_bd_pins rfsoc_data_pipeline_11/is_selected]
  connect_bd_net -net channel_select_0_ch12 [get_bd_pins channel_select_0/ch12] [get_bd_pins rfsoc_data_pipeline_12/is_selected]
  connect_bd_net -net channel_select_0_ch13 [get_bd_pins channel_select_0/ch13] [get_bd_pins rfsoc_data_pipeline_13/is_selected]
  connect_bd_net -net channel_select_0_ch14 [get_bd_pins channel_select_0/ch14] [get_bd_pins rfsoc_data_pipeline_14/is_selected]
  connect_bd_net -net channel_select_0_ch15 [get_bd_pins channel_select_0/ch15] [get_bd_pins rfsoc_data_pipeline_15/is_selected]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net ext_trigger_0_0_1 [get_bd_ports ext_trigger_0_0] [get_bd_pins trigger_controller_0/ext_trigger_in]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins clk_wiz_1/reset] [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins proc_sys_reset_0/mb_debug_sys_rst] [get_bd_pins proc_sys_reset_1/mb_debug_sys_rst] [get_bd_pins proc_sys_reset_2/mb_debug_sys_rst] [get_bd_pins proc_sys_reset_3/mb_debug_sys_rst] [get_bd_pins proc_sys_reset_4/mb_debug_sys_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins channel_select_0/mb_clk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins mdm_1/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rfsoc_adc_data_captu_0/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_0/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_1/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_10/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_11/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_12/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_13/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_14/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_15/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_2/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_3/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_4/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_5/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_6/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_7/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_8/microblaze_clk] [get_bd_pins rfsoc_data_pipeline_9/microblaze_clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins trigger_controller_0/microblaze_clk] [get_bd_pins usp_rf_data_converter_0/s_axi_aclk]
  connect_bd_net -net proc_sys_reset_3_peripheral_aresetn [get_bd_pins proc_sys_reset_3/peripheral_aresetn] [get_bd_pins rfsoc_data_pipeline_12/rf_resetn] [get_bd_pins rfsoc_data_pipeline_13/rf_resetn] [get_bd_pins rfsoc_data_pipeline_14/rf_resetn] [get_bd_pins rfsoc_data_pipeline_15/rf_resetn] [get_bd_pins usp_rf_data_converter_0/s3_axis_aresetn]
  connect_bd_net -net proc_sys_reset_4_peripheral_aresetn [get_bd_pins proc_sys_reset_4/peripheral_aresetn] [get_bd_pins rfsoc_adc_data_captu_0/rf_reset] [get_bd_pins usp_rf_data_converter_0/m0_axis_aresetn]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net rfsoc_data_pipeline_0_pipeline_active [get_bd_pins rfsoc_data_pipeline_0/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_0]
  connect_bd_net -net rfsoc_data_pipeline_10_pipeline_active [get_bd_pins rfsoc_data_pipeline_10/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_10]
  connect_bd_net -net rfsoc_data_pipeline_11_pipeline_active [get_bd_pins rfsoc_data_pipeline_11/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_11]
  connect_bd_net -net rfsoc_data_pipeline_12_pipeline_active [get_bd_pins rfsoc_data_pipeline_12/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_12]
  connect_bd_net -net rfsoc_data_pipeline_13_pipeline_active [get_bd_pins rfsoc_data_pipeline_13/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_13]
  connect_bd_net -net rfsoc_data_pipeline_14_pipeline_active [get_bd_pins rfsoc_data_pipeline_14/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_14]
  connect_bd_net -net rfsoc_data_pipeline_15_pipeline_active [get_bd_pins rfsoc_data_pipeline_15/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_15]
  connect_bd_net -net rfsoc_data_pipeline_1_pipeline_active [get_bd_pins rfsoc_data_pipeline_1/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_1]
  connect_bd_net -net rfsoc_data_pipeline_2_pipeline_active [get_bd_pins rfsoc_data_pipeline_2/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_2]
  connect_bd_net -net rfsoc_data_pipeline_3_pipeline_active [get_bd_pins rfsoc_data_pipeline_3/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_3]
  connect_bd_net -net rfsoc_data_pipeline_4_pipeline_active [get_bd_pins rfsoc_data_pipeline_4/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_4]
  connect_bd_net -net rfsoc_data_pipeline_5_pipeline_active [get_bd_pins rfsoc_data_pipeline_5/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_5]
  connect_bd_net -net rfsoc_data_pipeline_6_pipeline_active [get_bd_pins rfsoc_data_pipeline_6/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_6]
  connect_bd_net -net rfsoc_data_pipeline_7_pipeline_active [get_bd_pins rfsoc_data_pipeline_7/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_7]
  connect_bd_net -net rfsoc_data_pipeline_8_pipeline_active [get_bd_pins rfsoc_data_pipeline_8/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_8]
  connect_bd_net -net rfsoc_data_pipeline_9_pipeline_active [get_bd_pins rfsoc_data_pipeline_9/pipeline_active] [get_bd_pins trigger_controller_0/pipeline_active_in_9]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins channel_select_0/mb_reset] [get_bd_pins mdm_1/S_AXI_ARESETN] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rfsoc_adc_data_captu_0/microblaze_reset] [get_bd_pins rfsoc_data_pipeline_0/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_1/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_10/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_11/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_12/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_13/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_14/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_15/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_2/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_3/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_4/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_5/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_6/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_7/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_8/microblaze_resetn] [get_bd_pins rfsoc_data_pipeline_9/microblaze_resetn] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn] [get_bd_pins trigger_controller_0/microblaze_reset] [get_bd_pins usp_rf_data_converter_0/s_axi_aresetn]
  connect_bd_net -net rx_0_1 [get_bd_ports rx_0] [get_bd_pins axi_uartlite_0/rx]
  connect_bd_net -net trigger_controller_0_trigger_c0 [get_bd_pins rfsoc_data_pipeline_0/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c0]
  connect_bd_net -net trigger_controller_0_trigger_c1 [get_bd_pins rfsoc_data_pipeline_1/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c1]
  connect_bd_net -net trigger_controller_0_trigger_c2 [get_bd_pins rfsoc_data_pipeline_2/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c2]
  connect_bd_net -net trigger_controller_0_trigger_c3 [get_bd_pins rfsoc_data_pipeline_3/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c3]
  connect_bd_net -net trigger_controller_0_trigger_c4 [get_bd_pins rfsoc_data_pipeline_4/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c4]
  connect_bd_net -net trigger_controller_0_trigger_c5 [get_bd_pins rfsoc_data_pipeline_5/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c5]
  connect_bd_net -net trigger_controller_0_trigger_c6 [get_bd_pins rfsoc_data_pipeline_6/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c6]
  connect_bd_net -net trigger_controller_0_trigger_c7 [get_bd_pins rfsoc_data_pipeline_7/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c7]
  connect_bd_net -net trigger_controller_0_trigger_c8 [get_bd_pins rfsoc_data_pipeline_8/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c8]
  connect_bd_net -net trigger_controller_0_trigger_c9 [get_bd_pins rfsoc_adc_data_captu_0/ext_trigger] [get_bd_pins rfsoc_data_pipeline_9/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c9]
  connect_bd_net -net trigger_controller_0_trigger_c10 [get_bd_pins rfsoc_data_pipeline_10/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c10]
  connect_bd_net -net trigger_controller_0_trigger_c11 [get_bd_pins rfsoc_data_pipeline_11/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c11]
  connect_bd_net -net trigger_controller_0_trigger_c12 [get_bd_pins rfsoc_data_pipeline_12/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c12]
  connect_bd_net -net trigger_controller_0_trigger_c13 [get_bd_pins rfsoc_data_pipeline_13/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c13]
  connect_bd_net -net trigger_controller_0_trigger_c14 [get_bd_pins rfsoc_data_pipeline_14/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c14]
  connect_bd_net -net trigger_controller_0_trigger_c15 [get_bd_pins rfsoc_data_pipeline_15/ext_trigger] [get_bd_pins trigger_controller_0/trigger_c15]
  connect_bd_net -net usp_rf_data_converter_0_clk_adc0 [get_bd_pins proc_sys_reset_4/slowest_sync_clk] [get_bd_pins rfsoc_adc_data_captu_0/rf_clk] [get_bd_pins usp_rf_data_converter_0/clk_adc0] [get_bd_pins usp_rf_data_converter_0/m0_axis_aclk]
  connect_bd_net -net usp_rf_data_converter_0_clk_dac1 [get_bd_pins proc_sys_reset_1/slowest_sync_clk] [get_bd_pins rfsoc_data_pipeline_4/rf_clock] [get_bd_pins rfsoc_data_pipeline_5/rf_clock] [get_bd_pins rfsoc_data_pipeline_6/rf_clock] [get_bd_pins rfsoc_data_pipeline_7/rf_clock] [get_bd_pins usp_rf_data_converter_0/clk_dac1] [get_bd_pins usp_rf_data_converter_0/s1_axis_aclk]
  connect_bd_net -net usp_rf_data_converter_0_clk_dac2 [get_bd_pins proc_sys_reset_2/slowest_sync_clk] [get_bd_pins rfsoc_data_pipeline_10/rf_clock] [get_bd_pins rfsoc_data_pipeline_11/rf_clock] [get_bd_pins rfsoc_data_pipeline_8/rf_clock] [get_bd_pins rfsoc_data_pipeline_9/rf_clock] [get_bd_pins usp_rf_data_converter_0/clk_dac2] [get_bd_pins usp_rf_data_converter_0/s2_axis_aclk]
  connect_bd_net -net usp_rf_data_converter_0_clk_dac3 [get_bd_pins proc_sys_reset_3/slowest_sync_clk] [get_bd_pins rfsoc_data_pipeline_12/rf_clock] [get_bd_pins rfsoc_data_pipeline_13/rf_clock] [get_bd_pins rfsoc_data_pipeline_14/rf_clock] [get_bd_pins rfsoc_data_pipeline_15/rf_clock] [get_bd_pins usp_rf_data_converter_0/clk_dac3] [get_bd_pins usp_rf_data_converter_0/s3_axis_aclk]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins proc_sys_reset_1/ext_reset_in] [get_bd_pins proc_sys_reset_2/ext_reset_in] [get_bd_pins proc_sys_reset_3/ext_reset_in] [get_bd_pins proc_sys_reset_4/ext_reset_in] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in] [get_bd_pins util_vector_logic_0/Res]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00020000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00020000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00001000 -offset 0x41400000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mdm_1/S_AXI/Reg] SEG_mdm_1_Reg
  create_bd_addr_seg -range 0x00040000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs usp_rf_data_converter_0/s_axi/Reg] SEG_usp_rf_data_converter_0_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


