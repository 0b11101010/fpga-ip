
/opt/Xilinx/Vivado/2019.1/bin/xelab xil_defaultlib.apatb_fft2d_top_top glbl -prj fft2d_top.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims  -L unisims_ver -L xpm --initfile "/opt/Xilinx/Vivado/2019.1/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s fft2d_top -debug wave
/opt/Xilinx/Vivado/2019.1/bin/xsim --noieeewarnings fft2d_top -tclbatch fft2d_top.tcl

