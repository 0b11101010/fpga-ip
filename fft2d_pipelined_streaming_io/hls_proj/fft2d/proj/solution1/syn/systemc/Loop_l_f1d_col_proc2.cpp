// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "Loop_l_f1d_col_proc2.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic Loop_l_f1d_col_proc2::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic Loop_l_f1d_col_proc2::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<6> Loop_l_f1d_col_proc2::ap_ST_fsm_state1 = "1";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_ST_fsm_state2 = "10";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_ST_fsm_state3 = "100";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_ST_fsm_state4 = "1000";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_ST_fsm_state5 = "10000";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_ST_fsm_state6 = "100000";
const sc_lv<32> Loop_l_f1d_col_proc2::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> Loop_l_f1d_col_proc2::ap_const_lv32_1 = "1";
const sc_lv<1> Loop_l_f1d_col_proc2::ap_const_lv1_0 = "0";
const sc_lv<32> Loop_l_f1d_col_proc2::ap_const_lv32_2 = "10";
const sc_lv<32> Loop_l_f1d_col_proc2::ap_const_lv32_3 = "11";
const sc_lv<32> Loop_l_f1d_col_proc2::ap_const_lv32_5 = "101";
const bool Loop_l_f1d_col_proc2::ap_const_boolean_0 = false;
const sc_lv<6> Loop_l_f1d_col_proc2::ap_const_lv6_0 = "000000";
const sc_lv<32> Loop_l_f1d_col_proc2::ap_const_lv32_4 = "100";
const sc_lv<1> Loop_l_f1d_col_proc2::ap_const_lv1_1 = "1";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_const_lv6_20 = "100000";
const sc_lv<6> Loop_l_f1d_col_proc2::ap_const_lv6_1 = "1";
const sc_lv<5> Loop_l_f1d_col_proc2::ap_const_lv5_0 = "00000";
const bool Loop_l_f1d_col_proc2::ap_const_boolean_1 = true;

Loop_l_f1d_col_proc2::Loop_l_f1d_col_proc2(sc_module_name name) : sc_module(name), mVcdFile(0) {
    grp_fft1d_0_fu_131 = new fft1d_0("grp_fft1d_0_fu_131");
    grp_fft1d_0_fu_131->in_V_dout(xn_mid_col_fifo_V_dout);
    grp_fft1d_0_fu_131->in_V_empty_n(xn_mid_col_fifo_V_empty_n);
    grp_fft1d_0_fu_131->in_V_read(grp_fft1d_0_fu_131_in_V_read);
    grp_fft1d_0_fu_131->out_V_din(grp_fft1d_0_fu_131_out_V_din);
    grp_fft1d_0_fu_131->out_V_full_n(xk_mid_col_fifo_V_full_n);
    grp_fft1d_0_fu_131->out_V_write(grp_fft1d_0_fu_131_out_V_write);
    grp_fft1d_0_fu_131->ap_clk(ap_clk);
    grp_fft1d_0_fu_131->ap_rst(ap_rst);
    grp_fft1d_0_fu_131->ap_start(grp_fft1d_0_fu_131_ap_start);
    grp_fft1d_0_fu_131->ap_done(grp_fft1d_0_fu_131_ap_done);
    grp_fft1d_0_fu_131->ap_ready(grp_fft1d_0_fu_131_ap_ready);
    grp_fft1d_0_fu_131->ap_idle(grp_fft1d_0_fu_131_ap_idle);
    grp_fft1d_0_fu_131->ap_continue(grp_fft1d_0_fu_131_ap_continue);
    xn_mid_col_fifo_V_fifo_U = new fifo_w64_d32_A_x1("xn_mid_col_fifo_V_fifo_U");
    xn_mid_col_fifo_V_fifo_U->clk(ap_clk);
    xn_mid_col_fifo_V_fifo_U->reset(ap_rst);
    xn_mid_col_fifo_V_fifo_U->if_read_ce(ap_var_for_const0);
    xn_mid_col_fifo_V_fifo_U->if_write_ce(ap_var_for_const0);
    xn_mid_col_fifo_V_fifo_U->if_din(tmp_4_reg_220);
    xn_mid_col_fifo_V_fifo_U->if_full_n(xn_mid_col_fifo_V_full_n);
    xn_mid_col_fifo_V_fifo_U->if_write(xn_mid_col_fifo_V_write);
    xn_mid_col_fifo_V_fifo_U->if_dout(xn_mid_col_fifo_V_dout);
    xn_mid_col_fifo_V_fifo_U->if_empty_n(xn_mid_col_fifo_V_empty_n);
    xn_mid_col_fifo_V_fifo_U->if_read(xn_mid_col_fifo_V_read);

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

    SC_METHOD(thread_ap_CS_fsm_state5);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state6);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_block_state1);
    sensitive << ( real_start );
    sensitive << ( ap_done_reg );

    SC_METHOD(thread_ap_block_state6_on_subcall_done);
    sensitive << ( ap_sync_grp_fft1d_0_fu_131_ap_ready );
    sensitive << ( ap_sync_grp_fft1d_0_fu_131_ap_done );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln155_fu_138_p2 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( real_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( internal_ap_ready );

    SC_METHOD(thread_ap_sync_grp_fft1d_0_fu_131_ap_done);
    sensitive << ( grp_fft1d_0_fu_131_ap_done );
    sensitive << ( ap_sync_reg_grp_fft1d_0_fu_131_ap_done );

    SC_METHOD(thread_ap_sync_grp_fft1d_0_fu_131_ap_ready);
    sensitive << ( grp_fft1d_0_fu_131_ap_ready );
    sensitive << ( ap_sync_reg_grp_fft1d_0_fu_131_ap_ready );

    SC_METHOD(thread_arr0_address0);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( zext_ln160_fu_183_p1 );

    SC_METHOD(thread_arr0_ce0);
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_grp_fft1d_0_fu_131_ap_continue);
    sensitive << ( ap_CS_fsm_state6 );
    sensitive << ( ap_block_state6_on_subcall_done );

    SC_METHOD(thread_grp_fft1d_0_fu_131_ap_start);
    sensitive << ( grp_fft1d_0_fu_131_ap_start_reg );

    SC_METHOD(thread_i_fu_144_p2);
    sensitive << ( i4_0_reg_109 );

    SC_METHOD(thread_icmp_ln155_fu_138_p2);
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( i4_0_reg_109 );

    SC_METHOD(thread_icmp_ln157_fu_162_p2);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( j5_0_reg_120 );

    SC_METHOD(thread_index_fu_178_p2);
    sensitive << ( shl_ln_reg_202 );
    sensitive << ( zext_ln159_fu_174_p1 );

    SC_METHOD(thread_internal_ap_ready);
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln155_fu_138_p2 );

    SC_METHOD(thread_j_fu_168_p2);
    sensitive << ( j5_0_reg_120 );

    SC_METHOD(thread_real_start);
    sensitive << ( ap_start );
    sensitive << ( start_full_n );
    sensitive << ( start_once_reg );

    SC_METHOD(thread_shl_ln_fu_154_p3);
    sensitive << ( trunc_ln159_fu_150_p1 );

    SC_METHOD(thread_start_out);
    sensitive << ( real_start );

    SC_METHOD(thread_start_write);
    sensitive << ( real_start );
    sensitive << ( start_once_reg );

    SC_METHOD(thread_trunc_ln159_fu_150_p1);
    sensitive << ( i4_0_reg_109 );

    SC_METHOD(thread_xk_mid_col_fifo_V_din);
    sensitive << ( grp_fft1d_0_fu_131_out_V_din );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_xk_mid_col_fifo_V_write);
    sensitive << ( grp_fft1d_0_fu_131_out_V_write );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_xn_mid_col_fifo_V_read);
    sensitive << ( grp_fft1d_0_fu_131_in_V_read );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_xn_mid_col_fifo_V_write);
    sensitive << ( ap_CS_fsm_state5 );
    sensitive << ( xn_mid_col_fifo_V_full_n );

    SC_METHOD(thread_zext_ln159_fu_174_p1);
    sensitive << ( j5_0_reg_120 );

    SC_METHOD(thread_zext_ln160_fu_183_p1);
    sensitive << ( index_fu_178_p2 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( real_start );
    sensitive << ( ap_done_reg );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( icmp_ln155_fu_138_p2 );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( icmp_ln157_fu_162_p2 );
    sensitive << ( ap_CS_fsm_state6 );
    sensitive << ( ap_block_state6_on_subcall_done );
    sensitive << ( ap_CS_fsm_state5 );
    sensitive << ( xn_mid_col_fifo_V_full_n );

    SC_THREAD(thread_ap_var_for_const0);

    start_once_reg = SC_LOGIC_0;
    ap_done_reg = SC_LOGIC_0;
    ap_CS_fsm = "000001";
    grp_fft1d_0_fu_131_ap_start_reg = SC_LOGIC_0;
    ap_sync_reg_grp_fft1d_0_fu_131_ap_ready = SC_LOGIC_0;
    ap_sync_reg_grp_fft1d_0_fu_131_ap_done = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "Loop_l_f1d_col_proc2_sc_trace_" << apTFileNum ++;
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
    sc_trace(mVcdFile, xk_mid_col_fifo_V_din, "(port)xk_mid_col_fifo_V_din");
    sc_trace(mVcdFile, xk_mid_col_fifo_V_full_n, "(port)xk_mid_col_fifo_V_full_n");
    sc_trace(mVcdFile, xk_mid_col_fifo_V_write, "(port)xk_mid_col_fifo_V_write");
    sc_trace(mVcdFile, arr0_address0, "(port)arr0_address0");
    sc_trace(mVcdFile, arr0_ce0, "(port)arr0_ce0");
    sc_trace(mVcdFile, arr0_q0, "(port)arr0_q0");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, real_start, "real_start");
    sc_trace(mVcdFile, start_once_reg, "start_once_reg");
    sc_trace(mVcdFile, ap_done_reg, "ap_done_reg");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, internal_ap_ready, "internal_ap_ready");
    sc_trace(mVcdFile, i_fu_144_p2, "i_fu_144_p2");
    sc_trace(mVcdFile, i_reg_197, "i_reg_197");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, shl_ln_fu_154_p3, "shl_ln_fu_154_p3");
    sc_trace(mVcdFile, shl_ln_reg_202, "shl_ln_reg_202");
    sc_trace(mVcdFile, icmp_ln155_fu_138_p2, "icmp_ln155_fu_138_p2");
    sc_trace(mVcdFile, j_fu_168_p2, "j_fu_168_p2");
    sc_trace(mVcdFile, j_reg_210, "j_reg_210");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, icmp_ln157_fu_162_p2, "icmp_ln157_fu_162_p2");
    sc_trace(mVcdFile, tmp_4_reg_220, "tmp_4_reg_220");
    sc_trace(mVcdFile, ap_CS_fsm_state4, "ap_CS_fsm_state4");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_in_V_read, "grp_fft1d_0_fu_131_in_V_read");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_out_V_din, "grp_fft1d_0_fu_131_out_V_din");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_out_V_write, "grp_fft1d_0_fu_131_out_V_write");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_ap_start, "grp_fft1d_0_fu_131_ap_start");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_ap_done, "grp_fft1d_0_fu_131_ap_done");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_ap_ready, "grp_fft1d_0_fu_131_ap_ready");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_ap_idle, "grp_fft1d_0_fu_131_ap_idle");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_ap_continue, "grp_fft1d_0_fu_131_ap_continue");
    sc_trace(mVcdFile, i4_0_reg_109, "i4_0_reg_109");
    sc_trace(mVcdFile, ap_CS_fsm_state6, "ap_CS_fsm_state6");
    sc_trace(mVcdFile, ap_sync_grp_fft1d_0_fu_131_ap_ready, "ap_sync_grp_fft1d_0_fu_131_ap_ready");
    sc_trace(mVcdFile, ap_sync_grp_fft1d_0_fu_131_ap_done, "ap_sync_grp_fft1d_0_fu_131_ap_done");
    sc_trace(mVcdFile, ap_block_state6_on_subcall_done, "ap_block_state6_on_subcall_done");
    sc_trace(mVcdFile, ap_block_state1, "ap_block_state1");
    sc_trace(mVcdFile, j5_0_reg_120, "j5_0_reg_120");
    sc_trace(mVcdFile, ap_CS_fsm_state5, "ap_CS_fsm_state5");
    sc_trace(mVcdFile, xn_mid_col_fifo_V_full_n, "xn_mid_col_fifo_V_full_n");
    sc_trace(mVcdFile, xn_mid_col_fifo_V_write, "xn_mid_col_fifo_V_write");
    sc_trace(mVcdFile, grp_fft1d_0_fu_131_ap_start_reg, "grp_fft1d_0_fu_131_ap_start_reg");
    sc_trace(mVcdFile, ap_sync_reg_grp_fft1d_0_fu_131_ap_ready, "ap_sync_reg_grp_fft1d_0_fu_131_ap_ready");
    sc_trace(mVcdFile, ap_sync_reg_grp_fft1d_0_fu_131_ap_done, "ap_sync_reg_grp_fft1d_0_fu_131_ap_done");
    sc_trace(mVcdFile, xn_mid_col_fifo_V_dout, "xn_mid_col_fifo_V_dout");
    sc_trace(mVcdFile, xn_mid_col_fifo_V_empty_n, "xn_mid_col_fifo_V_empty_n");
    sc_trace(mVcdFile, xn_mid_col_fifo_V_read, "xn_mid_col_fifo_V_read");
    sc_trace(mVcdFile, zext_ln160_fu_183_p1, "zext_ln160_fu_183_p1");
    sc_trace(mVcdFile, trunc_ln159_fu_150_p1, "trunc_ln159_fu_150_p1");
    sc_trace(mVcdFile, zext_ln159_fu_174_p1, "zext_ln159_fu_174_p1");
    sc_trace(mVcdFile, index_fu_178_p2, "index_fu_178_p2");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

Loop_l_f1d_col_proc2::~Loop_l_f1d_col_proc2() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete grp_fft1d_0_fu_131;
    delete xn_mid_col_fifo_V_fifo_U;
}

void Loop_l_f1d_col_proc2::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void Loop_l_f1d_col_proc2::thread_ap_clk_no_reset_() {
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
                    esl_seteq<1,1,1>(icmp_ln155_fu_138_p2.read(), ap_const_lv1_1))) {
            ap_done_reg = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_grp_fft1d_0_fu_131_ap_done = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
             esl_seteq<1,1,1>(ap_block_state6_on_subcall_done.read(), ap_const_boolean_0))) {
            ap_sync_reg_grp_fft1d_0_fu_131_ap_done = ap_const_logic_0;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_fft1d_0_fu_131_ap_done.read())) {
            ap_sync_reg_grp_fft1d_0_fu_131_ap_done = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_grp_fft1d_0_fu_131_ap_ready = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
             esl_seteq<1,1,1>(ap_block_state6_on_subcall_done.read(), ap_const_boolean_0))) {
            ap_sync_reg_grp_fft1d_0_fu_131_ap_ready = ap_const_logic_0;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_fft1d_0_fu_131_ap_ready.read())) {
            ap_sync_reg_grp_fft1d_0_fu_131_ap_ready = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        grp_fft1d_0_fu_131_ap_start_reg = ap_const_logic_0;
    } else {
        if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
              esl_seteq<1,1,1>(icmp_ln157_fu_162_p2.read(), ap_const_lv1_1)) || 
             (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
              esl_seteq<1,1,1>(ap_const_logic_0, ap_sync_grp_fft1d_0_fu_131_ap_ready.read())))) {
            grp_fft1d_0_fu_131_ap_start_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, grp_fft1d_0_fu_131_ap_ready.read())) {
            grp_fft1d_0_fu_131_ap_start_reg = ap_const_logic_0;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
        i4_0_reg_109 = ap_const_lv6_0;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
                esl_seteq<1,1,1>(ap_block_state6_on_subcall_done.read(), ap_const_boolean_0))) {
        i4_0_reg_109 = i_reg_197.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
         esl_seteq<1,1,1>(xn_mid_col_fifo_V_full_n.read(), ap_const_logic_1))) {
        j5_0_reg_120 = j_reg_210.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(icmp_ln155_fu_138_p2.read(), ap_const_lv1_0))) {
        j5_0_reg_120 = ap_const_lv6_0;
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
        i_reg_197 = i_fu_144_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        j_reg_210 = j_fu_168_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(icmp_ln155_fu_138_p2.read(), ap_const_lv1_0))) {
        shl_ln_reg_202 = shl_ln_fu_154_p3.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        tmp_4_reg_220 = arr0_q0.read();
    }
}

void Loop_l_f1d_col_proc2::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void Loop_l_f1d_col_proc2::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void Loop_l_f1d_col_proc2::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void Loop_l_f1d_col_proc2::thread_ap_CS_fsm_state4() {
    ap_CS_fsm_state4 = ap_CS_fsm.read()[3];
}

void Loop_l_f1d_col_proc2::thread_ap_CS_fsm_state5() {
    ap_CS_fsm_state5 = ap_CS_fsm.read()[4];
}

void Loop_l_f1d_col_proc2::thread_ap_CS_fsm_state6() {
    ap_CS_fsm_state6 = ap_CS_fsm.read()[5];
}

void Loop_l_f1d_col_proc2::thread_ap_block_state1() {
    ap_block_state1 = (esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1));
}

void Loop_l_f1d_col_proc2::thread_ap_block_state6_on_subcall_done() {
    ap_block_state6_on_subcall_done = esl_seteq<1,1,1>(ap_const_logic_0, (ap_sync_grp_fft1d_0_fu_131_ap_ready.read() & ap_sync_grp_fft1d_0_fu_131_ap_done.read()));
}

void Loop_l_f1d_col_proc2::thread_ap_done() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(icmp_ln155_fu_138_p2.read(), ap_const_lv1_1))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_done_reg.read();
    }
}

void Loop_l_f1d_col_proc2::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_ap_ready() {
    ap_ready = internal_ap_ready.read();
}

void Loop_l_f1d_col_proc2::thread_ap_sync_grp_fft1d_0_fu_131_ap_done() {
    ap_sync_grp_fft1d_0_fu_131_ap_done = (grp_fft1d_0_fu_131_ap_done.read() | ap_sync_reg_grp_fft1d_0_fu_131_ap_done.read());
}

void Loop_l_f1d_col_proc2::thread_ap_sync_grp_fft1d_0_fu_131_ap_ready() {
    ap_sync_grp_fft1d_0_fu_131_ap_ready = (grp_fft1d_0_fu_131_ap_ready.read() | ap_sync_reg_grp_fft1d_0_fu_131_ap_ready.read());
}

void Loop_l_f1d_col_proc2::thread_arr0_address0() {
    arr0_address0 =  (sc_lv<10>) (zext_ln160_fu_183_p1.read());
}

void Loop_l_f1d_col_proc2::thread_arr0_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        arr0_ce0 = ap_const_logic_1;
    } else {
        arr0_ce0 = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_grp_fft1d_0_fu_131_ap_continue() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
         esl_seteq<1,1,1>(ap_block_state6_on_subcall_done.read(), ap_const_boolean_0))) {
        grp_fft1d_0_fu_131_ap_continue = ap_const_logic_1;
    } else {
        grp_fft1d_0_fu_131_ap_continue = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_grp_fft1d_0_fu_131_ap_start() {
    grp_fft1d_0_fu_131_ap_start = grp_fft1d_0_fu_131_ap_start_reg.read();
}

void Loop_l_f1d_col_proc2::thread_i_fu_144_p2() {
    i_fu_144_p2 = (!i4_0_reg_109.read().is_01() || !ap_const_lv6_1.is_01())? sc_lv<6>(): (sc_biguint<6>(i4_0_reg_109.read()) + sc_biguint<6>(ap_const_lv6_1));
}

void Loop_l_f1d_col_proc2::thread_icmp_ln155_fu_138_p2() {
    icmp_ln155_fu_138_p2 = (!i4_0_reg_109.read().is_01() || !ap_const_lv6_20.is_01())? sc_lv<1>(): sc_lv<1>(i4_0_reg_109.read() == ap_const_lv6_20);
}

void Loop_l_f1d_col_proc2::thread_icmp_ln157_fu_162_p2() {
    icmp_ln157_fu_162_p2 = (!j5_0_reg_120.read().is_01() || !ap_const_lv6_20.is_01())? sc_lv<1>(): sc_lv<1>(j5_0_reg_120.read() == ap_const_lv6_20);
}

void Loop_l_f1d_col_proc2::thread_index_fu_178_p2() {
    index_fu_178_p2 = (!shl_ln_reg_202.read().is_01() || !zext_ln159_fu_174_p1.read().is_01())? sc_lv<10>(): (sc_biguint<10>(shl_ln_reg_202.read()) + sc_biguint<10>(zext_ln159_fu_174_p1.read()));
}

void Loop_l_f1d_col_proc2::thread_internal_ap_ready() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(icmp_ln155_fu_138_p2.read(), ap_const_lv1_1))) {
        internal_ap_ready = ap_const_logic_1;
    } else {
        internal_ap_ready = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_j_fu_168_p2() {
    j_fu_168_p2 = (!j5_0_reg_120.read().is_01() || !ap_const_lv6_1.is_01())? sc_lv<6>(): (sc_biguint<6>(j5_0_reg_120.read()) + sc_biguint<6>(ap_const_lv6_1));
}

void Loop_l_f1d_col_proc2::thread_real_start() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, start_full_n.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, start_once_reg.read()))) {
        real_start = ap_const_logic_0;
    } else {
        real_start = ap_start.read();
    }
}

void Loop_l_f1d_col_proc2::thread_shl_ln_fu_154_p3() {
    shl_ln_fu_154_p3 = esl_concat<5,5>(trunc_ln159_fu_150_p1.read(), ap_const_lv5_0);
}

void Loop_l_f1d_col_proc2::thread_start_out() {
    start_out = real_start.read();
}

void Loop_l_f1d_col_proc2::thread_start_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, start_once_reg.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, real_start.read()))) {
        start_write = ap_const_logic_1;
    } else {
        start_write = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_trunc_ln159_fu_150_p1() {
    trunc_ln159_fu_150_p1 = i4_0_reg_109.read().range(5-1, 0);
}

void Loop_l_f1d_col_proc2::thread_xk_mid_col_fifo_V_din() {
    xk_mid_col_fifo_V_din = grp_fft1d_0_fu_131_out_V_din.read();
}

void Loop_l_f1d_col_proc2::thread_xk_mid_col_fifo_V_write() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read())) {
        xk_mid_col_fifo_V_write = grp_fft1d_0_fu_131_out_V_write.read();
    } else {
        xk_mid_col_fifo_V_write = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_xn_mid_col_fifo_V_read() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read())) {
        xn_mid_col_fifo_V_read = grp_fft1d_0_fu_131_in_V_read.read();
    } else {
        xn_mid_col_fifo_V_read = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_xn_mid_col_fifo_V_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
         esl_seteq<1,1,1>(xn_mid_col_fifo_V_full_n.read(), ap_const_logic_1))) {
        xn_mid_col_fifo_V_write = ap_const_logic_1;
    } else {
        xn_mid_col_fifo_V_write = ap_const_logic_0;
    }
}

void Loop_l_f1d_col_proc2::thread_zext_ln159_fu_174_p1() {
    zext_ln159_fu_174_p1 = esl_zext<10,6>(j5_0_reg_120.read());
}

void Loop_l_f1d_col_proc2::thread_zext_ln160_fu_183_p1() {
    zext_ln160_fu_183_p1 = esl_zext<64,10>(index_fu_178_p2.read());
}

void Loop_l_f1d_col_proc2::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(icmp_ln155_fu_138_p2.read(), ap_const_lv1_1))) {
                ap_NS_fsm = ap_ST_fsm_state1;
            } else {
                ap_NS_fsm = ap_ST_fsm_state3;
            }
            break;
        case 4 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(icmp_ln157_fu_162_p2.read(), ap_const_lv1_1))) {
                ap_NS_fsm = ap_ST_fsm_state6;
            } else {
                ap_NS_fsm = ap_ST_fsm_state4;
            }
            break;
        case 8 : 
            ap_NS_fsm = ap_ST_fsm_state5;
            break;
        case 16 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && esl_seteq<1,1,1>(xn_mid_col_fifo_V_full_n.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else {
                ap_NS_fsm = ap_ST_fsm_state5;
            }
            break;
        case 32 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && esl_seteq<1,1,1>(ap_block_state6_on_subcall_done.read(), ap_const_boolean_0))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state6;
            }
            break;
        default : 
            ap_NS_fsm = "XXXXXX";
            break;
    }
}

}

