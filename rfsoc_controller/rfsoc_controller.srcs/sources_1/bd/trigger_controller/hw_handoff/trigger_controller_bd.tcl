
################################################################
# This is a generated script based on design: trigger_controller
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
# source trigger_controller_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# gpio_buffer, trigger_module

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
set design_name trigger_controller

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

  # Create ports
  set ext_trigger_in [ create_bd_port -dir I ext_trigger_in ]
  set gpio_in [ create_bd_port -dir I -from 15 -to 0 -type data gpio_in ]
  set microblaze_clk [ create_bd_port -dir I -type clk microblaze_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] $microblaze_clk
  set microblaze_reset [ create_bd_port -dir I -type rst microblaze_reset ]
  set pipeline_active_in_0 [ create_bd_port -dir I pipeline_active_in_0 ]
  set pipeline_active_in_1 [ create_bd_port -dir I pipeline_active_in_1 ]
  set pipeline_active_in_2 [ create_bd_port -dir I pipeline_active_in_2 ]
  set pipeline_active_in_3 [ create_bd_port -dir I pipeline_active_in_3 ]
  set pipeline_active_in_4 [ create_bd_port -dir I pipeline_active_in_4 ]
  set pipeline_active_in_5 [ create_bd_port -dir I pipeline_active_in_5 ]
  set pipeline_active_in_6 [ create_bd_port -dir I pipeline_active_in_6 ]
  set pipeline_active_in_7 [ create_bd_port -dir I pipeline_active_in_7 ]
  set pipeline_active_in_8 [ create_bd_port -dir I pipeline_active_in_8 ]
  set pipeline_active_in_9 [ create_bd_port -dir I pipeline_active_in_9 ]
  set pipeline_active_in_10 [ create_bd_port -dir I pipeline_active_in_10 ]
  set pipeline_active_in_11 [ create_bd_port -dir I pipeline_active_in_11 ]
  set pipeline_active_in_12 [ create_bd_port -dir I pipeline_active_in_12 ]
  set pipeline_active_in_13 [ create_bd_port -dir I pipeline_active_in_13 ]
  set pipeline_active_in_14 [ create_bd_port -dir I pipeline_active_in_14 ]
  set pipeline_active_in_15 [ create_bd_port -dir I pipeline_active_in_15 ]
  set rf_clk [ create_bd_port -dir I -type clk rf_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
 ] $rf_clk
  set rf_reset [ create_bd_port -dir I -type rst rf_reset ]
  set trigger_c0 [ create_bd_port -dir O trigger_c0 ]
  set trigger_c1 [ create_bd_port -dir O trigger_c1 ]
  set trigger_c2 [ create_bd_port -dir O trigger_c2 ]
  set trigger_c3 [ create_bd_port -dir O trigger_c3 ]
  set trigger_c4 [ create_bd_port -dir O trigger_c4 ]
  set trigger_c5 [ create_bd_port -dir O trigger_c5 ]
  set trigger_c6 [ create_bd_port -dir O trigger_c6 ]
  set trigger_c7 [ create_bd_port -dir O trigger_c7 ]
  set trigger_c8 [ create_bd_port -dir O trigger_c8 ]
  set trigger_c9 [ create_bd_port -dir O trigger_c9 ]
  set trigger_c10 [ create_bd_port -dir O trigger_c10 ]
  set trigger_c11 [ create_bd_port -dir O trigger_c11 ]
  set trigger_c12 [ create_bd_port -dir O trigger_c12 ]
  set trigger_c13 [ create_bd_port -dir O trigger_c13 ]
  set trigger_c14 [ create_bd_port -dir O trigger_c14 ]
  set trigger_c15 [ create_bd_port -dir O trigger_c15 ]

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {2} \
 ] $axis_data_fifo_0

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
  
  # Create instance: trigger_module_0, and set properties
  set block_name trigger_module
  set block_cell_name trigger_module_0
  if { [catch {set trigger_module_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $trigger_module_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins gpio_buffer_0/s_axis]
  connect_bd_intf_net -intf_net gpio_buffer_0_m_axis [get_bd_intf_pins axis_data_fifo_0/S_AXIS] [get_bd_intf_pins gpio_buffer_0/m_axis]

  # Create port connections
  connect_bd_net -net gpio_buffer_0_gpio_out [get_bd_pins gpio_buffer_0/gpio_out] [get_bd_pins trigger_module_0/gpio_in]
  connect_bd_net -net gpio_in_1 [get_bd_ports gpio_in] [get_bd_pins gpio_buffer_0/gpio_in]
  connect_bd_net -net microblaze_clk_1 [get_bd_ports microblaze_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk]
  connect_bd_net -net microblaze_reset_1 [get_bd_ports microblaze_reset] [get_bd_pins axis_data_fifo_0/s_axis_aresetn]
  connect_bd_net -net pipeline_active_in_0_0_1 [get_bd_ports pipeline_active_in_0] [get_bd_pins trigger_module_0/pipeline_active_in_0]
  connect_bd_net -net pipeline_active_in_10_0_1 [get_bd_ports pipeline_active_in_10] [get_bd_pins trigger_module_0/pipeline_active_in_10]
  connect_bd_net -net pipeline_active_in_11_0_1 [get_bd_ports pipeline_active_in_11] [get_bd_pins trigger_module_0/pipeline_active_in_11]
  connect_bd_net -net pipeline_active_in_12_0_1 [get_bd_ports pipeline_active_in_12] [get_bd_pins trigger_module_0/pipeline_active_in_12]
  connect_bd_net -net pipeline_active_in_13_0_1 [get_bd_ports pipeline_active_in_13] [get_bd_pins trigger_module_0/pipeline_active_in_13]
  connect_bd_net -net pipeline_active_in_14_0_1 [get_bd_ports pipeline_active_in_14] [get_bd_pins trigger_module_0/pipeline_active_in_14]
  connect_bd_net -net pipeline_active_in_15_0_1 [get_bd_ports pipeline_active_in_15] [get_bd_pins trigger_module_0/pipeline_active_in_15]
  connect_bd_net -net pipeline_active_in_1_0_1 [get_bd_ports pipeline_active_in_1] [get_bd_pins trigger_module_0/pipeline_active_in_1]
  connect_bd_net -net pipeline_active_in_2_0_1 [get_bd_ports pipeline_active_in_2] [get_bd_pins trigger_module_0/pipeline_active_in_2]
  connect_bd_net -net pipeline_active_in_3_0_1 [get_bd_ports pipeline_active_in_3] [get_bd_pins trigger_module_0/pipeline_active_in_3]
  connect_bd_net -net pipeline_active_in_4_0_1 [get_bd_ports pipeline_active_in_4] [get_bd_pins trigger_module_0/pipeline_active_in_4]
  connect_bd_net -net pipeline_active_in_5_0_1 [get_bd_ports pipeline_active_in_5] [get_bd_pins trigger_module_0/pipeline_active_in_5]
  connect_bd_net -net pipeline_active_in_6_0_1 [get_bd_ports pipeline_active_in_6] [get_bd_pins trigger_module_0/pipeline_active_in_6]
  connect_bd_net -net pipeline_active_in_7_0_1 [get_bd_ports pipeline_active_in_7] [get_bd_pins trigger_module_0/pipeline_active_in_7]
  connect_bd_net -net pipeline_active_in_8_0_1 [get_bd_ports pipeline_active_in_8] [get_bd_pins trigger_module_0/pipeline_active_in_8]
  connect_bd_net -net pipeline_active_in_9_0_1 [get_bd_ports pipeline_active_in_9] [get_bd_pins trigger_module_0/pipeline_active_in_9]
  connect_bd_net -net rf_clk_1 [get_bd_ports rf_clk] [get_bd_pins axis_data_fifo_0/m_axis_aclk] [get_bd_pins trigger_module_0/rf_clk]
  connect_bd_net -net rf_reset_1 [get_bd_ports rf_reset] [get_bd_pins trigger_module_0/rf_reset]
  connect_bd_net -net trigger_in_0_1 [get_bd_ports ext_trigger_in] [get_bd_pins trigger_module_0/trigger_in]
  connect_bd_net -net trigger_module_0_trigger_c0 [get_bd_ports trigger_c0] [get_bd_pins trigger_module_0/trigger_c0]
  connect_bd_net -net trigger_module_0_trigger_c1 [get_bd_ports trigger_c1] [get_bd_pins trigger_module_0/trigger_c1]
  connect_bd_net -net trigger_module_0_trigger_c2 [get_bd_ports trigger_c2] [get_bd_pins trigger_module_0/trigger_c2]
  connect_bd_net -net trigger_module_0_trigger_c3 [get_bd_ports trigger_c3] [get_bd_pins trigger_module_0/trigger_c3]
  connect_bd_net -net trigger_module_0_trigger_c4 [get_bd_ports trigger_c4] [get_bd_pins trigger_module_0/trigger_c4]
  connect_bd_net -net trigger_module_0_trigger_c5 [get_bd_ports trigger_c5] [get_bd_pins trigger_module_0/trigger_c5]
  connect_bd_net -net trigger_module_0_trigger_c6 [get_bd_ports trigger_c6] [get_bd_pins trigger_module_0/trigger_c6]
  connect_bd_net -net trigger_module_0_trigger_c7 [get_bd_ports trigger_c7] [get_bd_pins trigger_module_0/trigger_c7]
  connect_bd_net -net trigger_module_0_trigger_c8 [get_bd_ports trigger_c8] [get_bd_pins trigger_module_0/trigger_c8]
  connect_bd_net -net trigger_module_0_trigger_c9 [get_bd_ports trigger_c9] [get_bd_pins trigger_module_0/trigger_c9]
  connect_bd_net -net trigger_module_0_trigger_c10 [get_bd_ports trigger_c10] [get_bd_pins trigger_module_0/trigger_c10]
  connect_bd_net -net trigger_module_0_trigger_c11 [get_bd_ports trigger_c11] [get_bd_pins trigger_module_0/trigger_c11]
  connect_bd_net -net trigger_module_0_trigger_c12 [get_bd_ports trigger_c12] [get_bd_pins trigger_module_0/trigger_c12]
  connect_bd_net -net trigger_module_0_trigger_c13 [get_bd_ports trigger_c13] [get_bd_pins trigger_module_0/trigger_c13]
  connect_bd_net -net trigger_module_0_trigger_c14 [get_bd_ports trigger_c14] [get_bd_pins trigger_module_0/trigger_c14]
  connect_bd_net -net trigger_module_0_trigger_c15 [get_bd_ports trigger_c15] [get_bd_pins trigger_module_0/trigger_c15]

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


