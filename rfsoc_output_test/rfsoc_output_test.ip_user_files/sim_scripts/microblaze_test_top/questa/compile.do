vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/microblaze_v11_0_1
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/lmb_v10_v3_0_9
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_16
vlib questa_lib/msim/blk_mem_gen_v8_4_3
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/mdm_v3_2_16
vlib questa_lib/msim/xlconcat_v2_1_3
vlib questa_lib/msim/iomodule_v3_1_4
vlib questa_lib/msim/util_vector_logic_v2_0_1

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap microblaze_v11_0_1 questa_lib/msim/microblaze_v11_0_1
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_9 questa_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_16 questa_lib/msim/lmb_bram_if_cntlr_v4_0_16
vmap blk_mem_gen_v8_4_3 questa_lib/msim/blk_mem_gen_v8_4_3
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_16 questa_lib/msim/mdm_v3_2_16
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3
vmap iomodule_v3_1_4 questa_lib/msim/iomodule_v3_1_4
vmap util_vector_logic_v2_0_1 questa_lib/msim/util_vector_logic_v2_0_1

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_1 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/f8c3/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_0/sim/bd_4f04_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_1/sim/bd_4f04_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_2/sim/bd_4f04_ilmb_0.vhd" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_3/sim/bd_4f04_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_16 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/6335/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_4/sim/bd_4f04_dlmb_cntlr_0.vhd" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_5/sim/bd_4f04_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_3 -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_6/sim/bd_4f04_lmb_bram_I_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_16 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/550e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_7/sim/bd_4f04_mdm_0_0.vhd" \

vlog -work xlconcat_v2_1_3 -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_8/sim/bd_4f04_xlconcat_0_0.v" \

vcom -work iomodule_v3_1_4 -64 -93 \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/18fc/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/ip/ip_9/sim/bd_4f04_iomodule_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/bd_0/sim/bd_4f04.v" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/sim/microblaze_test_top_microblaze_mcs_0_0.v" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_clk_wiz_0/microblaze_test_top_clk_wiz_0_clk_wiz.v" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_clk_wiz_0/microblaze_test_top_clk_wiz_0.v" \

vlog -work util_vector_logic_v2_0_1 -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ipshared/c923" \
"../../../bd/microblaze_test_top/ip/microblaze_test_top_util_vector_logic_0_0/sim/microblaze_test_top_util_vector_logic_0_0.v" \
"../../../bd/microblaze_test_top/sim/microblaze_test_top.v" \

vlog -work xil_defaultlib \
"glbl.v"

