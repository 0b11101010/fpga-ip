// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Loop_l_f1d_row_proc2 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        xk_mid_row_fifo_V_din,
        xk_mid_row_fifo_V_full_n,
        xk_mid_row_fifo_V_write,
        xn_fifo_V_dout,
        xn_fifo_V_empty_n,
        xn_fifo_V_read
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [63:0] xk_mid_row_fifo_V_din;
input   xk_mid_row_fifo_V_full_n;
output   xk_mid_row_fifo_V_write;
input  [63:0] xn_fifo_V_dout;
input   xn_fifo_V_empty_n;
output   xn_fifo_V_read;

reg ap_done;
reg ap_idle;
reg start_write;
reg xk_mid_row_fifo_V_write;
reg xn_fifo_V_read;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    xn_fifo_V_blk_n;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln130_fu_144_p2;
wire   [5:0] i_fu_138_p2;
reg   [5:0] i_reg_165;
wire    ap_CS_fsm_state2;
wire   [5:0] j_fu_150_p2;
wire    xn_mid_row_fifo_V_full_n;
reg    xn_mid_row_fifo_V_write;
reg    ap_block_state3;
wire    grp_fft1d_1_fu_125_in_V_read;
wire   [63:0] grp_fft1d_1_fu_125_out_V_din;
wire    grp_fft1d_1_fu_125_out_V_write;
wire    grp_fft1d_1_fu_125_ap_start;
wire    grp_fft1d_1_fu_125_ap_done;
wire    grp_fft1d_1_fu_125_ap_ready;
wire    grp_fft1d_1_fu_125_ap_idle;
reg    grp_fft1d_1_fu_125_ap_continue;
reg   [5:0] i1_0_reg_103;
wire    ap_CS_fsm_state4;
wire    ap_sync_grp_fft1d_1_fu_125_ap_ready;
wire    ap_sync_grp_fft1d_1_fu_125_ap_done;
reg    ap_block_state4_on_subcall_done;
reg    ap_block_state1;
reg   [5:0] j_0_reg_114;
wire   [0:0] icmp_ln128_fu_132_p2;
reg    grp_fft1d_1_fu_125_ap_start_reg;
reg    ap_block_state3_ignore_call0;
reg    ap_sync_reg_grp_fft1d_1_fu_125_ap_ready;
reg    ap_sync_reg_grp_fft1d_1_fu_125_ap_done;
wire   [63:0] xn_mid_row_fifo_V_dout;
wire    xn_mid_row_fifo_V_empty_n;
reg    xn_mid_row_fifo_V_read;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_fft1d_1_fu_125_ap_start_reg = 1'b0;
#0 ap_sync_reg_grp_fft1d_1_fu_125_ap_ready = 1'b0;
#0 ap_sync_reg_grp_fft1d_1_fu_125_ap_done = 1'b0;
end

fft1d_1 grp_fft1d_1_fu_125(
    .in_V_dout(xn_mid_row_fifo_V_dout),
    .in_V_empty_n(xn_mid_row_fifo_V_empty_n),
    .in_V_read(grp_fft1d_1_fu_125_in_V_read),
    .out_V_din(grp_fft1d_1_fu_125_out_V_din),
    .out_V_full_n(xk_mid_row_fifo_V_full_n),
    .out_V_write(grp_fft1d_1_fu_125_out_V_write),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_fft1d_1_fu_125_ap_start),
    .ap_done(grp_fft1d_1_fu_125_ap_done),
    .ap_ready(grp_fft1d_1_fu_125_ap_ready),
    .ap_idle(grp_fft1d_1_fu_125_ap_idle),
    .ap_continue(grp_fft1d_1_fu_125_ap_continue)
);

fifo_w64_d32_A_x xn_mid_row_fifo_V_fifo_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(xn_fifo_V_dout),
    .if_full_n(xn_mid_row_fifo_V_full_n),
    .if_write(xn_mid_row_fifo_V_write),
    .if_dout(xn_mid_row_fifo_V_dout),
    .if_empty_n(xn_mid_row_fifo_V_empty_n),
    .if_read(xn_mid_row_fifo_V_read)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln128_fu_132_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_fft1d_1_fu_125_ap_done <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
            ap_sync_reg_grp_fft1d_1_fu_125_ap_done <= 1'b0;
        end else if ((grp_fft1d_1_fu_125_ap_done == 1'b1)) begin
            ap_sync_reg_grp_fft1d_1_fu_125_ap_done <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_grp_fft1d_1_fu_125_ap_ready <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
            ap_sync_reg_grp_fft1d_1_fu_125_ap_ready <= 1'b0;
        end else if ((grp_fft1d_1_fu_125_ap_ready == 1'b1)) begin
            ap_sync_reg_grp_fft1d_1_fu_125_ap_ready <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_fft1d_1_fu_125_ap_start_reg <= 1'b0;
    end else begin
        if ((((ap_sync_grp_fft1d_1_fu_125_ap_ready == 1'b0) & (1'b1 == ap_CS_fsm_state4)) | (~(((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0))) & (icmp_ln130_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3)))) begin
            grp_fft1d_1_fu_125_ap_start_reg <= 1'b1;
        end else if ((grp_fft1d_1_fu_125_ap_ready == 1'b1)) begin
            grp_fft1d_1_fu_125_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i1_0_reg_103 <= 6'd0;
    end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
        i1_0_reg_103 <= i_reg_165;
    end
end

always @ (posedge ap_clk) begin
    if ((~(((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0))) & (icmp_ln130_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        j_0_reg_114 <= j_fu_150_p2;
    end else if (((icmp_ln128_fu_132_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        j_0_reg_114 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_reg_165 <= i_fu_138_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln128_fu_132_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
        grp_fft1d_1_fu_125_ap_continue = 1'b1;
    end else begin
        grp_fft1d_1_fu_125_ap_continue = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln128_fu_132_p2 == 1'd1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        xk_mid_row_fifo_V_write = grp_fft1d_1_fu_125_out_V_write;
    end else begin
        xk_mid_row_fifo_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln130_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        xn_fifo_V_blk_n = xn_fifo_V_empty_n;
    end else begin
        xn_fifo_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0))) & (icmp_ln130_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        xn_fifo_V_read = 1'b1;
    end else begin
        xn_fifo_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        xn_mid_row_fifo_V_read = grp_fft1d_1_fu_125_in_V_read;
    end else begin
        xn_mid_row_fifo_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~(((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0))) & (icmp_ln130_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        xn_mid_row_fifo_V_write = 1'b1;
    end else begin
        xn_mid_row_fifo_V_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln128_fu_132_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~(((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0))) & (icmp_ln130_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if ((~(((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0))) & (icmp_ln130_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state3 = (((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state3_ignore_call0 = (((icmp_ln130_fu_144_p2 == 1'd0) & (xn_mid_row_fifo_V_full_n == 1'b0)) | ((icmp_ln130_fu_144_p2 == 1'd0) & (xn_fifo_V_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state4_on_subcall_done = ((ap_sync_grp_fft1d_1_fu_125_ap_ready & ap_sync_grp_fft1d_1_fu_125_ap_done) == 1'b0);
end

assign ap_ready = internal_ap_ready;

assign ap_sync_grp_fft1d_1_fu_125_ap_done = (grp_fft1d_1_fu_125_ap_done | ap_sync_reg_grp_fft1d_1_fu_125_ap_done);

assign ap_sync_grp_fft1d_1_fu_125_ap_ready = (grp_fft1d_1_fu_125_ap_ready | ap_sync_reg_grp_fft1d_1_fu_125_ap_ready);

assign grp_fft1d_1_fu_125_ap_start = grp_fft1d_1_fu_125_ap_start_reg;

assign i_fu_138_p2 = (i1_0_reg_103 + 6'd1);

assign icmp_ln128_fu_132_p2 = ((i1_0_reg_103 == 6'd32) ? 1'b1 : 1'b0);

assign icmp_ln130_fu_144_p2 = ((j_0_reg_114 == 6'd32) ? 1'b1 : 1'b0);

assign j_fu_150_p2 = (j_0_reg_114 + 6'd1);

assign start_out = real_start;

assign xk_mid_row_fifo_V_din = grp_fft1d_1_fu_125_out_V_din;

endmodule //Loop_l_f1d_row_proc2
