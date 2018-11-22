
proc init {cellpath otherInfo } {
# cell initialization here
# Not needed, can be removed
set paramList "C_S_AXI_ACLK_FREQ_HZ_d"
set cell_handle [get_bd_cells $cellpath]
bd::mark_propagate_only $cell_handle $paramList
#set clk_pin_handle [get_bd_pins $cellpath/s_axi_aclk]
#set_property CONFIG.FREQ_HZ 100000000 $clk_pin_handle

#set paramList_1 "C_EXTERNAL_XIN_CLK_HZ_d"
##set cell_handle_1 [get_bd_cells $cellpath]
#bd::mark_propagate_only $cell_handle $paramList_1
#set clk_pin_handle [get_bd_pins $cellpath/xin]
#set_property CONFIG.FREQ_HZ_1 100000000 $clk_pin_handle
}

proc post_config_ip {cellpath otherInfo } {
# Any updates to interface properties based on user configuration
# Not needed, can be removed
}

proc post_propagate {cellpath otherInfo } {
    set cell_handle [get_bd_cells $cellpath]
    ##set intf_handle [get_bd_intf_pins $cellpath/aclk]
   
    ## Assign AXI clock frequency to parameter 
    set clk_pin_handle [get_bd_pins $cellpath/s_axi_aclk]
    set freq [get_property CONFIG.FREQ_HZ $clk_pin_handle]
    if { $freq == "" } {
      set_property MSG.ERROR "Please connect a valid clock signal to s_axi_aclk" $cell_handle
    } else {
      set freq_Hz [expr int($freq)] 
      set freq_MHz [expr $freq_Hz/1000000.0]
      set_property CONFIG.C_S_AXI_ACLK_FREQ_HZ_d $freq_MHz $cell_handle
    }

 #   set cell_handle_1 [get_bd_cells $cellpath]
    ##set intf_handle [get_bd_intf_pins $cellpath/aclk]
   
#    set ip [get_bd_cells $cellpath]
#     set xin_sel [get_property CONFIG.C_HAS_EXTERNAL_XIN $ip]
#    if { $xin_sel == 1} {
#    ## Assign AXI clock frequency to parameter 
#    set clk_pin_handle_1 [get_bd_pins $cellpath/xin]
#    set freq_1 [get_property CONFIG.FREQ_HZ $clk_pin_handle_1]
#    if { $freq_1 == "" } {
#      set_property MSG.ERROR "The AXI Uart Lite AXI CLOCK Frequency is not propagated from AXI Interface" $cell_handle
#    } else {
#      set freq_Hz_1 [expr int($freq_1)] 
#      set freq_MHz_1 [expr $freq_Hz_1/1000000]
#      set_property CONFIG.C_EXTERNAL_XIN_CLK_HZ_d $freq_MHz_1 $cell_handle
#    }
#    # standard parameter propagation here
#    }
}
proc propagate {cellpath otherInfo } {
# Not needed, can be removed
}
