transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/counter18 {E:/software/altera/13.0/project/counter18/counter18.v}

vlog -vlog01compat -work work +incdir+E:/software/altera/13.0/project/counter18/simulation/modelsim {E:/software/altera/13.0/project/counter18/simulation/modelsim/counter18.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  counter18_vlg_tst

add wave *
view structure
view signals
run -all