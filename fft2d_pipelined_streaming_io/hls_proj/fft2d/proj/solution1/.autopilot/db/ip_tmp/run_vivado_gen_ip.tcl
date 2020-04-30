create_project prj -part xczu7ev-ffvc1156-2-e -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/erhan/workspace/Xilinx/Vivado_HLS_2019.1/fft2d/proj/solution1/syn/vhdl/fft_configuration_s_core_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips fft_configuration_s_core]]
}
source "/home/erhan/workspace/Xilinx/Vivado_HLS_2019.1/fft2d/proj/solution1/syn/vhdl/fft_configuration_1_core_ip.tcl"
if {[regexp -nocase {2015\.3.*} $vivado_ver match] || [regexp -nocase {2016\.1.*} $vivado_ver match]} {
    extract_files -base_dir "./prjsrcs/sources_1/ip" [get_files -all -of [get_ips fft_configuration_1_core]]
}
