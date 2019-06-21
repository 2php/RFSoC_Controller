vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/microblaze_v11_0_1
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lmb_v10_v3_0_9
vlib riviera/lmb_bram_if_cntlr_v4_0_16
vlib riviera/blk_mem_gen_v8_4_3
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/mdm_v3_2_16
vlib riviera/xlconcat_v2_1_3
vlib riviera/iomodule_v3_1_4
vlib riviera/util_vector_logic_v2_0_1

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap microblaze_v11_0_1 riviera/microblaze_v11_0_1
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_9 riviera/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 riviera/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 riviera/blk_mem_gen_v8_4_3
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_16 riviera/mdm_v3_2_16
vmap xlconcat_v2_1_3 riviera/xlconcat_v2_1_3
vmap iomodule_v3_1_4 riviera/iomodule_v3_1_4
vmap util_vector_logic_v2_0_1 riviera/util_vector_logic_v2_0_1

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_1 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_0/sim/bd_c570_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_1/sim/bd_c570_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_2/sim/bd_c570_ilmb_0.vhd" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_3/sim/bd_c570_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_4/sim/bd_c570_dlmb_cntlr_0.vhd" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_5/sim/bd_c570_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_3  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_6/sim/bd_c570_lmb_bram_I_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_16 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_7/sim/bd_c570_mdm_0_0.vhd" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_8/sim/bd_c570_xlconcat_0_0.v" \

vcom -work iomodule_v3_1_4 -93 \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/18fc/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/ip/ip_9/sim/bd_c570_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/bd_0/sim/bd_c570.v" \
"../../../bd/top_level/ip/top_level_microblaze_mcs_0_2/sim/top_level_microblaze_mcs_0_2.v" \
"../../../bd/top_level/ip/top_level_clk_wiz_2/top_level_clk_wiz_2_clk_wiz.v" \
"../../../bd/top_level/ip/top_level_clk_wiz_2/top_level_clk_wiz_2.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../board_microblaze_test.srcs/sources_1/bd/top_level/ipshared/c923" \
"../../../bd/top_level/ip/top_level_util_vector_logic_0_3/sim/top_level_util_vector_logic_0_3.v" \
"../../../bd/top_level/sim/top_level.v" \

vlog -work xil_defaultlib \
"glbl.v"

