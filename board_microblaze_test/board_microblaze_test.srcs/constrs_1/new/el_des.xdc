set_property PACKAGE_PIN AP22 [get_ports diff_clock_rtl_clk_p]
set_property PACKAGE_PIN AM22 [get_ports reset_rtl]

set_property IOSTANDARD LVCMOS18 [get_ports reset_rtl]
set_property IOSTANDARD LVDS [get_ports diff_clock_rtl_clk_p]
set_property IOSTANDARD LVDS [get_ports diff_clock_rtl_clk_n]

set_property PACKAGE_PIN G13 [get_ports int_irq]
set_property PACKAGE_PIN G18 [get_ports uart_int]
set_property IOSTANDARD LVCMOS18 [get_ports int_irq]
set_property IOSTANDARD LVCMOS18 [get_ports uart_int]

set_property PACKAGE_PIN BB22 [get_ports uart2_pl_rxd]
set_property PACKAGE_PIN BB23 [get_ports uart2_pl_txd]
