onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L microblaze_v11_0_1 -L lmb_v10_v3_0_9 -L lmb_bram_if_cntlr_v4_0_16 -L blk_mem_gen_v8_4_3 -L axi_lite_ipif_v3_0_4 -L mdm_v3_2_16 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L axi_uartlite_v2_0_23 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_19 -L fifo_generator_v13_2_4 -L axi_data_fifo_v2_1_18 -L axi_crossbar_v2_1_20 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_21 -L util_vector_logic_v2_0_1 -L gigantic_mux -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_1 -L axis_register_slice_v1_1_19 -L axis_dwidth_converter_v1_1_18 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.top_level xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {top_level.udo}

run -all

quit -force
