onerror {quit -f}
vlib work
vlog -work work cpu_io.vo
vlog -work work cpu_io.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cpu_io_vlg_vec_tst
vcd file -direction cpu_io.msim.vcd
vcd add -internal cpu_io_vlg_vec_tst/*
vcd add -internal cpu_io_vlg_vec_tst/i1/*
add wave /*
run -all
