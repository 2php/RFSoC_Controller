vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_1
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/lmb_v10_v3_0_9
vlib activehdl/lmb_bram_if_cntlr_v4_0_16
vlib activehdl/blk_mem_gen_v8_4_3
vlib activehdl/iomodule_v3_1_4
vlib activehdl/util_vector_logic_v2_0_1

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap microblaze_v11_0_1 activehdl/microblaze_v11_0_1
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_9 activehdl/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 activehdl/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 activehdl/blk_mem_gen_v8_4_3
vmap iomodule_v3_1_4 activehdl/iomodule_v3_1_4
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_gpio_split_0_0/sim/top_level_gpio_split_0_0.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_block.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_por_fsm_top.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_bgt_fsm.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_device_rom.sv" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_por_fsm.sv" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_por_fsm_disabled.sv" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_tile_config.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_drp_arbiter.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_register_decode.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_address_decoder.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_axi_lite_ipif.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_counter_f.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_pselect_f.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_slave_attachment.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_rf_wrapper.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_drp_control_top.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_drp_control.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_drp_access_ctrl.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_irq_req_ack.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_irq_sync.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0bufg_gt_ctrl.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_overvol_irq.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_powerup_state_irq.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_rst_cnt.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0.v" \
"../../../bd/top_level/ip/top_level_RFSoC_Controller_0_1/sim/top_level_RFSoC_Controller_0_1.v" \

vcom -work microblaze_v11_0_1 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_0/sim/bd_04f1_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_1/sim/bd_04f1_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_2/sim/bd_04f1_ilmb_0.vhd" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_3/sim/bd_04f1_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_4/sim/bd_04f1_dlmb_cntlr_0.vhd" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_5/sim/bd_04f1_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_3  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_6/sim/bd_04f1_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_4 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/18fc/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/ip/ip_7/sim/bd_04f1_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/bd_0/sim/bd_04f1.v" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_0/sim/top_level_microblaze_mcs_0_0.v" \
"../../../bd/top_level/ip/top_level_clk_wiz_0/top_level_clk_wiz_0_clk_wiz.v" \
"../../../bd/top_level/ip/top_level_clk_wiz_0/top_level_clk_wiz_0.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/top_level/ipshared/9623/hdl/verilog" \
"../../../bd/top_level/ip/top_level_util_vector_logic_0_0/sim/top_level_util_vector_logic_0_0.v" \
"../../../bd/top_level/ip/top_level_ila_0_0/sim/top_level_ila_0_0.v" \
"../../../bd/top_level/sim/top_level.v" \

vlog -work xil_defaultlib \
"glbl.v"

