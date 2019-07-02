onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+rfsoc_data_pipeline -L xil_defaultlib -L xpm -L gigantic_mux -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_1 -L axis_register_slice_v1_1_19 -L axis_dwidth_converter_v1_1_18 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.rfsoc_data_pipeline xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {rfsoc_data_pipeline.udo}

run -all

endsim

quit -force
