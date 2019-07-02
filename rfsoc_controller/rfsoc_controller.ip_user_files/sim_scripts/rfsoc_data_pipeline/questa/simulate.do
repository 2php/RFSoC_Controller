onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rfsoc_data_pipeline_opt

do {wave.do}

view wave
view structure
view signals

do {rfsoc_data_pipeline.udo}

run -all

quit -force
