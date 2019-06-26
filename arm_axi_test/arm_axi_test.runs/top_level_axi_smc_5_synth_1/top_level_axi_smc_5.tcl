# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param tcl.collectionResultDisplayLimit 0
set_param chipscope.maxJobs 3
set_param xicom.use_bs_reader 1
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xczu29dr-ffvf1760-2-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/james/fpga_projects/arm_axi_test/arm_axi_test.cache/wt [current_project]
set_property parent.project_path C:/james/fpga_projects/arm_axi_test/arm_axi_test.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:zcu1275:part0:1.0 [current_project]
set_property ip_output_repo c:/james/fpga_projects/arm_axi_test/arm_axi_test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5.xci
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_1/bd_d45d_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_1/bd_d45d_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_2/bd_d45d_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_3/bd_d45d_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_4/bd_d45d_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_5/bd_d45d_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_6/bd_d45d_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_10/bd_d45d_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_11/bd_d45d_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_12/bd_d45d_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_13/bd_d45d_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_14/bd_d45d_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_15/bd_d45d_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_19/bd_d45d_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_20/bd_d45d_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_21/bd_d45d_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_25/bd_d45d_s02a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_26/bd_d45d_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_27/bd_d45d_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_28/bd_d45d_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_29/bd_d45d_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_30/bd_d45d_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_31/bd_d45d_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_32/bd_d45d_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_33/bd_d45d_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/bd_0/ip/ip_34/bd_d45d_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

set cached_ip [config_ip_cache -export -no_bom  -dir C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1 -new_name top_level_axi_smc_5 -ip [get_ips top_level_axi_smc_5]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top top_level_axi_smc_5 -part xczu29dr-ffvf1760-2-e -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix top_level_axi_smc_5_ top_level_axi_smc_5.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_axi_smc_5_stub.v
 lappend ipCachedFiles top_level_axi_smc_5_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_axi_smc_5_stub.vhdl
 lappend ipCachedFiles top_level_axi_smc_5_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_axi_smc_5_sim_netlist.v
 lappend ipCachedFiles top_level_axi_smc_5_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_axi_smc_5_sim_netlist.vhdl
 lappend ipCachedFiles top_level_axi_smc_5_sim_netlist.vhdl
set TIME_taken [expr [clock seconds] - $TIME_start]

 config_ip_cache -add -dcp top_level_axi_smc_5.dcp -move_files $ipCachedFiles -use_project_ipc  -synth_runtime $TIME_taken  -ip [get_ips top_level_axi_smc_5]
}

rename_ref -prefix_all top_level_axi_smc_5_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level_axi_smc_5.dcp
create_report "top_level_axi_smc_5_synth_1_synth_report_utilization_0" "report_utilization -file top_level_axi_smc_5_utilization_synth.rpt -pb top_level_axi_smc_5_utilization_synth.pb"

if { [catch {
  file copy -force C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1/top_level_axi_smc_5.dcp c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1/top_level_axi_smc_5.dcp c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1/top_level_axi_smc_5_stub.v c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1/top_level_axi_smc_5_stub.vhdl c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1/top_level_axi_smc_5_sim_netlist.v c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/james/fpga_projects/arm_axi_test/arm_axi_test.runs/top_level_axi_smc_5_synth_1/top_level_axi_smc_5_sim_netlist.vhdl c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir C:/james/fpga_projects/arm_axi_test/arm_axi_test.ip_user_files/ip/top_level_axi_smc_5]} {
  catch { 
    file copy -force c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_stub.v C:/james/fpga_projects/arm_axi_test/arm_axi_test.ip_user_files/ip/top_level_axi_smc_5
  }
}

if {[file isdir C:/james/fpga_projects/arm_axi_test/arm_axi_test.ip_user_files/ip/top_level_axi_smc_5]} {
  catch { 
    file copy -force c:/james/fpga_projects/arm_axi_test/arm_axi_test.srcs/sources_1/bd/top_level/ip/top_level_axi_smc_5/top_level_axi_smc_5_stub.vhdl C:/james/fpga_projects/arm_axi_test/arm_axi_test.ip_user_files/ip/top_level_axi_smc_5
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
