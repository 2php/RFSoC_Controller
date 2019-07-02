vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/gigantic_mux
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_data_fifo_v2_0_1
vlib riviera/axis_register_slice_v1_1_19
vlib riviera/axis_dwidth_converter_v1_1_18

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap gigantic_mux riviera/gigantic_mux
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_1 riviera/axis_data_fifo_v2_0_1
vmap axis_register_slice_v1_1_19 riviera/axis_register_slice_v1_1_19
vmap axis_dwidth_converter_v1_1_18 riviera/axis_dwidth_converter_v1_1_18

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_0_0/rfsoc_data_pipeline_axis_data_fifo_0_0_sim_netlist.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_dwidth_converter_0_0/rfsoc_data_pipeline_axis_dwidth_converter_0_0_sim_netlist.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_1_0/rfsoc_data_pipeline_axis_data_fifo_1_0_sim_netlist.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_mux_0_0/sim/rfsoc_data_pipeline_axis_mux_0_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_2_0/rfsoc_data_pipeline_axis_data_fifo_2_0_sim_netlist.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_tready_slice_0_0/sim/rfsoc_data_pipeline_axis_tready_slice_0_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_gpio_buffer_0_0/sim/rfsoc_data_pipeline_gpio_buffer_0_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_1_1/rfsoc_data_pipeline_axis_data_fifo_1_1_sim_netlist.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_0_0/bd_0/ip/ip_0/sim/bd_9af0_ila_lib_0.v" \

vlog -work gigantic_mux  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_0_0/bd_0/ip/ip_1/bd_9af0_g_inst_0_gigantic_mux.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_0_0/bd_0/ip/ip_1/sim/bd_9af0_g_inst_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_0_0/bd_0/sim/bd_9af0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_0_0/sim/rfsoc_data_pipeline_system_ila_0_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_1_0/bd_0/ip/ip_0/sim/bd_5aa1_ila_lib_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_1_0/bd_0/ip/ip_1/bd_5aa1_g_inst_0_gigantic_mux.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_1_0/bd_0/ip/ip_1/sim/bd_5aa1_g_inst_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_1_0/bd_0/sim/bd_5aa1.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_1_0/sim/rfsoc_data_pipeline_system_ila_1_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_2_0/bd_0/ip/ip_0/sim/bd_5a51_ila_lib_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_2_0/bd_0/sim/bd_5a51.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_2_0/sim/rfsoc_data_pipeline_system_ila_2_0.v" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_1  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/e1b1/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_0_1/sim/rfsoc_data_pipeline_axis_data_fifo_0_1.v" \

vlog -work axis_register_slice_v1_1_19  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/635c/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work axis_dwidth_converter_v1_1_18  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/7d46/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/122e/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/6887/hdl/verilog" "+incdir+../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/9623/hdl/verilog" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_dwidth_converter_0_1/sim/rfsoc_data_pipeline_axis_dwidth_converter_0_1.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_clock_crossing_0/sim/rfsoc_data_pipeline_axis_data_fifo_clock_crossing_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_waveform_0/sim/rfsoc_data_pipeline_axis_data_fifo_waveform_0.v" \
"../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_1_2/sim/rfsoc_data_pipeline_axis_data_fifo_1_2.v" \
"../../../bd/rfsoc_data_pipeline/sim/rfsoc_data_pipeline.v" \

vlog -work xil_defaultlib \
"glbl.v"

