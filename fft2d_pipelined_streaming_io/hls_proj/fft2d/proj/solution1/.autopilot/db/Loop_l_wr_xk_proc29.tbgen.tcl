set moduleName Loop_l_wr_xk_proc29
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
set C_modelName {Loop_l_wr_xk_proc29}
set C_modelType { void 0 }
set C_modelArgList {
	{ xk_fifo_V int 64 regular {fifo 0 volatile }  }
	{ xk_data int 64 regular {axi_s 1 volatile  { xk Data } }  }
	{ xk_last int 1 regular {axi_s 1 volatile  { xk Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "xk_fifo_V", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "xk_data", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "xk_last", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ xk_fifo_V_dout sc_in sc_lv 64 signal 0 } 
	{ xk_fifo_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ xk_fifo_V_read sc_out sc_logic 1 signal 0 } 
	{ xk_TDATA sc_out sc_lv 64 signal 1 } 
	{ xk_TVALID sc_out sc_logic 1 outvld 2 } 
	{ xk_TREADY sc_in sc_logic 1 outacc 2 } 
	{ xk_TLAST sc_out sc_lv 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "xk_fifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "xk_fifo_V", "role": "dout" }} , 
 	{ "name": "xk_fifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xk_fifo_V", "role": "empty_n" }} , 
 	{ "name": "xk_fifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xk_fifo_V", "role": "read" }} , 
 	{ "name": "xk_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "xk_data", "role": "" }} , 
 	{ "name": "xk_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "xk_last", "role": "D" }} , 
 	{ "name": "xk_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "xk_last", "role": "Y" }} , 
 	{ "name": "xk_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "xk_last", "role": "" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
		"Port" : [
			{"Name" : "xk_fifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "xk_fifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xk_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "xk_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xk_last", "Type" : "Axis", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	Loop_l_wr_xk_proc29 {
		xk_fifo_V {Type I LastRead 2 FirstWrite -1}
		xk_data {Type O LastRead -1 FirstWrite 2}
		xk_last {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1027", "Max" : "1027"}
	, {"Name" : "Interval", "Min" : "1027", "Max" : "1027"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	xk_fifo_V { ap_fifo {  { xk_fifo_V_dout fifo_data 0 64 }  { xk_fifo_V_empty_n fifo_status 0 1 }  { xk_fifo_V_read fifo_update 1 1 } } }
	xk_data { axis {  { xk_TDATA out_data 1 64 } } }
	xk_last { axis {  { xk_TVALID out_vld 1 1 }  { xk_TREADY out_acc 0 1 }  { xk_TLAST out_data 1 1 } } }
}
