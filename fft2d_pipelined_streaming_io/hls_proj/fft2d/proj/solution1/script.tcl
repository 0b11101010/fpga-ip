############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project proj
set_top fft2d_top
add_files fft2d_top.cpp
add_files -tb fft2d_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 2.5 -name default
config_sdx -target none
config_export -description {HLS 2D FFT IP} -display_name fft2d_processor -format ip_catalog -rtl vhdl -use_netlist none -vendor EA -version 1.0 -vivado_optimization_level 2 -vivado_phys_opt all -vivado_report_level 0
set_clock_uncertainty 12.5%
#source "./proj/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -trace_level all -rtl vhdl
export_design -flow syn -rtl vhdl -format ip_catalog -description "HLS 2D FFT IP" -vendor "EA" -display_name "fft2d_processor"
