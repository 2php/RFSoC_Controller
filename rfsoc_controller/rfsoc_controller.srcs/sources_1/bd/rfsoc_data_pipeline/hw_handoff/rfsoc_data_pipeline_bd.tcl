
################################################################
# This is a generated script based on design: rfsoc_data_pipeline
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
# source rfsoc_data_pipeline_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axis_mux, axis_tready_slice, gpio_and_select_buffer, pipeline_active_buffer

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
set design_name rfsoc_data_pipeline

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
  set S_AXIS [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS ]
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
   ] $S_AXIS

  set m_axis [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $m_axis


  # Create ports
  set ext_trigger [ create_bd_port -dir I ext_trigger ]
  set gpio_in [ create_bd_port -dir I -from 15 -to 0 gpio_in ]
  set is_selected [ create_bd_port -dir I is_selected ]
  set microblaze_clk [ create_bd_port -dir I -type clk microblaze_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S_AXIS} \
   CONFIG.ASSOCIATED_RESET {microblaze_resetn} \
   CONFIG.FREQ_HZ {100000000} \
 ] $microblaze_clk
  set microblaze_resetn [ create_bd_port -dir I -type rst microblaze_resetn ]
  set pipeline_active [ create_bd_port -dir O pipeline_active ]
  set rf_clock [ create_bd_port -dir I -type clk rf_clock ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {m_axis} \
   CONFIG.ASSOCIATED_RESET {rf_resetn} \
   CONFIG.FREQ_HZ {250000000} \
 ] $rf_clock
  set rf_resetn [ create_bd_port -dir I -type rst rf_resetn ]

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_1 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_fifo_1

  # Create instance: axis_data_fifo_clock_crossing, and set properties
  set axis_data_fifo_clock_crossing [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_clock_crossing ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {32} \
 ] $axis_data_fifo_clock_crossing

  # Create instance: axis_data_fifo_gpio, and set properties
  set axis_data_fifo_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_gpio ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_gpio

  # Create instance: axis_data_fifo_waveform, and set properties
  set axis_data_fifo_waveform [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_waveform ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {32} \
 ] $axis_data_fifo_waveform

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
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
  
  # Create instance: gpio_and_select_buff_0, and set properties
  set block_name gpio_and_select_buffer
  set block_cell_name gpio_and_select_buff_0
  if { [catch {set gpio_and_select_buff_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_and_select_buff_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pipeline_active_buff_0, and set properties
  set block_name pipeline_active_buffer
  set block_cell_name pipeline_active_buff_0
  if { [catch {set pipeline_active_buff_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pipeline_active_buff_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net S_AXIS_0_1 [get_bd_intf_ports S_AXIS] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins axis_data_fifo_clock_crossing/M_AXIS] [get_bd_intf_pins axis_mux_0/s0_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS1 [get_bd_intf_pins axis_data_fifo_1/M_AXIS] [get_bd_intf_pins pipeline_active_buff_0/s_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_2_M_AXIS [get_bd_intf_pins axis_data_fifo_waveform/M_AXIS] [get_bd_intf_pins axis_tready_slice_0/s_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_gpio_M_AXIS [get_bd_intf_pins axis_data_fifo_gpio/M_AXIS] [get_bd_intf_pins gpio_and_select_buff_0/s_axis]
  connect_bd_intf_net -intf_net axis_dwidth_converter_0_M_AXIS [get_bd_intf_pins axis_data_fifo_clock_crossing/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net axis_mux_0_m_axis [get_bd_intf_pins axis_data_fifo_waveform/S_AXIS] [get_bd_intf_pins axis_mux_0/m_axis]
  connect_bd_intf_net -intf_net axis_tready_slice_0_m_axis [get_bd_intf_ports m_axis] [get_bd_intf_pins axis_tready_slice_0/m_axis]
  connect_bd_intf_net -intf_net axis_tready_slice_0_mloop_axis [get_bd_intf_pins axis_mux_0/s1_axis] [get_bd_intf_pins axis_tready_slice_0/mloop_axis]
  connect_bd_intf_net -intf_net gpio_and_select_buff_0_m_axis [get_bd_intf_pins axis_data_fifo_gpio/S_AXIS] [get_bd_intf_pins gpio_and_select_buff_0/m_axis]
  connect_bd_intf_net -intf_net pipeline_active_buff_0_m_axis [get_bd_intf_pins axis_data_fifo_1/S_AXIS] [get_bd_intf_pins pipeline_active_buff_0/m_axis]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins axis_mux_0/gpio_in] [get_bd_pins axis_tready_slice_0/gpio_in] [get_bd_pins gpio_and_select_buff_0/gpio_out]
  connect_bd_net -net axis_tready_slice_0_pipeline_active [get_bd_pins axis_tready_slice_0/pipeline_active] [get_bd_pins pipeline_active_buff_0/active_in]
  connect_bd_net -net ext_trigger_1 [get_bd_ports ext_trigger] [get_bd_pins gpio_and_select_buff_0/ext_trigger_in]
  connect_bd_net -net gpio_and_select_buff_0_ext_trigger_out [get_bd_pins axis_tready_slice_0/ext_trigger] [get_bd_pins gpio_and_select_buff_0/ext_trigger_out]
  connect_bd_net -net gpio_and_select_buff_0_select_out [get_bd_pins axis_tready_slice_0/is_selected] [get_bd_pins gpio_and_select_buff_0/select_out]
  connect_bd_net -net gpio_in_1 [get_bd_ports gpio_in] [get_bd_pins gpio_and_select_buff_0/gpio_in]
  connect_bd_net -net is_selected_1 [get_bd_ports is_selected] [get_bd_pins gpio_and_select_buff_0/select_in]
  connect_bd_net -net microblaze_clk_1 [get_bd_ports microblaze_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/m_axis_aclk] [get_bd_pins axis_data_fifo_clock_crossing/s_axis_aclk] [get_bd_pins axis_data_fifo_gpio/s_axis_aclk] [get_bd_pins axis_dwidth_converter_0/aclk]
  connect_bd_net -net microblaze_reset_1 [get_bd_ports microblaze_resetn] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_clock_crossing/s_axis_aresetn] [get_bd_pins axis_data_fifo_gpio/s_axis_aresetn] [get_bd_pins axis_dwidth_converter_0/aresetn]
  connect_bd_net -net pipeline_active_buff_0_active_out [get_bd_ports pipeline_active] [get_bd_pins pipeline_active_buff_0/active_out]
  connect_bd_net -net rf_clock_1 [get_bd_ports rf_clock] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins axis_data_fifo_clock_crossing/m_axis_aclk] [get_bd_pins axis_data_fifo_gpio/m_axis_aclk] [get_bd_pins axis_data_fifo_waveform/s_axis_aclk] [get_bd_pins axis_mux_0/clk] [get_bd_pins axis_tready_slice_0/clk]
  connect_bd_net -net rf_reset_1 [get_bd_ports rf_resetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins axis_data_fifo_waveform/s_axis_aresetn] [get_bd_pins axis_mux_0/reset] [get_bd_pins axis_tready_slice_0/reset]

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


