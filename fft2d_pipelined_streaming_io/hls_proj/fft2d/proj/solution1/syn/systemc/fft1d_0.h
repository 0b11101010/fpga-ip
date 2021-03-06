// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _fft1d_0_HH_
#define _fft1d_0_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "fft1d_0_Block_codeRe.h"
#include "fft1d_0_Loop_1_proc2.h"
#include "fft_configuration_1.h"
#include "fft1d_0_Loop_2_proc2.h"
#include "fifo_w8_d2_A_x.h"
#include "fifo_w64_d32_A_x0.h"
#include "start_for_fft_configuration_1_U0.h"
#include "start_for_fft1d_0_Loop_2_proc2_U0.h"

namespace ap_rtl {

struct fft1d_0 : public sc_module {
    // Port declarations 13
    sc_in< sc_lv<64> > in_V_dout;
    sc_in< sc_logic > in_V_empty_n;
    sc_out< sc_logic > in_V_read;
    sc_out< sc_lv<64> > out_V_din;
    sc_in< sc_logic > out_V_full_n;
    sc_out< sc_logic > out_V_write;
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_logic > ap_idle;
    sc_in< sc_logic > ap_continue;
    sc_signal< sc_logic > ap_var_for_const0;


    // Module declarations
    fft1d_0(sc_module_name name);
    SC_HAS_PROCESS(fft1d_0);

    ~fft1d_0();

    sc_trace_file* mVcdFile;

    fft1d_0_Block_codeRe* fft1d_0_Block_codeRe_U0;
    fft1d_0_Loop_1_proc2* fft1d_0_Loop_1_proc2_U0;
    fft_configuration_1* fft_configuration_1_U0;
    fft1d_0_Loop_2_proc2* fft1d_0_Loop_2_proc2_U0;
    fifo_w8_d2_A_x* config_data_V_1_chan_U;
    fifo_w64_d32_A_x0* xn_channel_U;
    fifo_w64_d32_A_x0* xk_channel_U;
    start_for_fft_configuration_1_U0* start_for_fft_configuration_1_U0_U;
    start_for_fft1d_0_Loop_2_proc2_U0* start_for_fft1d_0_Loop_2_proc2_U0_U;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_ap_start;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_start_full_n;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_ap_done;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_ap_continue;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_ap_idle;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_ap_ready;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_start_out;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_start_write;
    sc_signal< sc_lv<8> > fft1d_0_Block_codeRe_U0_config_data_V_1_din;
    sc_signal< sc_logic > fft1d_0_Block_codeRe_U0_config_data_V_1_write;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_ap_start;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_ap_done;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_ap_continue;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_ap_idle;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_ap_ready;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_in_V_read;
    sc_signal< sc_lv<64> > fft1d_0_Loop_1_proc2_U0_xn_din;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_xn_write;
    sc_signal< sc_logic > fft_configuration_1_U0_ap_start;
    sc_signal< sc_logic > fft_configuration_1_U0_ap_done;
    sc_signal< sc_logic > fft_configuration_1_U0_ap_idle;
    sc_signal< sc_logic > fft_configuration_1_U0_ap_ready;
    sc_signal< sc_logic > fft_configuration_1_U0_ap_continue;
    sc_signal< sc_logic > fft_configuration_1_U0_xn_read;
    sc_signal< sc_lv<64> > fft_configuration_1_U0_xk_din;
    sc_signal< sc_logic > fft_configuration_1_U0_xk_write;
    sc_signal< sc_lv<8> > fft_configuration_1_U0_status_data_V_din;
    sc_signal< sc_logic > fft_configuration_1_U0_status_data_V_write;
    sc_signal< sc_logic > fft_configuration_1_U0_config_ch_data_V_read;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_ap_start;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_ap_done;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_ap_continue;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_ap_idle;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_ap_ready;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_xk_read;
    sc_signal< sc_lv<64> > fft1d_0_Loop_2_proc2_U0_out_V_din;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_out_V_write;
    sc_signal< sc_logic > ap_sync_continue;
    sc_signal< sc_logic > config_data_V_1_chan_full_n;
    sc_signal< sc_lv<8> > config_data_V_1_chan_dout;
    sc_signal< sc_logic > config_data_V_1_chan_empty_n;
    sc_signal< sc_logic > xn_channel_full_n;
    sc_signal< sc_lv<64> > xn_channel_dout;
    sc_signal< sc_logic > xn_channel_empty_n;
    sc_signal< sc_logic > xk_channel_full_n;
    sc_signal< sc_lv<64> > xk_channel_dout;
    sc_signal< sc_logic > xk_channel_empty_n;
    sc_signal< sc_logic > ap_sync_done;
    sc_signal< sc_logic > ap_sync_ready;
    sc_signal< sc_logic > ap_sync_reg_fft1d_0_Block_codeRe_U0_ap_ready;
    sc_signal< sc_logic > ap_sync_fft1d_0_Block_codeRe_U0_ap_ready;
    sc_signal< sc_lv<2> > fft1d_0_Block_codeRe_U0_ap_ready_count;
    sc_signal< sc_logic > ap_sync_reg_fft1d_0_Loop_1_proc2_U0_ap_ready;
    sc_signal< sc_logic > ap_sync_fft1d_0_Loop_1_proc2_U0_ap_ready;
    sc_signal< sc_lv<2> > fft1d_0_Loop_1_proc2_U0_ap_ready_count;
    sc_signal< sc_lv<1> > start_for_fft_configuration_1_U0_din;
    sc_signal< sc_logic > start_for_fft_configuration_1_U0_full_n;
    sc_signal< sc_lv<1> > start_for_fft_configuration_1_U0_dout;
    sc_signal< sc_logic > start_for_fft_configuration_1_U0_empty_n;
    sc_signal< sc_lv<1> > start_for_fft1d_0_Loop_2_proc2_U0_din;
    sc_signal< sc_logic > start_for_fft1d_0_Loop_2_proc2_U0_full_n;
    sc_signal< sc_lv<1> > start_for_fft1d_0_Loop_2_proc2_U0_dout;
    sc_signal< sc_logic > start_for_fft1d_0_Loop_2_proc2_U0_empty_n;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_start_full_n;
    sc_signal< sc_logic > fft1d_0_Loop_1_proc2_U0_start_write;
    sc_signal< sc_logic > fft_configuration_1_U0_start_full_n;
    sc_signal< sc_logic > fft_configuration_1_U0_start_write;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_start_full_n;
    sc_signal< sc_logic > fft1d_0_Loop_2_proc2_U0_start_write;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<64> ap_const_lv64_0;
    static const sc_logic ap_const_logic_1;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<2> ap_const_lv2_1;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_clk_no_reset_();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_sync_continue();
    void thread_ap_sync_done();
    void thread_ap_sync_fft1d_0_Block_codeRe_U0_ap_ready();
    void thread_ap_sync_fft1d_0_Loop_1_proc2_U0_ap_ready();
    void thread_ap_sync_ready();
    void thread_fft1d_0_Block_codeRe_U0_ap_continue();
    void thread_fft1d_0_Block_codeRe_U0_ap_start();
    void thread_fft1d_0_Block_codeRe_U0_start_full_n();
    void thread_fft1d_0_Loop_1_proc2_U0_ap_continue();
    void thread_fft1d_0_Loop_1_proc2_U0_ap_start();
    void thread_fft1d_0_Loop_1_proc2_U0_start_full_n();
    void thread_fft1d_0_Loop_1_proc2_U0_start_write();
    void thread_fft1d_0_Loop_2_proc2_U0_ap_continue();
    void thread_fft1d_0_Loop_2_proc2_U0_ap_start();
    void thread_fft1d_0_Loop_2_proc2_U0_start_full_n();
    void thread_fft1d_0_Loop_2_proc2_U0_start_write();
    void thread_fft_configuration_1_U0_ap_continue();
    void thread_fft_configuration_1_U0_ap_start();
    void thread_fft_configuration_1_U0_start_full_n();
    void thread_fft_configuration_1_U0_start_write();
    void thread_in_V_read();
    void thread_out_V_din();
    void thread_out_V_write();
    void thread_start_for_fft1d_0_Loop_2_proc2_U0_din();
    void thread_start_for_fft_configuration_1_U0_din();
};

}

using namespace ap_rtl;

#endif
