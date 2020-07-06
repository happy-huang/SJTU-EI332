transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/sc_computer_main.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/sc_instmen.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/sc_datamem.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/sc_cu.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/sc_cpu.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/regfile.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/mux4x32.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/mux2x32.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/mux2x5.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/lpm_rom_irom.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/lpm_ram_dq_dram.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/io_output.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/io_input_mux.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/io_input.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/dff32.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/cpu_io.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/alu.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/clock_and_mem_clock.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/in_port.v}
vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/cpu_io/original/cpu_io/source {E:/software/altera/13.0/project/cpu_io/original/cpu_io/source/out_port_seg.v}

