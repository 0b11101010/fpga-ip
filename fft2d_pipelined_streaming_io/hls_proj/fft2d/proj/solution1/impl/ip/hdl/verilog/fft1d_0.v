// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module fft1d_0 (
        in_V_dout,
        in_V_empty_n,
        in_V_read,
        out_V_din,
        out_V_full_n,
        out_V_write,
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input  [63:0] in_V_dout;
input   in_V_empty_n;
output   in_V_read;
output  [63:0] out_V_din;
input   out_V_full_n;
output   out_V_write;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire    fft1d_0_Block_codeRe_U0_ap_start;
wire    fft1d_0_Block_codeRe_U0_start_full_n;
wire    fft1d_0_Block_codeRe_U0_ap_done;
wire    fft1d_0_Block_codeRe_U0_ap_continue;
wire    fft1d_0_Block_codeRe_U0_ap_idle;
wire    fft1d_0_Block_codeRe_U0_ap_ready;
wire    fft1d_0_Block_codeRe_U0_start_out;
wire    fft1d_0_Block_codeRe_U0_start_write;
wire   [7:0] fft1d_0_Block_codeRe_U0_config_data_V_1_din;
wire    fft1d_0_Block_codeRe_U0_config_data_V_1_write;
wire    fft1d_0_Loop_1_proc2_U0_ap_start;
wire    fft1d_0_Loop_1_proc2_U0_ap_done;
wire    fft1d_0_Loop_1_proc2_U0_ap_continue;
wire    fft1d_0_Loop_1_proc2_U0_ap_idle;
wire    fft1d_0_Loop_1_proc2_U0_ap_ready;
wire    fft1d_0_Loop_1_proc2_U0_in_V_read;
wire   [63:0] fft1d_0_Loop_1_proc2_U0_xn_din;
wire    fft1d_0_Loop_1_proc2_U0_xn_write;
wire    fft_configuration_1_U0_ap_start;
wire    fft_configuration_1_U0_ap_done;
wire    fft_configuration_1_U0_ap_idle;
wire    fft_configuration_1_U0_ap_ready;
wire    fft_configuration_1_U0_ap_continue;
wire    fft_configuration_1_U0_xn_read;
wire   [63:0] fft_configuration_1_U0_xk_din;
wire    fft_configuration_1_U0_xk_write;
wire   [7:0] fft_configuration_1_U0_status_data_V_din;
wire    fft_configuration_1_U0_status_data_V_write;
wire    fft_configuration_1_U0_config_ch_data_V_read;
wire    fft1d_0_Loop_2_proc2_U0_ap_start;
wire    fft1d_0_Loop_2_proc2_U0_ap_done;
wire    fft1d_0_Loop_2_proc2_U0_ap_continue;
wire    fft1d_0_Loop_2_proc2_U0_ap_idle;
wire    fft1d_0_Loop_2_proc2_U0_ap_ready;
wire    fft1d_0_Loop_2_proc2_U0_xk_read;
wire   [63:0] fft1d_0_Loop_2_proc2_U0_out_V_din;
wire    fft1d_0_Loop_2_proc2_U0_out_V_write;
wire    ap_sync_continue;
wire    config_data_V_1_chan_full_n;
wire   [7:0] config_data_V_1_chan_dout;
wire    config_data_V_1_chan_empty_n;
wire    xn_channel_full_n;
wire   [63:0] xn_channel_dout;
wire    xn_channel_empty_n;
wire    xk_channel_full_n;
wire   [63:0] xk_channel_dout;
wire    xk_channel_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready;
wire    ap_sync_fft1d_0_Block_codeRe_U0_ap_ready;
reg   [1:0] fft1d_0_Block_codeRe_U0_ap_ready_count;
reg    ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready;
wire    ap_sync_fft1d_0_Loop_1_proc2_U0_ap_ready;
reg   [1:0] fft1d_0_Loop_1_proc2_U0_ap_ready_count;
wire   [0:0] start_for_fft_configuration_1_U0_din;
wire    start_for_fft_configuration_1_U0_full_n;
wire   [0:0] start_for_fft_configuration_1_U0_dout;
wire    start_for_fft_configuration_1_U0_empty_n;
wire   [0:0] start_for_fft1d_0_Loop_2_proc2_U0_din;
wire    start_for_fft1d_0_Loop_2_proc2_U0_full_n;
wire   [0:0] start_for_fft1d_0_Loop_2_proc2_U0_dout;
wire    start_for_fft1d_0_Loop_2_proc2_U0_empty_n;
wire    fft1d_0_Loop_1_proc2_U0_start_full_n;
wire    fft1d_0_Loop_1_proc2_U0_start_write;
wire    fft_configuration_1_U0_start_full_n;
wire    fft_configuration_1_U0_start_write;
wire    fft1d_0_Loop_2_proc2_U0_start_full_n;
wire    fft1d_0_Loop_2_proc2_U0_start_write;

// power-on initialization
initial begin
#0 ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready = 1'b0;
#0 fft1d_0_Block_codeRe_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready = 1'b0;
#0 fft1d_0_Loop_1_proc2_U0_ap_ready_count = 2'd0;
end

fft1d_0_Block_codeRe fft1d_0_Block_codeRe_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(fft1d_0_Block_codeRe_U0_ap_start),
    .start_full_n(fft1d_0_Block_codeRe_U0_start_full_n),
    .ap_done(fft1d_0_Block_codeRe_U0_ap_done),
    .ap_continue(fft1d_0_Block_codeRe_U0_ap_continue),
    .ap_idle(fft1d_0_Block_codeRe_U0_ap_idle),
    .ap_ready(fft1d_0_Block_codeRe_U0_ap_ready),
    .start_out(fft1d_0_Block_codeRe_U0_start_out),
    .start_write(fft1d_0_Block_codeRe_U0_start_write),
    .config_data_V_1_din(fft1d_0_Block_codeRe_U0_config_data_V_1_din),
    .config_data_V_1_full_n(config_data_V_1_chan_full_n),
    .config_data_V_1_write(fft1d_0_Block_codeRe_U0_config_data_V_1_write)
);

fft1d_0_Loop_1_proc2 fft1d_0_Loop_1_proc2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(fft1d_0_Loop_1_proc2_U0_ap_start),
    .ap_done(fft1d_0_Loop_1_proc2_U0_ap_done),
    .ap_continue(fft1d_0_Loop_1_proc2_U0_ap_continue),
    .ap_idle(fft1d_0_Loop_1_proc2_U0_ap_idle),
    .ap_ready(fft1d_0_Loop_1_proc2_U0_ap_ready),
    .in_V_dout(in_V_dout),
    .in_V_empty_n(in_V_empty_n),
    .in_V_read(fft1d_0_Loop_1_proc2_U0_in_V_read),
    .xn_din(fft1d_0_Loop_1_proc2_U0_xn_din),
    .xn_full_n(xn_channel_full_n),
    .xn_write(fft1d_0_Loop_1_proc2_U0_xn_write)
);

fft_configuration_1 fft_configuration_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(fft_configuration_1_U0_ap_start),
    .ap_ce(1'b1),
    .ap_done(fft_configuration_1_U0_ap_done),
    .ap_idle(fft_configuration_1_U0_ap_idle),
    .ap_ready(fft_configuration_1_U0_ap_ready),
    .ap_continue(fft_configuration_1_U0_ap_continue),
    .xn_dout(xn_channel_dout),
    .xn_empty_n(xn_channel_empty_n),
    .xn_read(fft_configuration_1_U0_xn_read),
    .xk_din(fft_configuration_1_U0_xk_din),
    .xk_full_n(xk_channel_full_n),
    .xk_write(fft_configuration_1_U0_xk_write),
    .status_data_V_din(fft_configuration_1_U0_status_data_V_din),
    .status_data_V_full_n(1'b1),
    .status_data_V_write(fft_configuration_1_U0_status_data_V_write),
    .config_ch_data_V_dout(config_data_V_1_chan_dout),
    .config_ch_data_V_empty_n(config_data_V_1_chan_empty_n),
    .config_ch_data_V_read(fft_configuration_1_U0_config_ch_data_V_read)
);

fft1d_0_Loop_2_proc2 fft1d_0_Loop_2_proc2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(fft1d_0_Loop_2_proc2_U0_ap_start),
    .ap_done(fft1d_0_Loop_2_proc2_U0_ap_done),
    .ap_continue(fft1d_0_Loop_2_proc2_U0_ap_continue),
    .ap_idle(fft1d_0_Loop_2_proc2_U0_ap_idle),
    .ap_ready(fft1d_0_Loop_2_proc2_U0_ap_ready),
    .xk_dout(xk_channel_dout),
    .xk_empty_n(xk_channel_empty_n),
    .xk_read(fft1d_0_Loop_2_proc2_U0_xk_read),
    .out_V_din(fft1d_0_Loop_2_proc2_U0_out_V_din),
    .out_V_full_n(out_V_full_n),
    .out_V_write(fft1d_0_Loop_2_proc2_U0_out_V_write)
);

fifo_w8_d2_A_x config_data_V_1_chan_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(fft1d_0_Block_codeRe_U0_config_data_V_1_din),
    .if_full_n(config_data_V_1_chan_full_n),
    .if_write(fft1d_0_Block_codeRe_U0_config_data_V_1_write),
    .if_dout(config_data_V_1_chan_dout),
    .if_empty_n(config_data_V_1_chan_empty_n),
    .if_read(fft_configuration_1_U0_config_ch_data_V_read)
);

fifo_w64_d32_A_x0 xn_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(fft1d_0_Loop_1_proc2_U0_xn_din),
    .if_full_n(xn_channel_full_n),
    .if_write(fft1d_0_Loop_1_proc2_U0_xn_write),
    .if_dout(xn_channel_dout),
    .if_empty_n(xn_channel_empty_n),
    .if_read(fft_configuration_1_U0_xn_read)
);

fifo_w64_d32_A_x0 xk_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(fft_configuration_1_U0_xk_din),
    .if_full_n(xk_channel_full_n),
    .if_write(fft_configuration_1_U0_xk_write),
    .if_dout(xk_channel_dout),
    .if_empty_n(xk_channel_empty_n),
    .if_read(fft1d_0_Loop_2_proc2_U0_xk_read)
);

start_for_fft_configuration_1_U0 start_for_fft_configuration_1_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_fft_configuration_1_U0_din),
    .if_full_n(start_for_fft_configuration_1_U0_full_n),
    .if_write(fft1d_0_Block_codeRe_U0_start_write),
    .if_dout(start_for_fft_configuration_1_U0_dout),
    .if_empty_n(start_for_fft_configuration_1_U0_empty_n),
    .if_read(fft_configuration_1_U0_ap_ready)
);

start_for_fft1d_0_Loop_2_proc2_U0 start_for_fft1d_0_Loop_2_proc2_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_fft1d_0_Loop_2_proc2_U0_din),
    .if_full_n(start_for_fft1d_0_Loop_2_proc2_U0_full_n),
    .if_write(fft1d_0_Block_codeRe_U0_start_write),
    .if_dout(start_for_fft1d_0_Loop_2_proc2_U0_dout),
    .if_empty_n(start_for_fft1d_0_Loop_2_proc2_U0_empty_n),
    .if_read(fft1d_0_Loop_2_proc2_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready <= ap_sync_fft1d_0_Block_codeRe_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready <= ap_sync_fft1d_0_Loop_1_proc2_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((fft1d_0_Block_codeRe_U0_ap_ready == 1'b0) & (ap_sync_ready == 1'b1))) begin
        fft1d_0_Block_codeRe_U0_ap_ready_count <= (fft1d_0_Block_codeRe_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (fft1d_0_Block_codeRe_U0_ap_ready == 1'b1))) begin
        fft1d_0_Block_codeRe_U0_ap_ready_count <= (fft1d_0_Block_codeRe_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((fft1d_0_Loop_1_proc2_U0_ap_ready == 1'b0) & (ap_sync_ready == 1'b1))) begin
        fft1d_0_Loop_1_proc2_U0_ap_ready_count <= (fft1d_0_Loop_1_proc2_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (fft1d_0_Loop_1_proc2_U0_ap_ready == 1'b1))) begin
        fft1d_0_Loop_1_proc2_U0_ap_ready_count <= (fft1d_0_Loop_1_proc2_U0_ap_ready_count + 2'd1);
    end
end

assign ap_done = fft1d_0_Loop_2_proc2_U0_ap_done;

assign ap_idle = (fft_configuration_1_U0_ap_idle & fft1d_0_Loop_2_proc2_U0_ap_idle & fft1d_0_Loop_1_proc2_U0_ap_idle & fft1d_0_Block_codeRe_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_continue = ap_continue;

assign ap_sync_done = fft1d_0_Loop_2_proc2_U0_ap_done;

assign ap_sync_fft1d_0_Block_codeRe_U0_ap_ready = (fft1d_0_Block_codeRe_U0_ap_ready | ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready);

assign ap_sync_fft1d_0_Loop_1_proc2_U0_ap_ready = (fft1d_0_Loop_1_proc2_U0_ap_ready | ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready);

assign ap_sync_ready = (ap_sync_fft1d_0_Loop_1_proc2_U0_ap_ready & ap_sync_fft1d_0_Block_codeRe_U0_ap_ready);

assign fft1d_0_Block_codeRe_U0_ap_continue = 1'b1;

assign fft1d_0_Block_codeRe_U0_ap_start = ((ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready ^ 1'b1) & ap_start);

assign fft1d_0_Block_codeRe_U0_start_full_n = (start_for_fft_configuration_1_U0_full_n & start_for_fft1d_0_Loop_2_proc2_U0_full_n);

assign fft1d_0_Loop_1_proc2_U0_ap_continue = 1'b1;

assign fft1d_0_Loop_1_proc2_U0_ap_start = ((ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready ^ 1'b1) & ap_start);

assign fft1d_0_Loop_1_proc2_U0_start_full_n = 1'b1;

assign fft1d_0_Loop_1_proc2_U0_start_write = 1'b0;

assign fft1d_0_Loop_2_proc2_U0_ap_continue = ap_continue;

assign fft1d_0_Loop_2_proc2_U0_ap_start = start_for_fft1d_0_Loop_2_proc2_U0_empty_n;

assign fft1d_0_Loop_2_proc2_U0_start_full_n = 1'b1;

assign fft1d_0_Loop_2_proc2_U0_start_write = 1'b0;

assign fft_configuration_1_U0_ap_continue = 1'b1;

assign fft_configuration_1_U0_ap_start = start_for_fft_configuration_1_U0_empty_n;

assign fft_configuration_1_U0_start_full_n = 1'b1;

assign fft_configuration_1_U0_start_write = 1'b0;

assign in_V_read = fft1d_0_Loop_1_proc2_U0_in_V_read;

assign out_V_din = fft1d_0_Loop_2_proc2_U0_out_V_din;

assign out_V_write = fft1d_0_Loop_2_proc2_U0_out_V_write;

assign start_for_fft1d_0_Loop_2_proc2_U0_din = 1'b1;

assign start_for_fft_configuration_1_U0_din = 1'b1;

endmodule //fft1d_0
