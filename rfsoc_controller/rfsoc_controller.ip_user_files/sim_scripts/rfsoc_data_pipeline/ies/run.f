-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_0_0/rfsoc_data_pipeline_axis_data_fifo_0_0_sim_netlist.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_dwidth_converter_0_0/rfsoc_data_pipeline_axis_dwidth_converter_0_0_sim_netlist.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_1_0/rfsoc_data_pipeline_axis_data_fifo_1_0_sim_netlist.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_mux_0_0/sim/rfsoc_data_pipeline_axis_mux_0_0.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_2_0/rfsoc_data_pipeline_axis_data_fifo_2_0_sim_netlist.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_tready_slice_0_0/sim/rfsoc_data_pipeline_axis_tready_slice_0_0.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_gpio_buffer_0_0/sim/rfsoc_data_pipeline_gpio_buffer_0_0.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_1_1/rfsoc_data_pipeline_axis_data_fifo_1_1_sim_netlist.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_system_ila_0_0/bd_0/ip/ip_0/sim/bd_9af0_ila_lib_0.v" \
-endlib
-makelib ies_lib/gigantic_mux \
  "../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
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
-endlib
-makelib ies_lib/axis_infrastructure_v1_1_0 \
  "../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axis_data_fifo_v2_0_1 \
  "../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/e1b1/hdl/axis_data_fifo_v2_0_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_0_1/sim/rfsoc_data_pipeline_axis_data_fifo_0_1.v" \
-endlib
-makelib ies_lib/axis_register_slice_v1_1_19 \
  "../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/635c/hdl/axis_register_slice_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axis_dwidth_converter_v1_1_18 \
  "../../../../rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ipshared/7d46/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_dwidth_converter_0_1/sim/rfsoc_data_pipeline_axis_dwidth_converter_0_1.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_clock_crossing_0/sim/rfsoc_data_pipeline_axis_data_fifo_clock_crossing_0.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_waveform_0/sim/rfsoc_data_pipeline_axis_data_fifo_waveform_0.v" \
  "../../../bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_data_fifo_1_2/sim/rfsoc_data_pipeline_axis_data_fifo_1_2.v" \
  "../../../bd/rfsoc_data_pipeline/sim/rfsoc_data_pipeline.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

