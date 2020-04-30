set moduleName Loop_l_f1d_row_proc2
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Loop_l_f1d_row_proc2}
set C_modelType { void 0 }
set C_modelArgList {
	{ xk_mid_row_fifo_V int 64 regular {fifo 1 volatile }  }
	{ xn_fifo_V int 64 regular {fifo 0 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "xk_mid_row_fifo_V", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "xn_fifo_V", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ xk_mid_row_fifo_V_din sc_out sc_lv 64 signal 0 } 
	{ xk_mid_row_fifo_V_full_n sc_in sc_logic 1 signal 0 } 
	{ xk_mid_row_fifo_V_write sc_out sc_logic 1 signal 0 } 
	{ xn_fifo_V_dout sc_in sc_lv 64 signal 1 } 
	{ xn_fifo_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ xn_fifo_V_read sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "xk_mid_row_fifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "xk_mid_row_fifo_V", "role": "din" }} , 
 	{ "name": "xk_mid_row_fifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xk_mid_row_fifo_V", "role": "full_n" }} , 
 	{ "name": "xk_mid_row_fifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xk_mid_row_fifo_V", "role": "write" }} , 
 	{ "name": "xn_fifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "xn_fifo_V", "role": "dout" }} , 
 	{ "name": "xn_fifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xn_fifo_V", "role": "empty_n" }} , 
 	{ "name": "xn_fifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xn_fifo_V", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "11"],
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
		"WaitState" : [
			{"State" : "ap_ST_fsm_state4", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_fft1d_1_fu_125"}],
		"Port" : [
			{"Name" : "xk_mid_row_fifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fft1d_1_fu_125", "Port" : "out_V"}]},
			{"Name" : "xn_fifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "xn_fifo_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10"],
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
			{"ID" : "2", "Name" : "fft1d_1_Block_codeRe_U0", "ReadyCount" : "fft1d_1_Block_codeRe_U0_ap_ready_count"},
			{"ID" : "3", "Name" : "fft1d_1_Loop_1_proc1_U0", "ReadyCount" : "fft1d_1_Loop_1_proc1_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "5", "Name" : "fft1d_1_Loop_2_proc2_U0"}],
		"Port" : [
			{"Name" : "in_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "fft1d_1_Loop_1_proc1_U0", "Port" : "in_V"}]},
			{"Name" : "out_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "fft1d_1_Loop_2_proc2_U0", "Port" : "out_V"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.fft1d_1_Block_codeRe_U0", "Parent" : "1",
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
			{"Name" : "config_data_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "6",
				"BlockSignal" : [
					{"Name" : "config_data_V_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.fft1d_1_Loop_1_proc1_U0", "Parent" : "1",
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
			{"Name" : "xn", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "7",
				"BlockSignal" : [
					{"Name" : "xn_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.fft_configuration_U0", "Parent" : "1",
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
		"StartSource" : "2",
		"StartFifo" : "start_for_fft_configuration_U0_U",
		"Port" : [
			{"Name" : "xn", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "7"},
			{"Name" : "xk", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "8"},
			{"Name" : "status_data_V", "Type" : "Fifo", "Direction" : "O"},
			{"Name" : "config_ch_data_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "6"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.fft1d_1_Loop_2_proc2_U0", "Parent" : "1",
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
		"StartSource" : "2",
		"StartFifo" : "start_for_fft1d_1_Loop_2_proc2_U0_U",
		"Port" : [
			{"Name" : "xk", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "8",
				"BlockSignal" : [
					{"Name" : "xk_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.config_data_V_1_chan_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.xn_channel_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.xk_channel_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.start_for_fft_configuration_U0_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft1d_1_fu_125.start_for_fft1d_1_Loop_2_proc2_U0_U", "Parent" : "1"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xn_mid_row_fifo_V_fifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		out_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6849", "Max" : "6849"}
	, {"Name" : "Interval", "Min" : "6849", "Max" : "6849"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	xk_mid_row_fifo_V { ap_fifo {  { xk_mid_row_fifo_V_din fifo_data 1 64 }  { xk_mid_row_fifo_V_full_n fifo_status 0 1 }  { xk_mid_row_fifo_V_write fifo_update 1 1 } } }
	xn_fifo_V { ap_fifo {  { xn_fifo_V_dout fifo_data 0 64 }  { xn_fifo_V_empty_n fifo_status 0 1 }  { xn_fifo_V_read fifo_update 1 1 } } }
}
