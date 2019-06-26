vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_1
vlib activehdl/lmb_v10_v3_0_9
vlib activehdl/lmb_bram_if_cntlr_v4_0_16
vlib activehdl/blk_mem_gen_v8_4_3
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/mdm_v3_2_16
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_uartlite_v2_0_23
vlib activehdl/util_vector_logic_v2_0_1
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_19
vlib activehdl/fifo_generator_v13_2_4
vlib activehdl/axi_data_fifo_v2_1_18
vlib activehdl/axi_crossbar_v2_1_20

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap microblaze_v11_0_1 activehdl/microblaze_v11_0_1
vmap lmb_v10_v3_0_9 activehdl/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 activehdl/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 activehdl/blk_mem_gen_v8_4_3
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_16 activehdl/mdm_v3_2_16
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_23 activehdl/axi_uartlite_v2_0_23
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_19 activehdl/axi_register_slice_v2_1_19
vmap fifo_generator_v13_2_4 activehdl/fifo_generator_v13_2_4
vmap axi_data_fifo_v2_1_18 activehdl/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 activehdl/axi_crossbar_v2_1_20

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_1 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_0_0/sim/top_level_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_dlmb_v10_0/sim/top_level_dlmb_v10_0.vhd" \
"../../../bd/top_level/ip/top_level_ilmb_v10_0/sim/top_level_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_dlmb_bram_if_cntlr_0/sim/top_level_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/top_level/ip/top_level_ilmb_bram_if_cntlr_0/sim/top_level_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_3  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_lmb_bram_0/sim/top_level_lmb_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_16 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_mdm_1_0/sim/top_level_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_clk_wiz_1_0/top_level_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/top_level/ip/top_level_clk_wiz_1_0/top_level_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_rst_clk_wiz_1_100M_0/sim/top_level_rst_clk_wiz_1_100M_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_23 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/0315/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_axi_uartlite_0_0/sim/top_level_axi_uartlite_0_0.vhd" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_util_vector_logic_0_0/sim/top_level_util_vector_logic_0_0.v" \
"../../../bd/top_level/ip/top_level_dummy_controller_0_0/sim/top_level_dummy_controller_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_18  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_xbar_0/sim/top_level_xbar_0.v" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_block.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_por_fsm_top.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_bgt_fsm.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_device_rom.sv" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_por_fsm.sv" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_por_fsm_disabled.sv" \
"../../../bd/top_level/ip/top_level_usp_rf_data_converter_0_0/synth/top_level_usp_rf_data_converter_0_0_tile_config.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/c923" "+incdir+../../../../microblaze_axi_test.srcs/sources_1/bd/top_level/ipshared/ec67/hdl" \
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
"../../../bd/top_level/sim/top_level.v" \

vlog -work xil_defaultlib \
"glbl.v"
