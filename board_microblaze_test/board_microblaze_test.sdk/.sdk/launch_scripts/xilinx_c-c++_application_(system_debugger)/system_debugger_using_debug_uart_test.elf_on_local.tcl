connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 1
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER1"  && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A5F038"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER1"  && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A5F038"} -index 0
dow C:/fpga_projects/board_microblaze_test/board_microblaze_test.sdk/uart_test/Debug/uart_test.elf
bpadd -addr &main
