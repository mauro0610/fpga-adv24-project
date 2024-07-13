onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xpm -L xbip_dsp48_wrapper_v3_0_6 -L xbip_utils_v3_0_13 -L xbip_pipe_v3_0_9 -L dsp_macro_v1_0_6 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.dsp_macro_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {dsp_macro_0.udo}

run 1000ns

quit -force