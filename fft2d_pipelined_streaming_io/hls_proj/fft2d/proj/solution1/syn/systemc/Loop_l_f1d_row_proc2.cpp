// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "Loop_l_f1d_row_proc2.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic Loop_l_f1d_row_proc2::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic Loop_l_f1d_row_proc2::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<4> Loop_l_f1d_row_proc2::ap_ST_fsm_state1 = "1";
const sc_lv<4> Loop_l_f1d_row_proc2::ap_ST_fsm_state2 = "10";
const sc_lv<4> Loop_l_f1d_row_proc2::ap_ST_fsm_state3 = "100";
const sc_lv<4> Loop_l_f1d_row_proc2::ap_ST_fsm_state4 = "1000";
const sc_lv<32> Loop_l_f1d_row_proc2::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> Loop_l_f1d_row_proc2::ap_const_lv32_2 = "10";
const sc_lv<1> Loop_l_f1d_row_proc2::ap_const_lv1_0 = "0";
const sc_lv<32> Loop_l_f1d_row_proc2::ap_const_lv32_1 = "1";
const sc_lv<32> Loop_l_f1d_row_proc2::ap_const_lv32_3 = "11";
const bool Loop_l_f1d_row_proc2::ap_const_boolean_0 = false;
const sc_lv<6> Loop_l_f1d_row_proc2::ap_const_lv6_0 = "000000";
const sc_lv<1> Loop_l_f1d_row_proc2::ap_const_lv1_1 = "1";
const sc_lv<6> Loop_l_f1d_row_proc2::ap_const_lv6_20 = "100000";
const sc_lv<6> Loop_l_f1d_row_proc2::ap_const_lv6_1 = "1";
const bool Loop_l_f1d_row_proc2::ap_const_boolean_1 = true;

Loop_l_f1d_row_proc2::Loop_l_f1d_row_proc2(sc_module_name name) : sc_module(name), mVcdFile(0) {
    grp_fft1d_1_fu_125 = new fft1d_1("grp_fft1d_1_fu_125");
    grp_fft1d_1_fu_125->in_V_dout(xn_mid_row_fifo_V_dout);
    grp_fft1d_1_fu_125->in_V_empty_n(xn_mid_row_fifo_V_empty_n);
    grp_fft1d_1_fu_125->in_V_read(grp_fft1d_1_fu_125_in_V_read);
    grp_fft1d_1_fu_125->out_V_din(grp_fft1d_1_fu_125_out_V_din);
    grp_fft1d_1_fu_125->out_V_full_n(xk_mid_row_fifo_V_full_n);
    grp_fft1d_1_fu_125->out_V_write(grp_fft1d_1_fu_125_out_V_write);
    grp_fft1d_1_fu_125->ap_clk(ap_clk);
    grp_fft1d_1_fu_125->ap_rst(ap_rst);
    grp_fft1d_1_fu_125->ap_start(grp_fft1d_1_fu_125_ap_start);
    grp_fft1d_1_fu_125->ap_done(grp_fft1d_1_fu_125_ap_done);
    grp_fft1d_1_fu_125->ap_ready(grp_fft1d_1_fu_125_ap_ready);
    grp_fft1d_1_fu_125->ap_idle(grp_fft1d_1_fu_125_ap_idle);
    grp_fft1d_1_fu_125->ap_continue(grp_fft1d_1_fu_125_ap_continue);
    xn_mid_row_fifo_V_fifo_U = new fifo_w64_d32_A_x("xn_mid_row_fifo_V_fifo_U");
    xn_mid_row_fifo_V_fifo_U->clk(ap_clk);
    xn_mid_row_fifo_V_fifo_U->reset(ap_rst);
    xn_mid_row_fifo_V_fifo_U->if_read_ce(ap_var_for_const0);
    xn_mid_row_fifo_V_fifo_U->if_write_ce(ap_var_for_const0);
    xn_mid_row_fifo_V_fifo_U->if_din(xn_fifo_V_dout);
    xn_mid_row_fifo_V_fifo_U->if_full_n(xn_mid_row_fifo_V_full_n);
    xn_mid_row_fifo_V_fifo_U->if_write(xn_mid_row_fifo_V_write);
    xn_mid_row_fifo_V_fifo_U->if_dout(xn_mid_row_fifo_V_dout);
    xn_mid_row_fifo_V_fifo_U->if_empty_n(xn_mid_row_fifo_V_empty_n);
    xn_mid_row_fifo_V_fifo_U->if_read(xn_mid_row_fifo_V_read);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state3);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state4);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_block_state1);
    sensitive << ( real_start );
    sensitive << ( ap_done_reg );

    SC_METHOD(thread_ap_block_state3);
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( icmp_ln130_fu_144_p2 );
    sensitive << ( xn_mid_row_fifo_V_full_n );

    SC_METHOD(thread_ap_block_state3_ignore_call0);
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( icmp_ln130_fu_144_p2 );
    sensitive << ( xn_mid_row_fifo_V_full_n );

    SC_METHOD(thread_ap_block_state4_on_subcall_done);
    sensitive << ( ap_sync_grp_fft1d_1_fu_125_ap_ready );
    sensitive << ( ap_sync_grp_fft1d_1_fu_125_ap_done );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln128_fu_132_p2 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( real_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( internal_ap_ready );

    SC_METHOD(thread_ap_sync_grp_fft1d_1_fu_125_ap_done);
    sensitive << ( grp_fft1d_1_fu_125_ap_done );
    sensitive << ( ap_sync_reg_grp_fft1d_1_fu_125_ap_done );

    SC_METHOD(thread_ap_sync_grp_fft1d_1_fu_125_ap_ready);
    sensitive << ( grp_fft1d_1_fu_125_ap_ready );
    sensitive << ( ap_sync_reg_grp_fft1d_1_fu_125_ap_ready );

    SC_METHOD(thread_grp_fft1d_1_fu_125_ap_continue);
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( ap_block_state4_on_subcall_done );

    SC_METHOD(thread_grp_fft1d_1_fu_125_ap_start);
    sensitive << ( grp_fft1d_1_fu_125_ap_start_reg );

    SC_METHOD(thread_i_fu_138_p2);
    sensitive << ( i1_0_reg_103 );

    SC_METHOD(thread_icmp_ln128_fu_132_p2);
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( i1_0_reg_103 );

    SC_METHOD(thread_icmp_ln130_fu_144_p2);
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln130_fu_144_p2 );
    sensitive << ( xn_mid_row_fifo_V_full_n );
    sensitive << ( j_0_reg_114 );

    SC_METHOD(thread_internal_ap_ready);
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln128_fu_132_p2 );

    SC_METHOD(thread_j_fu_150_p2);
    sensitive << ( j_0_reg_114 );

    SC_METHOD(thread_real_start);
    sensitive << ( ap_start );
    sensitive << ( start_full_n );
    sensitive << ( start_once_reg );

    SC_METHOD(thread_start_out);
    sensitive << ( real_start );

    SC_METHOD(thread_start_write);
    sensitive << ( real_start );
    sensitive << ( start_once_reg );

    SC_METHOD(thread_xk_mid_row_fifo_V_din);
    sensitive << ( grp_fft1d_1_fu_125_out_V_din );
    sensitive << ( ap_CS_fsm_state4 );

    SC_METHOD(thread_xk_mid_row_fifo_V_write);
    sensitive << ( grp_fft1d_1_fu_125_out_V_write );
    sensitive << ( ap_CS_fsm_state4 );

    SC_METHOD(thread_xn_fifo_V_blk_n);
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln130_fu_144_p2 );

    SC_METHOD(thread_xn_fifo_V_read);
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln130_fu_144_p2 );
    sensitive << ( xn_mid_row_fifo_V_full_n );

    SC_METHOD(thread_xn_mid_row_fifo_V_read);
    sensitive << ( grp_fft1d_1_fu_125_in_V_read );
    sensitive << ( ap_CS_fsm_state4 );

    SC_METHOD(thread_xn_mid_row_fifo_V_write);
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln130_fu_144_p2 );
    sensitive << ( xn_mid_row_fifo_V_full_n );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( real_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( xn_fifo_V_empty_n );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln130_fu_144_p2 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( xn_mid_row_fifo_V_full_n );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( ap_block_state4_on_subcall_done );
    sensitive << ( icmp_ln128_fu_132_p2 );

    SC_THREAD(thread_ap_var_for_const0);

    start_once_reg = SC_LOGIC_0;
    ap_done_reg = SC_LOGIC_0;
    ap_CS_fsm = "0001";
    grp_fft1d_1_fu_125_ap_start_reg = SC_LOGIC_0;
    ap_sync_reg_grp_fft1d_1_fu_125_ap_ready = SC_LOGIC_0;
    ap_sync_reg_grp_fft1d_1_fu_125_ap_done = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "Loop_l_f1d_row_proc2_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, start_full_n, "(port)start_full_n");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_continue, "(port)ap_continue");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, start_out, "(port)start_out");
    sc_trace(mVcdFile, start_write, "(port)start_write");
    sc_trace(mVcdFile, xk_mid_row_fifo_V_din, "(port)xk_mid_row_fifo_V_din");
    sc_trace(mVcdFile, xk_mid_row_fifo_V_full_n, "(port)xk_mid_row_fifo_V_full_n");
    sc_trace(mVcdFile, xk_mid_row_fifo_V_write, "(port)xk_mid_row_fifo_V_write");
    sc_trace(mVcdFile, xn_fifo_V_dout, "(port)xn_fifo_V_dout");
    sc_trace(mVcdFile, xn_fifo_V_empty_n, "(port)xn_fifo_V_empty_n");
    sc_trace(mVcdFile, xn_fifo_V_read, "(port)xn_fifo_V_read");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, real_start, "real_start");
    sc_trace(mVcdFile, start_once_reg, "start_once_reg");
    sc_trace(mVcdFile, ap_done_reg, "ap_done_reg");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, internal_ap_ready, "internal_ap_ready");
    sc_trace(mVcdFile, xn_fifo_V_blk_n, "xn_fifo_V_blk_n");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, icmp_ln130_fu_144_p2, "icmp_ln130_fu_144_p2");
    sc_trace(mVcdFile, i_fu_138_p2, "i_fu_138_p2");
    sc_trace(mVcdFile, i_reg_165, "i_reg_165");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, j_fu_150_p2, "j_fu_150_p2");
    sc_trace(mVcdFile, xn_mid_row_fifo_V_full_n, "xn_mid_row_fifo_V_full_n");
    sc_trace(mVcdFile, xn_mid_row_fifo_V_write, "xn_mid_row_fifo_V_write");
    sc_trace(mVcdFile, ap_block_state3, "ap_block_state3");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_in_V_read, "grp_fft1d_1_fu_125_in_V_read");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_out_V_din, "grp_fft1d_1_fu_125_out_V_din");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_out_V_write, "grp_fft1d_1_fu_125_out_V_write");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_ap_start, "grp_fft1d_1_fu_125_ap_start");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_ap_done, "grp_fft1d_1_fu_125_ap_done");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_ap_ready, "grp_fft1d_1_fu_125_ap_ready");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_ap_idle, "grp_fft1d_1_fu_125_ap_idle");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_ap_continue, "grp_fft1d_1_fu_125_ap_continue");
    sc_trace(mVcdFile, i1_0_reg_103, "i1_0_reg_103");
    sc_trace(mVcdFile, ap_CS_fsm_state4, "ap_CS_fsm_state4");
    sc_trace(mVcdFile, ap_sync_grp_fft1d_1_fu_125_ap_ready, "ap_sync_grp_fft1d_1_fu_125_ap_ready");
    sc_trace(mVcdFile, ap_sync_grp_fft1d_1_fu_125_ap_done, "ap_sync_grp_fft1d_1_fu_125_ap_done");
    sc_trace(mVcdFile, ap_block_state4_on_subcall_done, "ap_block_state4_on_subcall_done");
    sc_trace(mVcdFile, ap_block_state1, "ap_block_state1");
    sc_trace(mVcdFile, j_0_reg_114, "j_0_reg_114");
    sc_trace(mVcdFile, icmp_ln128_fu_132_p2, "icmp_ln128_fu_132_p2");
    sc_trace(mVcdFile, grp_fft1d_1_fu_125_ap_start_reg, "grp_fft1d_1_fu_125_ap_start_reg");
    sc_trace(mVcdFile, ap_block_state3_ignore_call0, "ap_block_state3_ignore_call0");
    sc_trace(mVcdFile, ap_sync_reg_grp_fft1d_1_fu_125_ap_ready, "ap_sync_reg_grp_fft1d_1_fu_125_ap_ready");
    sc_trace(mVcdFile, ap_sync_reg_grp_fft1d_1_fu_125_ap_done, "ap_sync_reg_grp_fft1d_1_fu_125_ap_done");
    sc_trace(mVcdFile, xn_mid_row_fifo_V_dout, "xn_mid_row_fifo_V_dout");
    sc_trace(mVcdFile, xn_mid_row_fifo_V_empty_n, "xn_mid_row_fifo_V_empty_n");
    sc_trace(mVcdFile, xn_mid_row_fifo_V_read, "xn_mid_row_fifo_V_read");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

Loop_l_f1d_row_proc2::~Loop_l_f1d_row_proc2() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete grp_fft1d_1_fu_125;
    delete xn_mid_row_fifo_V_fifo_U;
}

void Loop_l_f1d_row_proc2::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void Loop_l_f1d_row_proc2::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_done_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_continue.read())) {
            ap_done_reg = ap_const_logic_0;
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                    esl_seteq<1,1,1>(icmp_ln128_fu_132_p2.read(), ap_const_lv1_1))) {
            ap_done_reg = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_grp_fft1d_1_fu_125_ap_done = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
             esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
            ap_sync_reg_grp_fft1d_1_fu_125_ap_done = ap_const_logic_0;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_fft1d_1_fu_125_ap_done.read())) {
            ap_sync_reg_grp_fft1d_1_fu_125_ap_done = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_grp_fft1d_1_fu_125_ap_ready = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
             esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
            ap_sync_reg_grp_fft1d_1_fu_125_ap_ready = ap_const_logic_0;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_fft1d_1_fu_125_ap_ready.read())) {
            ap_sync_reg_grp_fft1d_1_fu_125_ap_ready = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_fft1d_1_fu_125_ap_start_reg = ap_const_logic_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              !((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read()))) && 
              esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
              esl_seteq<1,1,1>(ap_const_logic_0, ap_sync_grp_fft1d_1_fu_125_ap_ready.read())))) {
            grp_fft1d_1_fu_125_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_fft1d_1_fu_125_ap_ready.read())) {
            grp_fft1d_1_fu_125_ap_start_reg = ap_const_logic_0;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
        i1_0_reg_103 = ap_const_lv6_0;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
                esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
        i1_0_reg_103 = i_reg_165.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
         !((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read()))))) {
        j_0_reg_114 = j_fu_150_p2.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, icmp_ln128_fu_132_p2.read()))) {
        j_0_reg_114 = ap_const_lv6_0;
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        start_once_reg = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, real_start.read()) && 
             esl_seteq<1,1,1>(ap_const_logic_0, internal_ap_ready.read()))) {
            start_once_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, internal_ap_ready.read())) {
            start_once_reg = ap_const_logic_0;
        }
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        i_reg_165 = i_fu_138_p2.read();
    }
}

void Loop_l_f1d_row_proc2::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void Loop_l_f1d_row_proc2::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void Loop_l_f1d_row_proc2::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void Loop_l_f1d_row_proc2::thread_ap_CS_fsm_state4() {
    ap_CS_fsm_state4 = ap_CS_fsm.read()[3];
}

void Loop_l_f1d_row_proc2::thread_ap_block_state1() {
    ap_block_state1 = (esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1));
}

void Loop_l_f1d_row_proc2::thread_ap_block_state3() {
    ap_block_state3 = ((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read())));
}

void Loop_l_f1d_row_proc2::thread_ap_block_state3_ignore_call0() {
    ap_block_state3_ignore_call0 = ((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read())));
}

void Loop_l_f1d_row_proc2::thread_ap_block_state4_on_subcall_done() {
    ap_block_state4_on_subcall_done = esl_seteq<1,1,1>(ap_const_logic_0, (ap_sync_grp_fft1d_1_fu_125_ap_ready.read() & ap_sync_grp_fft1d_1_fu_125_ap_done.read()));
}

void Loop_l_f1d_row_proc2::thread_ap_done() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(icmp_ln128_fu_132_p2.read(), ap_const_lv1_1))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_done_reg.read();
    }
}

void Loop_l_f1d_row_proc2::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_ap_ready() {
    ap_ready = internal_ap_ready.read();
}

void Loop_l_f1d_row_proc2::thread_ap_sync_grp_fft1d_1_fu_125_ap_done() {
    ap_sync_grp_fft1d_1_fu_125_ap_done = (grp_fft1d_1_fu_125_ap_done.read() | ap_sync_reg_grp_fft1d_1_fu_125_ap_done.read());
}

void Loop_l_f1d_row_proc2::thread_ap_sync_grp_fft1d_1_fu_125_ap_ready() {
    ap_sync_grp_fft1d_1_fu_125_ap_ready = (grp_fft1d_1_fu_125_ap_ready.read() | ap_sync_reg_grp_fft1d_1_fu_125_ap_ready.read());
}

void Loop_l_f1d_row_proc2::thread_grp_fft1d_1_fu_125_ap_continue() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && 
         esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
        grp_fft1d_1_fu_125_ap_continue = ap_const_logic_1;
    } else {
        grp_fft1d_1_fu_125_ap_continue = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_grp_fft1d_1_fu_125_ap_start() {
    grp_fft1d_1_fu_125_ap_start = grp_fft1d_1_fu_125_ap_start_reg.read();
}

void Loop_l_f1d_row_proc2::thread_i_fu_138_p2() {
    i_fu_138_p2 = (!i1_0_reg_103.read().is_01() || !ap_const_lv6_1.is_01())? sc_lv<6>(): (sc_biguint<6>(i1_0_reg_103.read()) + sc_biguint<6>(ap_const_lv6_1));
}

void Loop_l_f1d_row_proc2::thread_icmp_ln128_fu_132_p2() {
    icmp_ln128_fu_132_p2 = (!i1_0_reg_103.read().is_01() || !ap_const_lv6_20.is_01())? sc_lv<1>(): sc_lv<1>(i1_0_reg_103.read() == ap_const_lv6_20);
}

void Loop_l_f1d_row_proc2::thread_icmp_ln130_fu_144_p2() {
    icmp_ln130_fu_144_p2 = (!j_0_reg_114.read().is_01() || !ap_const_lv6_20.is_01())? sc_lv<1>(): sc_lv<1>(j_0_reg_114.read() == ap_const_lv6_20);
}

void Loop_l_f1d_row_proc2::thread_internal_ap_ready() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(icmp_ln128_fu_132_p2.read(), ap_const_lv1_1))) {
        internal_ap_ready = ap_const_logic_1;
    } else {
        internal_ap_ready = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_j_fu_150_p2() {
    j_fu_150_p2 = (!j_0_reg_114.read().is_01() || !ap_const_lv6_1.is_01())? sc_lv<6>(): (sc_biguint<6>(j_0_reg_114.read()) + sc_biguint<6>(ap_const_lv6_1));
}

void Loop_l_f1d_row_proc2::thread_real_start() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, start_full_n.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, start_once_reg.read()))) {
        real_start = ap_const_logic_0;
    } else {
        real_start = ap_start.read();
    }
}

void Loop_l_f1d_row_proc2::thread_start_out() {
    start_out = real_start.read();
}

void Loop_l_f1d_row_proc2::thread_start_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, start_once_reg.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, real_start.read()))) {
        start_write = ap_const_logic_1;
    } else {
        start_write = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_xk_mid_row_fifo_V_din() {
    xk_mid_row_fifo_V_din = grp_fft1d_1_fu_125_out_V_din.read();
}

void Loop_l_f1d_row_proc2::thread_xk_mid_row_fifo_V_write() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        xk_mid_row_fifo_V_write = grp_fft1d_1_fu_125_out_V_write.read();
    } else {
        xk_mid_row_fifo_V_write = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_xn_fifo_V_blk_n() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0))) {
        xn_fifo_V_blk_n = xn_fifo_V_empty_n.read();
    } else {
        xn_fifo_V_blk_n = ap_const_logic_1;
    }
}

void Loop_l_f1d_row_proc2::thread_xn_fifo_V_read() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
         !((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read()))))) {
        xn_fifo_V_read = ap_const_logic_1;
    } else {
        xn_fifo_V_read = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_xn_mid_row_fifo_V_read() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        xn_mid_row_fifo_V_read = grp_fft1d_1_fu_125_in_V_read.read();
    } else {
        xn_mid_row_fifo_V_read = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_xn_mid_row_fifo_V_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
         !((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read()))))) {
        xn_mid_row_fifo_V_write = ap_const_logic_1;
    } else {
        xn_mid_row_fifo_V_write = ap_const_logic_0;
    }
}

void Loop_l_f1d_row_proc2::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(icmp_ln128_fu_132_p2.read(), ap_const_lv1_1))) {
                ap_NS_fsm = ap_ST_fsm_state1;
            } else {
                ap_NS_fsm = ap_ST_fsm_state3;
            }
            break;
        case 4 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && !((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read()))))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && !((esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_fifo_V_empty_n.read())) || (esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_0, xn_mid_row_fifo_V_full_n.read()))) && esl_seteq<1,1,1>(icmp_ln130_fu_144_p2.read(), ap_const_lv1_1))) {
                ap_NS_fsm = ap_ST_fsm_state4;
            } else {
                ap_NS_fsm = ap_ST_fsm_state3;
            }
            break;
        case 8 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()) && esl_seteq<1,1,1>(ap_block_state4_on_subcall_done.read(), ap_const_boolean_0))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state4;
            }
            break;
        default : 
            ap_NS_fsm = "XXXX";
            break;
    }
}

}
