
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set xk_group [add_wave_group xk(axis) -into $coutputgroup]
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xk_TREADY -into $xk_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xk_TVALID -into $xk_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xk_TLAST -into $xk_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xk_TDATA -into $xk_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set xn_group [add_wave_group xn(axis) -into $cinputgroup]
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xn_TREADY -into $xn_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xn_TVALID -into $xn_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xn_TLAST -into $xn_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/xn_TDATA -into $xn_group -radix hex
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_fft2d_top_top/AESL_inst_fft2d_top/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_fft2d_top_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/ap_c_n_tvin_trans_num_xn_data -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/ap_c_n_tvin_trans_num_xn_last -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/ap_c_n_tvout_trans_num_xk_data -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/ap_c_n_tvout_trans_num_xk_last -into $tb_simstatus_group -radix hex
add_wave /apatb_fft2d_top_top/LENGTH_xn_data -into $tb_portdepth_group -radix hex
add_wave /apatb_fft2d_top_top/LENGTH_xn_last -into $tb_portdepth_group -radix hex
add_wave /apatb_fft2d_top_top/LENGTH_xk_data -into $tb_portdepth_group -radix hex
add_wave /apatb_fft2d_top_top/LENGTH_xk_last -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_xk_group [add_wave_group xk(axis) -into $tbcoutputgroup]
add_wave /apatb_fft2d_top_top/xk_TREADY -into $tb_xk_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/xk_TVALID -into $tb_xk_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/xk_TLAST -into $tb_xk_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/xk_TDATA -into $tb_xk_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_xn_group [add_wave_group xn(axis) -into $tbcinputgroup]
add_wave /apatb_fft2d_top_top/xn_TREADY -into $tb_xn_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/xn_TVALID -into $tb_xn_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/xn_TLAST -into $tb_xn_group -color #ffff00 -radix hex
add_wave /apatb_fft2d_top_top/xn_TDATA -into $tb_xn_group -radix hex
save_wave_config fft2d_top.wcfg
run all
quit

