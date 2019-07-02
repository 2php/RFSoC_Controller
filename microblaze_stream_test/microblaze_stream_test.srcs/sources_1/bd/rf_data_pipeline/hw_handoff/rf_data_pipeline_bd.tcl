
################################################################
# This is a generated script based on design: rf_data_pipeline
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
# source rf_data_pipeline_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axis_mux, axis_tready_slice, gpio_buffer

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
set design_name rf_data_pipeline

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
  set S_AXIS_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_0 ]
  set_property -dict [ list \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {4} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $S_AXIS_0

  set m_axis_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $m_axis_0


  # Create ports
  set ext_trigger_0 [ create_bd_port -dir I ext_trigger_0 ]
  set gpio_in_0 [ create_bd_port -dir I -from 7 -to 0 gpio_in_0 ]
  set microblaze_clk [ create_bd_port -dir I -type clk microblaze_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_RESET {microblaze_resetn} \
   CONFIG.FREQ_HZ {100000000} \
 ] $microblaze_clk
  set microblaze_resetn [ create_bd_port -dir I -type rst microblaze_resetn ]
  set rf_clk [ create_bd_port -dir I -type clk rf_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_RESET {rf_resetn} \
   CONFIG.FREQ_HZ {250000000} \
 ] $rf_clk
  set rf_resetn [ create_bd_port -dir I -type rst rf_resetn ]

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_1 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {64} \
   CONFIG.FIFO_MODE {1} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {32} \
 ] $axis_data_fifo_1

  # Create instance: axis_data_fifo_2, and set properties
  set axis_data_fifo_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_2 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {1024} \
   CONFIG.TDATA_NUM_BYTES {32} \
 ] $axis_data_fifo_2

  # Create instance: axis_data_fifo_3, and set properties
  set axis_data_fifo_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_3 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_fifo_3

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
   CONFIG.HAS_MI_TKEEP {0} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.M_TDATA_NUM_BYTES {32} \
   CONFIG.S_TDATA_NUM_BYTES {4} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_mux_0, and set properties
  set block_name axis_mux
  set block_cell_name axis_mux_0
  if { [catch {set axis_mux_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_mux_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
 ] [get_bd_pins /axis_mux_0/clk]

  # Create instance: axis_tready_slice_0, and set properties
  set block_name axis_tready_slice
  set block_cell_name axis_tready_slice_0
  if { [catch {set axis_tready_slice_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_tready_slice_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: gpio_buffer_0, and set properties
  set block_name gpio_buffer
  set block_cell_name gpio_buffer_0
  if { [catch {set gpio_buffer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_buffer_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rf_pipeline_fast_ila, and set properties
  set rf_pipeline_fast_ila [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 rf_pipeline_fast_ila ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {1} \
   CONFIG.C_BRAM_CNT {144} \
   CONFIG.C_DATA_DEPTH {4096} \
   CONFIG.C_EN_STRG_QUAL {0} \
   CONFIG.C_MON_TYPE {INTERFACE} \
   CONFIG.C_NUM_MONITOR_SLOTS {5} \
   CONFIG.C_PROBE0_MU_CNT {1} \
   CONFIG.C_SLOT_0_APC_EN {0} \
   CONFIG.C_SLOT_0_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_0_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_1_APC_EN {0} \
   CONFIG.C_SLOT_1_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_1_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_2_APC_EN {0} \
   CONFIG.C_SLOT_2_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_2_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_2_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_3_APC_EN {0} \
   CONFIG.C_SLOT_3_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_3_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_3_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_4_APC_EN {0} \
   CONFIG.C_SLOT_4_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_4_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_4_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
 ] $rf_pipeline_fast_ila

  # Create instance: rf_pipeline_slow_ila, and set properties
  set rf_pipeline_slow_ila [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 rf_pipeline_slow_ila ]
  set_property -dict [ list \
   CONFIG.C_MON_TYPE {INTERFACE} \
   CONFIG.C_NUM_MONITOR_SLOTS {2} \
   CONFIG.C_SLOT_0_APC_EN {0} \
   CONFIG.C_SLOT_0_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_0_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
   CONFIG.C_SLOT_1_APC_EN {0} \
   CONFIG.C_SLOT_1_AXI_DATA_SEL {1} \
   CONFIG.C_SLOT_1_AXI_TRIG_SEL {1} \
   CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
 ] $rf_pipeline_slow_ila

  # Create instance: system_ila_2, and set properties
  set system_ila_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_2 ]
  set_property -dict [ list \
   CONFIG.C_MON_TYPE {NATIVE} \
   CONFIG.C_NUM_OF_PROBES {1} \
   CONFIG.C_PROBE0_TYPE {0} \
 ] $system_ila_2

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXIS_0_1 [get_bd_intf_ports S_AXIS_0] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_data_fifo_0_M_AXIS] [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins rf_pipeline_slow_ila/SLOT_1_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_data_fifo_0_M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins axis_data_fifo_1/M_AXIS] [get_bd_intf_pins axis_mux_0/s0_axis]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_data_fifo_1_M_AXIS] [get_bd_intf_pins axis_data_fifo_1/M_AXIS] [get_bd_intf_pins rf_pipeline_fast_ila/SLOT_3_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_data_fifo_1_M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_2_M_AXIS [get_bd_intf_pins axis_data_fifo_2/M_AXIS] [get_bd_intf_pins axis_tready_slice_0/s_axis]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_data_fifo_2_M_AXIS] [get_bd_intf_pins axis_data_fifo_2/M_AXIS] [get_bd_intf_pins rf_pipeline_fast_ila/SLOT_0_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_data_fifo_2_M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_3_M_AXIS [get_bd_intf_pins axis_data_fifo_3/M_AXIS] [get_bd_intf_pins gpio_buffer_0/s_axis]
  connect_bd_intf_net -intf_net axis_dwidth_converter_0_M_AXIS [get_bd_intf_pins axis_data_fifo_1/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_dwidth_converter_0_M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS] [get_bd_intf_pins rf_pipeline_slow_ila/SLOT_0_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_dwidth_converter_0_M_AXIS]
  connect_bd_intf_net -intf_net axis_mux_0_m_axis [get_bd_intf_pins axis_data_fifo_2/S_AXIS] [get_bd_intf_pins axis_mux_0/m_axis]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_mux_0_m_axis] [get_bd_intf_pins axis_data_fifo_2/S_AXIS] [get_bd_intf_pins rf_pipeline_fast_ila/SLOT_1_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_mux_0_m_axis]
  connect_bd_intf_net -intf_net axis_tready_slice_0_m_axis [get_bd_intf_ports m_axis_0] [get_bd_intf_pins axis_tready_slice_0/m_axis]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_tready_slice_0_m_axis] [get_bd_intf_ports m_axis_0] [get_bd_intf_pins rf_pipeline_fast_ila/SLOT_4_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_tready_slice_0_m_axis]
  connect_bd_intf_net -intf_net axis_tready_slice_0_mloop_axis [get_bd_intf_pins axis_mux_0/s1_axis] [get_bd_intf_pins axis_tready_slice_0/mloop_axis]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_tready_slice_0_mloop_axis] [get_bd_intf_pins axis_tready_slice_0/mloop_axis] [get_bd_intf_pins rf_pipeline_fast_ila/SLOT_2_AXIS]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axis_tready_slice_0_mloop_axis]
  connect_bd_intf_net -intf_net gpio_buffer_0_m_axis [get_bd_intf_pins axis_data_fifo_3/S_AXIS] [get_bd_intf_pins gpio_buffer_0/m_axis]

  # Create port connections
  connect_bd_net -net Net [get_bd_ports rf_clk] [get_bd_pins axis_data_fifo_1/m_axis_aclk] [get_bd_pins axis_data_fifo_2/s_axis_aclk] [get_bd_pins axis_data_fifo_3/m_axis_aclk] [get_bd_pins axis_mux_0/clk] [get_bd_pins axis_tready_slice_0/clk] [get_bd_pins rf_pipeline_fast_ila/clk]
  connect_bd_net -net Net1 [get_bd_ports rf_resetn] [get_bd_pins axis_data_fifo_2/s_axis_aresetn] [get_bd_pins axis_mux_0/reset] [get_bd_pins axis_tready_slice_0/reset] [get_bd_pins rf_pipeline_fast_ila/resetn]
  connect_bd_net -net Net3 [get_bd_ports microblaze_resetn] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins axis_data_fifo_3/s_axis_aresetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins rf_pipeline_slow_ila/resetn]
  connect_bd_net -net Net4 [get_bd_ports microblaze_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins axis_data_fifo_3/s_axis_aclk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins rf_pipeline_slow_ila/clk] [get_bd_pins system_ila_2/clk]
  connect_bd_net -net ext_trigger_0_1 [get_bd_ports ext_trigger_0] [get_bd_pins axis_tready_slice_0/ext_trigger]
  connect_bd_net -net gpio_in_0_1 [get_bd_pins axis_mux_0/gpio_in] [get_bd_pins axis_tready_slice_0/gpio_in] [get_bd_pins gpio_buffer_0/gpio_out] [get_bd_pins system_ila_2/probe0]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets gpio_in_0_1]
  connect_bd_net -net gpio_in_0_2 [get_bd_ports gpio_in_0] [get_bd_pins gpio_buffer_0/gpio_in]

  # Create address segments


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

