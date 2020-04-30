// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri May  1 00:27:20 2020
// Host        : erhan-G3-3779 running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/erhan/workspace/Xilinx/Vivado_HLS_2019.1/fft2d/proj/solution1/impl/vhdl/project.srcs/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fft2d_top,Vivado 2019.1" *)
module bd_0_hls_inst_0(ap_clk, ap_rst_n, xn_TVALID, xn_TREADY, xn_TDATA, 
  xn_TLAST, xk_TVALID, xk_TREADY, xk_TDATA, xk_TLAST)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,xn_TVALID,xn_TREADY,xn_TDATA[63:0],xn_TLAST[0:0],xk_TVALID,xk_TREADY,xk_TDATA[63:0],xk_TLAST[0:0]" */;
  input ap_clk;
  input ap_rst_n;
  input xn_TVALID;
  output xn_TREADY;
  input [63:0]xn_TDATA;
  input [0:0]xn_TLAST;
  output xk_TVALID;
  input xk_TREADY;
  output [63:0]xk_TDATA;
  output [0:0]xk_TLAST;
endmodule
