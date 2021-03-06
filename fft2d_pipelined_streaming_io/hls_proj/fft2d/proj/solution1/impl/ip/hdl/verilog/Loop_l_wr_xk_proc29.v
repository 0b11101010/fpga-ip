// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Loop_l_wr_xk_proc29 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        xk_fifo_V_dout,
        xk_fifo_V_empty_n,
        xk_fifo_V_read,
        xk_TDATA,
        xk_TVALID,
        xk_TREADY,
        xk_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [63:0] xk_fifo_V_dout;
input   xk_fifo_V_empty_n;
output   xk_fifo_V_read;
output  [63:0] xk_TDATA;
output   xk_TVALID;
input   xk_TREADY;
output  [0:0] xk_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg xk_fifo_V_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [63:0] xk_data_1_data_out;
reg    xk_data_1_vld_in;
wire    xk_data_1_vld_out;
wire    xk_data_1_ack_in;
wire    xk_data_1_ack_out;
reg   [63:0] xk_data_1_payload_A;
reg   [63:0] xk_data_1_payload_B;
reg    xk_data_1_sel_rd;
reg    xk_data_1_sel_wr;
wire    xk_data_1_sel;
wire    xk_data_1_load_A;
wire    xk_data_1_load_B;
reg   [1:0] xk_data_1_state;
wire    xk_data_1_state_cmp_full;
reg   [0:0] xk_last_1_data_out;
reg    xk_last_1_vld_in;
wire    xk_last_1_vld_out;
wire    xk_last_1_ack_in;
wire    xk_last_1_ack_out;
reg   [0:0] xk_last_1_payload_A;
reg   [0:0] xk_last_1_payload_B;
reg    xk_last_1_sel_rd;
reg    xk_last_1_sel_wr;
wire    xk_last_1_sel;
wire    xk_last_1_load_A;
wire    xk_last_1_load_B;
reg   [1:0] xk_last_1_state;
wire    xk_last_1_state_cmp_full;
reg    xk_fifo_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln192_reg_112;
reg    xk_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] icmp_ln192_reg_112_pp0_iter1_reg;
reg   [10:0] i13_0_reg_83;
wire   [0:0] icmp_ln192_fu_94_p2;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
wire    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
wire   [10:0] i_fu_100_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln198_fu_106_p2;
reg   [0:0] icmp_ln198_reg_121;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_block_pp0_stage0_01001;
wire    ap_CS_fsm_state5;
reg    ap_block_state5;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 xk_data_1_sel_rd = 1'b0;
#0 xk_data_1_sel_wr = 1'b0;
#0 xk_data_1_state = 2'd0;
#0 xk_last_1_sel_rd = 1'b0;
#0 xk_last_1_sel_wr = 1'b0;
#0 xk_last_1_state = 2'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

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
        end else if ((~((xk_last_1_state == 2'd1) | (xk_data_1_state == 2'd1) | ((xk_data_1_state == 2'd3) & (xk_TREADY == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        xk_data_1_sel_rd <= 1'b0;
    end else begin
        if (((xk_data_1_ack_out == 1'b1) & (xk_data_1_vld_out == 1'b1))) begin
            xk_data_1_sel_rd <= ~xk_data_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        xk_data_1_sel_wr <= 1'b0;
    end else begin
        if (((xk_data_1_ack_in == 1'b1) & (xk_data_1_vld_in == 1'b1))) begin
            xk_data_1_sel_wr <= ~xk_data_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        xk_data_1_state <= 2'd0;
    end else begin
        if ((((xk_data_1_state == 2'd2) & (xk_data_1_vld_in == 1'b0)) | ((xk_data_1_state == 2'd3) & (xk_data_1_vld_in == 1'b0) & (xk_data_1_ack_out == 1'b1)))) begin
            xk_data_1_state <= 2'd2;
        end else if ((((xk_data_1_state == 2'd1) & (xk_TREADY == 1'b0)) | ((xk_data_1_state == 2'd3) & (xk_TREADY == 1'b0) & (xk_data_1_vld_in == 1'b1)))) begin
            xk_data_1_state <= 2'd1;
        end else if (((~((xk_data_1_vld_in == 1'b0) & (xk_data_1_ack_out == 1'b1)) & ~((xk_TREADY == 1'b0) & (xk_data_1_vld_in == 1'b1)) & (xk_data_1_state == 2'd3)) | ((xk_data_1_state == 2'd1) & (xk_data_1_ack_out == 1'b1)) | ((xk_data_1_state == 2'd2) & (xk_data_1_vld_in == 1'b1)))) begin
            xk_data_1_state <= 2'd3;
        end else begin
            xk_data_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        xk_last_1_sel_rd <= 1'b0;
    end else begin
        if (((xk_last_1_ack_out == 1'b1) & (xk_last_1_vld_out == 1'b1))) begin
            xk_last_1_sel_rd <= ~xk_last_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        xk_last_1_sel_wr <= 1'b0;
    end else begin
        if (((xk_last_1_ack_in == 1'b1) & (xk_last_1_vld_in == 1'b1))) begin
            xk_last_1_sel_wr <= ~xk_last_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        xk_last_1_state <= 2'd0;
    end else begin
        if ((((xk_last_1_state == 2'd2) & (xk_last_1_vld_in == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_last_1_vld_in == 1'b0) & (xk_last_1_ack_out == 1'b1)))) begin
            xk_last_1_state <= 2'd2;
        end else if ((((xk_last_1_state == 2'd1) & (xk_TREADY == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_TREADY == 1'b0) & (xk_last_1_vld_in == 1'b1)))) begin
            xk_last_1_state <= 2'd1;
        end else if (((~((xk_last_1_vld_in == 1'b0) & (xk_last_1_ack_out == 1'b1)) & ~((xk_TREADY == 1'b0) & (xk_last_1_vld_in == 1'b1)) & (xk_last_1_state == 2'd3)) | ((xk_last_1_state == 2'd1) & (xk_last_1_ack_out == 1'b1)) | ((xk_last_1_state == 2'd2) & (xk_last_1_vld_in == 1'b1)))) begin
            xk_last_1_state <= 2'd3;
        end else begin
            xk_last_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i13_0_reg_83 <= 11'd0;
    end else if (((icmp_ln192_fu_94_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i13_0_reg_83 <= i_fu_100_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln192_reg_112 <= icmp_ln192_fu_94_p2;
        icmp_ln192_reg_112_pp0_iter1_reg <= icmp_ln192_reg_112;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln192_fu_94_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln198_reg_121 <= icmp_ln198_fu_106_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((xk_data_1_load_A == 1'b1)) begin
        xk_data_1_payload_A <= xk_fifo_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((xk_data_1_load_B == 1'b1)) begin
        xk_data_1_payload_B <= xk_fifo_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((xk_last_1_load_A == 1'b1)) begin
        xk_last_1_payload_A <= icmp_ln198_reg_121;
    end
end

always @ (posedge ap_clk) begin
    if ((xk_last_1_load_B == 1'b1)) begin
        xk_last_1_payload_B <= icmp_ln198_reg_121;
    end
end

always @ (*) begin
    if ((icmp_ln192_fu_94_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((~((xk_last_1_state == 2'd1) | (xk_data_1_state == 2'd1) | ((xk_data_1_state == 2'd3) & (xk_TREADY == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((xk_last_1_state == 2'd1) | (xk_data_1_state == 2'd1) | ((xk_data_1_state == 2'd3) & (xk_TREADY == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln192_reg_112_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((icmp_ln192_reg_112 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        xk_TDATA_blk_n = xk_data_1_state[1'd1];
    end else begin
        xk_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((xk_data_1_sel == 1'b1)) begin
        xk_data_1_data_out = xk_data_1_payload_B;
    end else begin
        xk_data_1_data_out = xk_data_1_payload_A;
    end
end

always @ (*) begin
    if (((icmp_ln192_reg_112 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        xk_data_1_vld_in = 1'b1;
    end else begin
        xk_data_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln192_reg_112 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        xk_fifo_V_blk_n = xk_fifo_V_empty_n;
    end else begin
        xk_fifo_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln192_reg_112 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        xk_fifo_V_read = 1'b1;
    end else begin
        xk_fifo_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((xk_last_1_sel == 1'b1)) begin
        xk_last_1_data_out = xk_last_1_payload_B;
    end else begin
        xk_last_1_data_out = xk_last_1_payload_A;
    end
end

always @ (*) begin
    if (((icmp_ln192_reg_112 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        xk_last_1_vld_in = 1'b1;
    end else begin
        xk_last_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((icmp_ln192_fu_94_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((icmp_ln192_fu_94_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((xk_last_1_state == 2'd1) | (xk_data_1_state == 2'd1) | ((xk_data_1_state == 2'd3) & (xk_TREADY == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln192_reg_112 == 1'd0) & (xk_fifo_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln192_reg_112 == 1'd0) & (xk_fifo_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln192_reg_112 == 1'd0) & (xk_fifo_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((icmp_ln192_reg_112 == 1'd0) & (xk_last_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((icmp_ln192_reg_112 == 1'd0) & (xk_fifo_V_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state4_io = ((icmp_ln192_reg_112_pp0_iter1_reg == 1'd0) & (xk_last_1_ack_in == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5 = ((xk_last_1_state == 2'd1) | (xk_data_1_state == 2'd1) | ((xk_data_1_state == 2'd3) & (xk_TREADY == 1'b0)) | ((xk_last_1_state == 2'd3) & (xk_TREADY == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign i_fu_100_p2 = (i13_0_reg_83 + 11'd1);

assign icmp_ln192_fu_94_p2 = ((i13_0_reg_83 == 11'd1024) ? 1'b1 : 1'b0);

assign icmp_ln198_fu_106_p2 = ((i13_0_reg_83 == 11'd1023) ? 1'b1 : 1'b0);

assign xk_TDATA = xk_data_1_data_out;

assign xk_TLAST = xk_last_1_data_out;

assign xk_TVALID = xk_last_1_state[1'd0];

assign xk_data_1_ack_in = xk_data_1_state[1'd1];

assign xk_data_1_ack_out = xk_TREADY;

assign xk_data_1_load_A = (xk_data_1_state_cmp_full & ~xk_data_1_sel_wr);

assign xk_data_1_load_B = (xk_data_1_state_cmp_full & xk_data_1_sel_wr);

assign xk_data_1_sel = xk_data_1_sel_rd;

assign xk_data_1_state_cmp_full = ((xk_data_1_state != 2'd1) ? 1'b1 : 1'b0);

assign xk_data_1_vld_out = xk_data_1_state[1'd0];

assign xk_last_1_ack_in = xk_last_1_state[1'd1];

assign xk_last_1_ack_out = xk_TREADY;

assign xk_last_1_load_A = (xk_last_1_state_cmp_full & ~xk_last_1_sel_wr);

assign xk_last_1_load_B = (xk_last_1_state_cmp_full & xk_last_1_sel_wr);

assign xk_last_1_sel = xk_last_1_sel_rd;

assign xk_last_1_state_cmp_full = ((xk_last_1_state != 2'd1) ? 1'b1 : 1'b0);

assign xk_last_1_vld_out = xk_last_1_state[1'd0];

endmodule //Loop_l_wr_xk_proc29
