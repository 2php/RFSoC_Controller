# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/top_level_system_ila_0_1.xci
# IP: The module: 'top_level_system_ila_0_1' is the root of the design. Do not add the DONT_TOUCH constraint.

# Block Designs: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/bd_5b7c.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_5b7c || ORIG_REF_NAME==bd_5b7c} -quiet] -quiet

# IP: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/bd_5b7c_ila_lib_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_5b7c_ila_lib_0 || ORIG_REF_NAME==bd_5b7c_ila_lib_0} -quiet] -quiet

# IP: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_1/bd_5b7c_g_inst_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_5b7c_g_inst_0 || ORIG_REF_NAME==bd_5b7c_g_inst_0} -quiet] -quiet

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_5b7c_ila_lib_0 || ORIG_REF_NAME==bd_5b7c_ila_lib_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_5b7c_ila_lib_0 || ORIG_REF_NAME==bd_5b7c_ila_lib_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/bd_5b7c_ila_lib_0_ooc.xdc

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/bd_5b7c_ooc.xdc

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/top_level_system_ila_0_1_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'top_level_system_ila_0_1'. Do not add the DONT_TOUCH constraint.
set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# IP: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/top_level_system_ila_0_1.xci
# IP: The module: 'top_level_system_ila_0_1' is the root of the design. Do not add the DONT_TOUCH constraint.

# Block Designs: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/bd_5b7c.bd
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_5b7c || ORIG_REF_NAME==bd_5b7c} -quiet] -quiet

# IP: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/bd_5b7c_ila_lib_0.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_5b7c_ila_lib_0 || ORIG_REF_NAME==bd_5b7c_ila_lib_0} -quiet] -quiet

# IP: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_1/bd_5b7c_g_inst_0.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==bd_5b7c_g_inst_0 || ORIG_REF_NAME==bd_5b7c_g_inst_0} -quiet] -quiet

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila_impl.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_5b7c_ila_lib_0 || ORIG_REF_NAME==bd_5b7c_ila_lib_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/ila_v6_2/constraints/ila.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_5b7c_ila_lib_0 || ORIG_REF_NAME==bd_5b7c_ila_lib_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/ip/ip_0/bd_5b7c_ila_lib_0_ooc.xdc

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/bd_0/bd_5b7c_ooc.xdc

# XDC: c:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/top_level_system_ila_0_1_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'top_level_system_ila_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet