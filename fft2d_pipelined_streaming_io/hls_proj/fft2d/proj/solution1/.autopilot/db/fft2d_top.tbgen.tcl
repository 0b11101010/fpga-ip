set moduleName fft2d_top
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {fft2d_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ xn_data int 64 regular {axi_s 0 volatile  { xn Data } }  }
	{ xn_last int 1 regular {axi_s 0 volatile  { xn Last } }  }
	{ xk_data int 64 regular {axi_s 1 volatile  { xk Data } }  }
	{ xk_last int 1 regular {axi_s 1 volatile  { xk Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "xn_data", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "xn.data.real","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "xn.data.imag","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "xn_last", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "xn.last","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "xk_data", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "xk.data.real","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "xk.data.imag","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "xk_last", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "xk.last","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ xn_TDATA sc_in sc_lv 64 signal 0 } 
	{ xn_TLAST sc_in sc_logic 1 signal 1 } 
	{ xk_TDATA sc_out sc_lv 64 signal 2 } 
	{ xk_TLAST sc_out sc_logic 1 signal 3 } 
	{ xn_TVALID sc_in sc_logic 1 invld 1 } 
	{ xn_TREADY sc_out sc_logic 1 inacc 1 } 
	{ xk_TVALID sc_out sc_logic 1 outvld 3 } 
	{ xk_TREADY sc_in sc_logic 1 outacc 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "xn_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "xn_data", "role": "" }} , 
 	{ "name": "xn_TLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xn_last", "role": "" }} , 
 	{ "name": "xk_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "xk_data", "role": "" }} , 
 	{ "name": "xk_TLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xk_last", "role": "" }} , 
 	{ "name": "xn_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "xn_last", "role": "D" }} , 
 	{ "name": "xn_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "xn_last", "role": "Y" }} , 
 	{ "name": "xk_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xk_last", "role": "D" }} , 
 	{ "name": "xk_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "xk_last", "role": "Y" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "16", "17", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39"],
		"CDFG" : "fft2d_top",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17299", "EstimateLatencyMax" : "17299",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "3", "Name" : "Loop_l_rd_xn_proc23_U0"}],
		"OutputProcess" : [
			{"ID" : "31", "Name" : "Loop_l_wr_xk_proc29_U0"}],
		"Port" : [
			{"Name" : "xn_data", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "Loop_l_rd_xn_proc23_U0", "Port" : "xn_data"}]},
			{"Name" : "xn_last", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "Loop_l_rd_xn_proc23_U0", "Port" : "xn_last"}]},
			{"Name" : "xk_data", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "Loop_l_wr_xk_proc29_U0", "Port" : "xk_data"}]},
			{"Name" : "xk_last", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "Loop_l_wr_xk_proc29_U0", "Port" : "xk_last"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arr1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arr0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_rd_xn_proc23_U0", "Parent" : "0",
		"CDFG" : "Loop_l_rd_xn_proc23",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "1026",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "xn_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xn_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xn_last", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "xn_fifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "32",
				"BlockSignal" : [
					{"Name" : "xn_fifo_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0", "Parent" : "0", "Child" : ["5", "15"],
		"CDFG" : "Loop_l_f1d_row_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6849", "EstimateLatencyMax" : "6849",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "3",
		"StartFifo" : "start_for_Loop_l_f1d_row_proc2_U0_U",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_fft1d_1_fu_125"}],
		"Port" : [
			{"Name" : "xk_mid_row_fifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "16", "DependentChan" : "33",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_fft1d_1_fu_125", "Port" : "out_V"}]},
			{"Name" : "xn_fifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "32",
				"BlockSignal" : [
					{"Name" : "xn_fifo_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125", "Parent" : "4", "Child" : ["6", "7", "8", "9", "10", "11", "12", "13", "14"],
		"CDFG" : "fft1d_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "179",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "6", "Name" : "fft1d_1_Block_codeRe_U0", "ReadyCount" : "fft1d_1_Block_codeRe_U0_ap_ready_count"},
			{"ID" : "7", "Name" : "fft1d_1_Loop_1_proc1_U0", "ReadyCount" : "fft1d_1_Loop_1_proc1_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "9", "Name" : "fft1d_1_Loop_2_proc2_U0"}],
		"Port" : [
			{"Name" : "in_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "fft1d_1_Loop_1_proc1_U0", "Port" : "in_V"}]},
			{"Name" : "out_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "fft1d_1_Loop_2_proc2_U0", "Port" : "out_V"}]}]},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.fft1d_1_Block_codeRe_U0", "Parent" : "5",
		"CDFG" : "fft1d_1_Block_codeRe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "config_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "config_data_V_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.fft1d_1_Loop_1_proc1_U0", "Parent" : "5",
		"CDFG" : "fft1d_1_Loop_1_proc1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "in_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xn", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "xn_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.fft_configuration_U0", "Parent" : "5",
		"CDFG" : "fft_configuration_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "179",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "6",
		"StartFifo" : "start_for_fft_configuration_U0_U",
		"Port" : [
			{"Name" : "xn", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "11"},
			{"Name" : "xk", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "12"},
			{"Name" : "status_data_V", "Type" : "Fifo", "Direction" : "O"},
			{"Name" : "config_ch_data_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "10"}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.fft1d_1_Loop_2_proc2_U0", "Parent" : "5",
		"CDFG" : "fft1d_1_Loop_2_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "6",
		"StartFifo" : "start_for_fft1d_1_Loop_2_proc2_U0_U",
		"Port" : [
			{"Name" : "xk", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "xk_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.config_data_V_1_chan_U", "Parent" : "5"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.xn_channel_U", "Parent" : "5"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.xk_channel_U", "Parent" : "5"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.start_for_fft_configuration_U0_U", "Parent" : "5"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.grp_fft1d_1_fu_125.start_for_fft1d_1_Loop_2_proc2_U0_U", "Parent" : "5"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_row_proc2_U0.xn_mid_row_fifo_V_fifo_U", "Parent" : "4"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_transp_mid_pr_U0", "Parent" : "0",
		"CDFG" : "Loop_l_transp_mid_pr",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "4",
		"StartFifo" : "start_for_Loop_l_transp_mid_pr_U0_U",
		"Port" : [
			{"Name" : "xk_mid_row_fifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "33",
				"BlockSignal" : [
					{"Name" : "xk_mid_row_fifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "arr0", "Type" : "Memory", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "2"}]},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0", "Parent" : "0", "Child" : ["18", "28"],
		"CDFG" : "Loop_l_f1d_col_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8897", "EstimateLatencyMax" : "8897",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state6", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_fft1d_0_fu_131"}],
		"Port" : [
			{"Name" : "xk_mid_col_fifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "29", "DependentChan" : "34",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_fft1d_0_fu_131", "Port" : "out_V"}]},
			{"Name" : "arr0", "Type" : "Memory", "Direction" : "I", "DependentProc" : "16", "DependentChan" : "2"}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131", "Parent" : "17", "Child" : ["19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "fft1d_0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "179",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "19", "Name" : "fft1d_0_Block_codeRe_U0", "ReadyCount" : "fft1d_0_Block_codeRe_U0_ap_ready_count"},
			{"ID" : "20", "Name" : "fft1d_0_Loop_1_proc2_U0", "ReadyCount" : "fft1d_0_Loop_1_proc2_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "22", "Name" : "fft1d_0_Loop_2_proc2_U0"}],
		"Port" : [
			{"Name" : "in_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "fft1d_0_Loop_1_proc2_U0", "Port" : "in_V"}]},
			{"Name" : "out_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "fft1d_0_Loop_2_proc2_U0", "Port" : "out_V"}]}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.fft1d_0_Block_codeRe_U0", "Parent" : "18",
		"CDFG" : "fft1d_0_Block_codeRe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "config_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "21", "DependentChan" : "23",
				"BlockSignal" : [
					{"Name" : "config_data_V_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.fft1d_0_Loop_1_proc2_U0", "Parent" : "18",
		"CDFG" : "fft1d_0_Loop_1_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "in_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xn", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "21", "DependentChan" : "24",
				"BlockSignal" : [
					{"Name" : "xn_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.fft_configuration_1_U0", "Parent" : "18",
		"CDFG" : "fft_configuration_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "179",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "19",
		"StartFifo" : "start_for_fft_configuration_1_U0_U",
		"Port" : [
			{"Name" : "xn", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "20", "DependentChan" : "24"},
			{"Name" : "xk", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "22", "DependentChan" : "25"},
			{"Name" : "status_data_V", "Type" : "Fifo", "Direction" : "O"},
			{"Name" : "config_ch_data_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "19", "DependentChan" : "23"}]},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.fft1d_0_Loop_2_proc2_U0", "Parent" : "18",
		"CDFG" : "fft1d_0_Loop_2_proc2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "19",
		"StartFifo" : "start_for_fft1d_0_Loop_2_proc2_U0_U",
		"Port" : [
			{"Name" : "xk", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "21", "DependentChan" : "25",
				"BlockSignal" : [
					{"Name" : "xk_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.config_data_V_1_chan_U", "Parent" : "18"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.xn_channel_U", "Parent" : "18"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.xk_channel_U", "Parent" : "18"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.start_for_fft_configuration_1_U0_U", "Parent" : "18"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.grp_fft1d_0_fu_131.start_for_fft1d_0_Loop_2_proc2_U0_U", "Parent" : "18"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_l_f1d_col_proc2_U0.xn_mid_col_fifo_V_fifo_U", "Parent" : "17"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_transp_out_pr_U0", "Parent" : "0",
		"CDFG" : "Loop_l_transp_out_pr",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "17",
		"StartFifo" : "start_for_Loop_l_transp_out_pr_U0_U",
		"Port" : [
			{"Name" : "xk_mid_col_fifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "17", "DependentChan" : "34",
				"BlockSignal" : [
					{"Name" : "xk_mid_col_fifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "arr1", "Type" : "Memory", "Direction" : "O", "DependentProc" : "30", "DependentChan" : "1"}]},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_wr_o_fifo_pro_U0", "Parent" : "0",
		"CDFG" : "Loop_l_wr_o_fifo_pro",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1028", "EstimateLatencyMax" : "1028",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "arr1", "Type" : "Memory", "Direction" : "I", "DependentProc" : "29", "DependentChan" : "1"},
			{"Name" : "xk_fifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "31", "DependentChan" : "35",
				"BlockSignal" : [
					{"Name" : "xk_fifo_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_l_wr_xk_proc29_U0", "Parent" : "0",
		"CDFG" : "Loop_l_wr_xk_proc29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "30",
		"StartFifo" : "start_for_Loop_l_wr_xk_proc29_U0_U",
		"Port" : [
			{"Name" : "xk_fifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "30", "DependentChan" : "35",
				"BlockSignal" : [
					{"Name" : "xk_fifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xk_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "xk_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xk_last", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xn_fifo_V_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xk_mid_row_fifo_V_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xk_mid_col_fifo_V_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xk_fifo_V_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_l_f1d_row_proc2_U0_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_l_transp_mid_pr_U0_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_l_transp_out_pr_U0_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_l_wr_xk_proc29_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft2d_top {
		xn_data {Type I LastRead 1 FirstWrite -1}
		xn_last {Type I LastRead 1 FirstWrite -1}
		xk_data {Type O LastRead -1 FirstWrite 2}
		xk_last {Type O LastRead -1 FirstWrite 2}}
	Loop_l_rd_xn_proc23 {
		xn_data {Type I LastRead 1 FirstWrite -1}
		xn_last {Type I LastRead 1 FirstWrite -1}
		xn_fifo_V {Type O LastRead -1 FirstWrite 2}}
	Loop_l_f1d_row_proc2 {
		xk_mid_row_fifo_V {Type O LastRead -1 FirstWrite 2}
		xn_fifo_V {Type I LastRead 2 FirstWrite -1}}
	fft1d_1 {
		in_V {Type I LastRead 2 FirstWrite -1}
		out_V {Type O LastRead -1 FirstWrite 2}}
	fft1d_1_Block_codeRe {
		config_data_V_1 {Type O LastRead -1 FirstWrite 0}}
	fft1d_1_Loop_1_proc1 {
		in_V {Type I LastRead 2 FirstWrite -1}
		xn {Type O LastRead -1 FirstWrite 2}}
	fft_configuration_s {
		xn {Type I LastRead -1 FirstWrite -1}
		xk {Type O LastRead -1 FirstWrite -1}
		status_data_V {Type O LastRead -1 FirstWrite -1}
		config_ch_data_V {Type I LastRead -1 FirstWrite -1}}
	fft1d_1_Loop_2_proc2 {
		xk {Type I LastRead 2 FirstWrite -1}
		out_V {Type O LastRead -1 FirstWrite 2}}
	Loop_l_transp_mid_pr {
		xk_mid_row_fifo_V {Type I LastRead 2 FirstWrite -1}
		arr0 {Type O LastRead -1 FirstWrite 3}}
	Loop_l_f1d_col_proc2 {
		xk_mid_col_fifo_V {Type O LastRead -1 FirstWrite 2}
		arr0 {Type I LastRead 2 FirstWrite -1}}
	fft1d_0 {
		in_V {Type I LastRead 2 FirstWrite -1}
		out_V {Type O LastRead -1 FirstWrite 2}}
	fft1d_0_Block_codeRe {
		config_data_V_1 {Type O LastRead -1 FirstWrite 0}}
	fft1d_0_Loop_1_proc2 {
		in_V {Type I LastRead 2 FirstWrite -1}
		xn {Type O LastRead -1 FirstWrite 2}}
	fft_configuration_1 {
		xn {Type I LastRead -1 FirstWrite -1}
		xk {Type O LastRead -1 FirstWrite -1}
		status_data_V {Type O LastRead -1 FirstWrite -1}
		config_ch_data_V {Type I LastRead -1 FirstWrite -1}}
	fft1d_0_Loop_2_proc2 {
		xk {Type I LastRead 2 FirstWrite -1}
		out_V {Type O LastRead -1 FirstWrite 2}}
	Loop_l_transp_out_pr {
		xk_mid_col_fifo_V {Type I LastRead 2 FirstWrite -1}
		arr1 {Type O LastRead -1 FirstWrite 3}}
	Loop_l_wr_o_fifo_pro {
		arr1 {Type I LastRead 2 FirstWrite -1}
		xk_fifo_V {Type O LastRead -1 FirstWrite 4}}
	Loop_l_wr_xk_proc29 {
		xk_fifo_V {Type I LastRead 2 FirstWrite -1}
		xk_data {Type O LastRead -1 FirstWrite 2}
		xk_last {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "17299", "Max" : "17299"}
	, {"Name" : "Interval", "Min" : "8898", "Max" : "8898"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	xn_data { axis {  { xn_TDATA in_data 0 64 } } }
	xn_last { axis {  { xn_TLAST in_data 0 1 }  { xn_TVALID in_vld 0 1 }  { xn_TREADY in_acc 1 1 } } }
	xk_data { axis {  { xk_TDATA out_data 1 64 } } }
	xk_last { axis {  { xk_TLAST out_data 1 1 }  { xk_TVALID out_vld 1 1 }  { xk_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
