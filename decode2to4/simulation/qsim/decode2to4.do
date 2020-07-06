onerror {quit -f}
vlib work
vlog -work work decode2to4.vo
vlog -work work decode2to4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.decode2to4_vlg_vec_tst
vcd file -direction decode2to4.msim.vcd
vcd add -internal decode2to4_vlg_vec_tst/*
vcd add -internal decode2to4_vlg_vec_tst/i1/*
add wave /*
run -all
