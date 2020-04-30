-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fft2d_top is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    xn_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    xn_TLAST : IN STD_LOGIC;
    xk_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    xk_TLAST : OUT STD_LOGIC;
    xn_TVALID : IN STD_LOGIC;
    xn_TREADY : OUT STD_LOGIC;
    xk_TVALID : OUT STD_LOGIC;
    xk_TREADY : IN STD_LOGIC );
end;


architecture behav of fft2d_top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fft2d_top,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvc1156-2-e,HLS_INPUT_CLOCK=2.500000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=2.188000,HLS_SYN_LAT=17299,HLS_SYN_TPT=8898,HLS_SYN_MEM=44,HLS_SYN_DSP=0,HLS_SYN_FF=15930,HLS_SYN_LUT=13380,HLS_VERSION=2019_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";

    signal ap_rst_n_inv : STD_LOGIC;
    signal arr1_i_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal arr1_t_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal arr0_i_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal arr0_t_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal Loop_l_rd_xn_proc23_U0_ap_start : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_ap_done : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_ap_continue : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_ap_idle : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_ap_ready : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_start_out : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_start_write : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_xn_TREADY : STD_LOGIC;
    signal Loop_l_rd_xn_proc23_U0_xn_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal Loop_l_rd_xn_proc23_U0_xn_fifo_V_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Loop_l_rd_xn_proc23_U0_xn_fifo_V_write : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_ap_start : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_ap_done : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_ap_continue : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_ap_idle : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_ap_ready : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_start_out : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_start_write : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_xk_mid_row_fifo_V_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Loop_l_f1d_row_proc2_U0_xk_mid_row_fifo_V_write : STD_LOGIC;
    signal Loop_l_f1d_row_proc2_U0_xn_fifo_V_read : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_ap_start : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_ap_done : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_ap_continue : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_ap_idle : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_ap_ready : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_xk_mid_row_fifo_V_read : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_arr0_address1 : STD_LOGIC_VECTOR (9 downto 0);
    signal Loop_l_transp_mid_pr_U0_arr0_ce1 : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_arr0_we1 : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_arr0_d1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_channel_done_arr0 : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_arr0_full_n : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_ap_start : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_ap_done : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_ap_continue : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_ap_idle : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_ap_ready : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_start_out : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_start_write : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_xk_mid_col_fifo_V_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Loop_l_f1d_col_proc2_U0_xk_mid_col_fifo_V_write : STD_LOGIC;
    signal Loop_l_f1d_col_proc2_U0_arr0_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal Loop_l_f1d_col_proc2_U0_arr0_ce0 : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_ap_start : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_ap_done : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_ap_continue : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_ap_idle : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_ap_ready : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_xk_mid_col_fifo_V_read : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_arr1_address1 : STD_LOGIC_VECTOR (9 downto 0);
    signal Loop_l_transp_out_pr_U0_arr1_ce1 : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_arr1_we1 : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_arr1_d1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_channel_done_arr1 : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_arr1_full_n : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_ap_start : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_ap_done : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_ap_continue : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_ap_idle : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_ap_ready : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_start_out : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_start_write : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_arr1_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal Loop_l_wr_o_fifo_pro_U0_arr1_ce0 : STD_LOGIC;
    signal Loop_l_wr_o_fifo_pro_U0_xk_fifo_V_din : STD_LOGIC_VECTOR (63 downto 0);
    signal Loop_l_wr_o_fifo_pro_U0_xk_fifo_V_write : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_ap_start : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_ap_done : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_ap_continue : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_ap_idle : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_ap_ready : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_xk_fifo_V_read : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_xk_TDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal Loop_l_wr_xk_proc29_U0_xk_TVALID : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_xk_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sync_continue : STD_LOGIC;
    signal arr0_i_full_n : STD_LOGIC;
    signal arr0_t_empty_n : STD_LOGIC;
    signal arr0_t_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal arr0_t_we0 : STD_LOGIC;
    signal arr1_i_full_n : STD_LOGIC;
    signal arr1_t_empty_n : STD_LOGIC;
    signal arr1_t_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal arr1_t_we0 : STD_LOGIC;
    signal xn_fifo_V_full_n : STD_LOGIC;
    signal xn_fifo_V_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal xn_fifo_V_empty_n : STD_LOGIC;
    signal xk_mid_row_fifo_V_full_n : STD_LOGIC;
    signal xk_mid_row_fifo_V_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal xk_mid_row_fifo_V_empty_n : STD_LOGIC;
    signal xk_mid_col_fifo_V_full_n : STD_LOGIC;
    signal xk_mid_col_fifo_V_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal xk_mid_col_fifo_V_empty_n : STD_LOGIC;
    signal xk_fifo_V_full_n : STD_LOGIC;
    signal xk_fifo_V_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal xk_fifo_V_empty_n : STD_LOGIC;
    signal start_for_Loop_l_f1d_row_proc2_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_f1d_row_proc2_U0_full_n : STD_LOGIC;
    signal start_for_Loop_l_f1d_row_proc2_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_f1d_row_proc2_U0_empty_n : STD_LOGIC;
    signal start_for_Loop_l_transp_mid_pr_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_transp_mid_pr_U0_full_n : STD_LOGIC;
    signal start_for_Loop_l_transp_mid_pr_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_transp_mid_pr_U0_empty_n : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_start_full_n : STD_LOGIC;
    signal Loop_l_transp_mid_pr_U0_start_write : STD_LOGIC;
    signal start_for_Loop_l_transp_out_pr_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_transp_out_pr_U0_full_n : STD_LOGIC;
    signal start_for_Loop_l_transp_out_pr_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_transp_out_pr_U0_empty_n : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_start_full_n : STD_LOGIC;
    signal Loop_l_transp_out_pr_U0_start_write : STD_LOGIC;
    signal start_for_Loop_l_wr_xk_proc29_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_wr_xk_proc29_U0_full_n : STD_LOGIC;
    signal start_for_Loop_l_wr_xk_proc29_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Loop_l_wr_xk_proc29_U0_empty_n : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_start_full_n : STD_LOGIC;
    signal Loop_l_wr_xk_proc29_U0_start_write : STD_LOGIC;

    component Loop_l_rd_xn_proc23 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        xn_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        xn_TVALID : IN STD_LOGIC;
        xn_TREADY : OUT STD_LOGIC;
        xn_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        xn_fifo_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        xn_fifo_V_full_n : IN STD_LOGIC;
        xn_fifo_V_write : OUT STD_LOGIC );
    end component;


    component Loop_l_f1d_row_proc2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        xk_mid_row_fifo_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        xk_mid_row_fifo_V_full_n : IN STD_LOGIC;
        xk_mid_row_fifo_V_write : OUT STD_LOGIC;
        xn_fifo_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        xn_fifo_V_empty_n : IN STD_LOGIC;
        xn_fifo_V_read : OUT STD_LOGIC );
    end component;


    component Loop_l_transp_mid_pr IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        xk_mid_row_fifo_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        xk_mid_row_fifo_V_empty_n : IN STD_LOGIC;
        xk_mid_row_fifo_V_read : OUT STD_LOGIC;
        arr0_address1 : OUT STD_LOGIC_VECTOR (9 downto 0);
        arr0_ce1 : OUT STD_LOGIC;
        arr0_we1 : OUT STD_LOGIC;
        arr0_d1 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component Loop_l_f1d_col_proc2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        xk_mid_col_fifo_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        xk_mid_col_fifo_V_full_n : IN STD_LOGIC;
        xk_mid_col_fifo_V_write : OUT STD_LOGIC;
        arr0_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
        arr0_ce0 : OUT STD_LOGIC;
        arr0_q0 : IN STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component Loop_l_transp_out_pr IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        xk_mid_col_fifo_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        xk_mid_col_fifo_V_empty_n : IN STD_LOGIC;
        xk_mid_col_fifo_V_read : OUT STD_LOGIC;
        arr1_address1 : OUT STD_LOGIC_VECTOR (9 downto 0);
        arr1_ce1 : OUT STD_LOGIC;
        arr1_we1 : OUT STD_LOGIC;
        arr1_d1 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component Loop_l_wr_o_fifo_pro IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        arr1_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
        arr1_ce0 : OUT STD_LOGIC;
        arr1_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        xk_fifo_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        xk_fifo_V_full_n : IN STD_LOGIC;
        xk_fifo_V_write : OUT STD_LOGIC );
    end component;


    component Loop_l_wr_xk_proc29 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        xk_fifo_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        xk_fifo_V_empty_n : IN STD_LOGIC;
        xk_fifo_V_read : OUT STD_LOGIC;
        xk_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        xk_TVALID : OUT STD_LOGIC;
        xk_TREADY : IN STD_LOGIC;
        xk_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component fft2d_top_arr1 IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        i_address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        i_ce0 : IN STD_LOGIC;
        i_q0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        i_address1 : IN STD_LOGIC_VECTOR (9 downto 0);
        i_ce1 : IN STD_LOGIC;
        i_we1 : IN STD_LOGIC;
        i_d1 : IN STD_LOGIC_VECTOR (63 downto 0);
        t_address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        t_ce0 : IN STD_LOGIC;
        t_q0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        t_address1 : IN STD_LOGIC_VECTOR (9 downto 0);
        t_ce1 : IN STD_LOGIC;
        t_we1 : IN STD_LOGIC;
        t_d1 : IN STD_LOGIC_VECTOR (63 downto 0);
        i_ce : IN STD_LOGIC;
        t_ce : IN STD_LOGIC;
        i_full_n : OUT STD_LOGIC;
        i_write : IN STD_LOGIC;
        t_empty_n : OUT STD_LOGIC;
        t_read : IN STD_LOGIC );
    end component;


    component fifo_w64_d32_A_x2 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (63 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (63 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_Loop_l_f1d_row_proc2_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_Loop_l_transp_mid_pr_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_Loop_l_transp_out_pr_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_Loop_l_wr_xk_proc29_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    arr1_U : component fft2d_top_arr1
    generic map (
        DataWidth => 64,
        AddressRange => 1024,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        i_address0 => ap_const_lv10_0,
        i_ce0 => ap_const_logic_0,
        i_q0 => arr1_i_q0,
        i_address1 => Loop_l_transp_out_pr_U0_arr1_address1,
        i_ce1 => Loop_l_transp_out_pr_U0_arr1_ce1,
        i_we1 => Loop_l_transp_out_pr_U0_arr1_we1,
        i_d1 => Loop_l_transp_out_pr_U0_arr1_d1,
        t_address0 => Loop_l_wr_o_fifo_pro_U0_arr1_address0,
        t_ce0 => Loop_l_wr_o_fifo_pro_U0_arr1_ce0,
        t_q0 => arr1_t_q0,
        t_address1 => ap_const_lv10_0,
        t_ce1 => ap_const_logic_0,
        t_we1 => ap_const_logic_0,
        t_d1 => ap_const_lv64_0,
        i_ce => ap_const_logic_1,
        t_ce => ap_const_logic_1,
        i_full_n => arr1_i_full_n,
        i_write => Loop_l_transp_out_pr_U0_ap_done,
        t_empty_n => arr1_t_empty_n,
        t_read => Loop_l_wr_o_fifo_pro_U0_ap_ready);

    arr0_U : component fft2d_top_arr1
    generic map (
        DataWidth => 64,
        AddressRange => 1024,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        i_address0 => ap_const_lv10_0,
        i_ce0 => ap_const_logic_0,
        i_q0 => arr0_i_q0,
        i_address1 => Loop_l_transp_mid_pr_U0_arr0_address1,
        i_ce1 => Loop_l_transp_mid_pr_U0_arr0_ce1,
        i_we1 => Loop_l_transp_mid_pr_U0_arr0_we1,
        i_d1 => Loop_l_transp_mid_pr_U0_arr0_d1,
        t_address0 => Loop_l_f1d_col_proc2_U0_arr0_address0,
        t_ce0 => Loop_l_f1d_col_proc2_U0_arr0_ce0,
        t_q0 => arr0_t_q0,
        t_address1 => ap_const_lv10_0,
        t_ce1 => ap_const_logic_0,
        t_we1 => ap_const_logic_0,
        t_d1 => ap_const_lv64_0,
        i_ce => ap_const_logic_1,
        t_ce => ap_const_logic_1,
        i_full_n => arr0_i_full_n,
        i_write => Loop_l_transp_mid_pr_U0_ap_done,
        t_empty_n => arr0_t_empty_n,
        t_read => Loop_l_f1d_col_proc2_U0_ap_ready);

    Loop_l_rd_xn_proc23_U0 : component Loop_l_rd_xn_proc23
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_rd_xn_proc23_U0_ap_start,
        start_full_n => start_for_Loop_l_f1d_row_proc2_U0_full_n,
        ap_done => Loop_l_rd_xn_proc23_U0_ap_done,
        ap_continue => Loop_l_rd_xn_proc23_U0_ap_continue,
        ap_idle => Loop_l_rd_xn_proc23_U0_ap_idle,
        ap_ready => Loop_l_rd_xn_proc23_U0_ap_ready,
        start_out => Loop_l_rd_xn_proc23_U0_start_out,
        start_write => Loop_l_rd_xn_proc23_U0_start_write,
        xn_TDATA => xn_TDATA,
        xn_TVALID => xn_TVALID,
        xn_TREADY => Loop_l_rd_xn_proc23_U0_xn_TREADY,
        xn_TLAST => Loop_l_rd_xn_proc23_U0_xn_TLAST,
        xn_fifo_V_din => Loop_l_rd_xn_proc23_U0_xn_fifo_V_din,
        xn_fifo_V_full_n => xn_fifo_V_full_n,
        xn_fifo_V_write => Loop_l_rd_xn_proc23_U0_xn_fifo_V_write);

    Loop_l_f1d_row_proc2_U0 : component Loop_l_f1d_row_proc2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_f1d_row_proc2_U0_ap_start,
        start_full_n => start_for_Loop_l_transp_mid_pr_U0_full_n,
        ap_done => Loop_l_f1d_row_proc2_U0_ap_done,
        ap_continue => Loop_l_f1d_row_proc2_U0_ap_continue,
        ap_idle => Loop_l_f1d_row_proc2_U0_ap_idle,
        ap_ready => Loop_l_f1d_row_proc2_U0_ap_ready,
        start_out => Loop_l_f1d_row_proc2_U0_start_out,
        start_write => Loop_l_f1d_row_proc2_U0_start_write,
        xk_mid_row_fifo_V_din => Loop_l_f1d_row_proc2_U0_xk_mid_row_fifo_V_din,
        xk_mid_row_fifo_V_full_n => xk_mid_row_fifo_V_full_n,
        xk_mid_row_fifo_V_write => Loop_l_f1d_row_proc2_U0_xk_mid_row_fifo_V_write,
        xn_fifo_V_dout => xn_fifo_V_dout,
        xn_fifo_V_empty_n => xn_fifo_V_empty_n,
        xn_fifo_V_read => Loop_l_f1d_row_proc2_U0_xn_fifo_V_read);

    Loop_l_transp_mid_pr_U0 : component Loop_l_transp_mid_pr
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_transp_mid_pr_U0_ap_start,
        ap_done => Loop_l_transp_mid_pr_U0_ap_done,
        ap_continue => Loop_l_transp_mid_pr_U0_ap_continue,
        ap_idle => Loop_l_transp_mid_pr_U0_ap_idle,
        ap_ready => Loop_l_transp_mid_pr_U0_ap_ready,
        xk_mid_row_fifo_V_dout => xk_mid_row_fifo_V_dout,
        xk_mid_row_fifo_V_empty_n => xk_mid_row_fifo_V_empty_n,
        xk_mid_row_fifo_V_read => Loop_l_transp_mid_pr_U0_xk_mid_row_fifo_V_read,
        arr0_address1 => Loop_l_transp_mid_pr_U0_arr0_address1,
        arr0_ce1 => Loop_l_transp_mid_pr_U0_arr0_ce1,
        arr0_we1 => Loop_l_transp_mid_pr_U0_arr0_we1,
        arr0_d1 => Loop_l_transp_mid_pr_U0_arr0_d1);

    Loop_l_f1d_col_proc2_U0 : component Loop_l_f1d_col_proc2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_f1d_col_proc2_U0_ap_start,
        start_full_n => start_for_Loop_l_transp_out_pr_U0_full_n,
        ap_done => Loop_l_f1d_col_proc2_U0_ap_done,
        ap_continue => Loop_l_f1d_col_proc2_U0_ap_continue,
        ap_idle => Loop_l_f1d_col_proc2_U0_ap_idle,
        ap_ready => Loop_l_f1d_col_proc2_U0_ap_ready,
        start_out => Loop_l_f1d_col_proc2_U0_start_out,
        start_write => Loop_l_f1d_col_proc2_U0_start_write,
        xk_mid_col_fifo_V_din => Loop_l_f1d_col_proc2_U0_xk_mid_col_fifo_V_din,
        xk_mid_col_fifo_V_full_n => xk_mid_col_fifo_V_full_n,
        xk_mid_col_fifo_V_write => Loop_l_f1d_col_proc2_U0_xk_mid_col_fifo_V_write,
        arr0_address0 => Loop_l_f1d_col_proc2_U0_arr0_address0,
        arr0_ce0 => Loop_l_f1d_col_proc2_U0_arr0_ce0,
        arr0_q0 => arr0_t_q0);

    Loop_l_transp_out_pr_U0 : component Loop_l_transp_out_pr
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_transp_out_pr_U0_ap_start,
        ap_done => Loop_l_transp_out_pr_U0_ap_done,
        ap_continue => Loop_l_transp_out_pr_U0_ap_continue,
        ap_idle => Loop_l_transp_out_pr_U0_ap_idle,
        ap_ready => Loop_l_transp_out_pr_U0_ap_ready,
        xk_mid_col_fifo_V_dout => xk_mid_col_fifo_V_dout,
        xk_mid_col_fifo_V_empty_n => xk_mid_col_fifo_V_empty_n,
        xk_mid_col_fifo_V_read => Loop_l_transp_out_pr_U0_xk_mid_col_fifo_V_read,
        arr1_address1 => Loop_l_transp_out_pr_U0_arr1_address1,
        arr1_ce1 => Loop_l_transp_out_pr_U0_arr1_ce1,
        arr1_we1 => Loop_l_transp_out_pr_U0_arr1_we1,
        arr1_d1 => Loop_l_transp_out_pr_U0_arr1_d1);

    Loop_l_wr_o_fifo_pro_U0 : component Loop_l_wr_o_fifo_pro
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_wr_o_fifo_pro_U0_ap_start,
        start_full_n => start_for_Loop_l_wr_xk_proc29_U0_full_n,
        ap_done => Loop_l_wr_o_fifo_pro_U0_ap_done,
        ap_continue => Loop_l_wr_o_fifo_pro_U0_ap_continue,
        ap_idle => Loop_l_wr_o_fifo_pro_U0_ap_idle,
        ap_ready => Loop_l_wr_o_fifo_pro_U0_ap_ready,
        start_out => Loop_l_wr_o_fifo_pro_U0_start_out,
        start_write => Loop_l_wr_o_fifo_pro_U0_start_write,
        arr1_address0 => Loop_l_wr_o_fifo_pro_U0_arr1_address0,
        arr1_ce0 => Loop_l_wr_o_fifo_pro_U0_arr1_ce0,
        arr1_q0 => arr1_t_q0,
        xk_fifo_V_din => Loop_l_wr_o_fifo_pro_U0_xk_fifo_V_din,
        xk_fifo_V_full_n => xk_fifo_V_full_n,
        xk_fifo_V_write => Loop_l_wr_o_fifo_pro_U0_xk_fifo_V_write);

    Loop_l_wr_xk_proc29_U0 : component Loop_l_wr_xk_proc29
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Loop_l_wr_xk_proc29_U0_ap_start,
        ap_done => Loop_l_wr_xk_proc29_U0_ap_done,
        ap_continue => Loop_l_wr_xk_proc29_U0_ap_continue,
        ap_idle => Loop_l_wr_xk_proc29_U0_ap_idle,
        ap_ready => Loop_l_wr_xk_proc29_U0_ap_ready,
        xk_fifo_V_dout => xk_fifo_V_dout,
        xk_fifo_V_empty_n => xk_fifo_V_empty_n,
        xk_fifo_V_read => Loop_l_wr_xk_proc29_U0_xk_fifo_V_read,
        xk_TDATA => Loop_l_wr_xk_proc29_U0_xk_TDATA,
        xk_TVALID => Loop_l_wr_xk_proc29_U0_xk_TVALID,
        xk_TREADY => xk_TREADY,
        xk_TLAST => Loop_l_wr_xk_proc29_U0_xk_TLAST);

    xn_fifo_V_U : component fifo_w64_d32_A_x2
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Loop_l_rd_xn_proc23_U0_xn_fifo_V_din,
        if_full_n => xn_fifo_V_full_n,
        if_write => Loop_l_rd_xn_proc23_U0_xn_fifo_V_write,
        if_dout => xn_fifo_V_dout,
        if_empty_n => xn_fifo_V_empty_n,
        if_read => Loop_l_f1d_row_proc2_U0_xn_fifo_V_read);

    xk_mid_row_fifo_V_U : component fifo_w64_d32_A_x2
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Loop_l_f1d_row_proc2_U0_xk_mid_row_fifo_V_din,
        if_full_n => xk_mid_row_fifo_V_full_n,
        if_write => Loop_l_f1d_row_proc2_U0_xk_mid_row_fifo_V_write,
        if_dout => xk_mid_row_fifo_V_dout,
        if_empty_n => xk_mid_row_fifo_V_empty_n,
        if_read => Loop_l_transp_mid_pr_U0_xk_mid_row_fifo_V_read);

    xk_mid_col_fifo_V_U : component fifo_w64_d32_A_x2
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Loop_l_f1d_col_proc2_U0_xk_mid_col_fifo_V_din,
        if_full_n => xk_mid_col_fifo_V_full_n,
        if_write => Loop_l_f1d_col_proc2_U0_xk_mid_col_fifo_V_write,
        if_dout => xk_mid_col_fifo_V_dout,
        if_empty_n => xk_mid_col_fifo_V_empty_n,
        if_read => Loop_l_transp_out_pr_U0_xk_mid_col_fifo_V_read);

    xk_fifo_V_U : component fifo_w64_d32_A_x2
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Loop_l_wr_o_fifo_pro_U0_xk_fifo_V_din,
        if_full_n => xk_fifo_V_full_n,
        if_write => Loop_l_wr_o_fifo_pro_U0_xk_fifo_V_write,
        if_dout => xk_fifo_V_dout,
        if_empty_n => xk_fifo_V_empty_n,
        if_read => Loop_l_wr_xk_proc29_U0_xk_fifo_V_read);

    start_for_Loop_l_f1d_row_proc2_U0_U : component start_for_Loop_l_f1d_row_proc2_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_Loop_l_f1d_row_proc2_U0_din,
        if_full_n => start_for_Loop_l_f1d_row_proc2_U0_full_n,
        if_write => Loop_l_rd_xn_proc23_U0_start_write,
        if_dout => start_for_Loop_l_f1d_row_proc2_U0_dout,
        if_empty_n => start_for_Loop_l_f1d_row_proc2_U0_empty_n,
        if_read => Loop_l_f1d_row_proc2_U0_ap_ready);

    start_for_Loop_l_transp_mid_pr_U0_U : component start_for_Loop_l_transp_mid_pr_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_Loop_l_transp_mid_pr_U0_din,
        if_full_n => start_for_Loop_l_transp_mid_pr_U0_full_n,
        if_write => Loop_l_f1d_row_proc2_U0_start_write,
        if_dout => start_for_Loop_l_transp_mid_pr_U0_dout,
        if_empty_n => start_for_Loop_l_transp_mid_pr_U0_empty_n,
        if_read => Loop_l_transp_mid_pr_U0_ap_ready);

    start_for_Loop_l_transp_out_pr_U0_U : component start_for_Loop_l_transp_out_pr_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_Loop_l_transp_out_pr_U0_din,
        if_full_n => start_for_Loop_l_transp_out_pr_U0_full_n,
        if_write => Loop_l_f1d_col_proc2_U0_start_write,
        if_dout => start_for_Loop_l_transp_out_pr_U0_dout,
        if_empty_n => start_for_Loop_l_transp_out_pr_U0_empty_n,
        if_read => Loop_l_transp_out_pr_U0_ap_ready);

    start_for_Loop_l_wr_xk_proc29_U0_U : component start_for_Loop_l_wr_xk_proc29_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_Loop_l_wr_xk_proc29_U0_din,
        if_full_n => start_for_Loop_l_wr_xk_proc29_U0_full_n,
        if_write => Loop_l_wr_o_fifo_pro_U0_start_write,
        if_dout => start_for_Loop_l_wr_xk_proc29_U0_dout,
        if_empty_n => start_for_Loop_l_wr_xk_proc29_U0_empty_n,
        if_read => Loop_l_wr_xk_proc29_U0_ap_ready);




    Loop_l_f1d_col_proc2_U0_ap_continue <= ap_const_logic_1;
    Loop_l_f1d_col_proc2_U0_ap_start <= arr0_t_empty_n;
    Loop_l_f1d_row_proc2_U0_ap_continue <= ap_const_logic_1;
    Loop_l_f1d_row_proc2_U0_ap_start <= start_for_Loop_l_f1d_row_proc2_U0_empty_n;
    Loop_l_rd_xn_proc23_U0_ap_continue <= ap_const_logic_1;
    Loop_l_rd_xn_proc23_U0_ap_start <= ap_const_logic_1;
    Loop_l_rd_xn_proc23_U0_xn_TLAST <= (0=>xn_TLAST, others=>'-');
    Loop_l_transp_mid_pr_U0_ap_continue <= arr0_i_full_n;
    Loop_l_transp_mid_pr_U0_ap_start <= start_for_Loop_l_transp_mid_pr_U0_empty_n;
    Loop_l_transp_mid_pr_U0_arr0_full_n <= arr0_i_full_n;
    Loop_l_transp_mid_pr_U0_start_full_n <= ap_const_logic_1;
    Loop_l_transp_mid_pr_U0_start_write <= ap_const_logic_0;
    Loop_l_transp_out_pr_U0_ap_continue <= arr1_i_full_n;
    Loop_l_transp_out_pr_U0_ap_start <= start_for_Loop_l_transp_out_pr_U0_empty_n;
    Loop_l_transp_out_pr_U0_arr1_full_n <= arr1_i_full_n;
    Loop_l_transp_out_pr_U0_start_full_n <= ap_const_logic_1;
    Loop_l_transp_out_pr_U0_start_write <= ap_const_logic_0;
    Loop_l_wr_o_fifo_pro_U0_ap_continue <= ap_const_logic_1;
    Loop_l_wr_o_fifo_pro_U0_ap_start <= arr1_t_empty_n;
    Loop_l_wr_xk_proc29_U0_ap_continue <= ap_const_logic_1;
    Loop_l_wr_xk_proc29_U0_ap_start <= start_for_Loop_l_wr_xk_proc29_U0_empty_n;
    Loop_l_wr_xk_proc29_U0_start_full_n <= ap_const_logic_1;
    Loop_l_wr_xk_proc29_U0_start_write <= ap_const_logic_0;
    ap_channel_done_arr0 <= Loop_l_transp_mid_pr_U0_ap_done;
    ap_channel_done_arr1 <= Loop_l_transp_out_pr_U0_ap_done;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    ap_sync_continue <= ap_const_logic_0;
    arr0_t_d0 <= ap_const_lv64_0;
    arr0_t_we0 <= ap_const_logic_0;
    arr1_t_d0 <= ap_const_lv64_0;
    arr1_t_we0 <= ap_const_logic_0;
    start_for_Loop_l_f1d_row_proc2_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_Loop_l_transp_mid_pr_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_Loop_l_transp_out_pr_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_Loop_l_wr_xk_proc29_U0_din <= (0=>ap_const_logic_1, others=>'-');
    xk_TDATA <= Loop_l_wr_xk_proc29_U0_xk_TDATA;
    xk_TLAST <= Loop_l_wr_xk_proc29_U0_xk_TLAST(0);
    xk_TVALID <= Loop_l_wr_xk_proc29_U0_xk_TVALID;
    xn_TREADY <= Loop_l_rd_xn_proc23_U0_xn_TREADY;
end behav;