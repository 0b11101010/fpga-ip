package require xilinx::board 1.0
namespace import ::xilinx::board::*
set uart_vlnv "xilinx.com:interface:uart_rtl:1.0"  
#Definitional proc to organize widgets for parameters.
set c_family [string tolower [get_project_property ARCHITECTURE]]
proc create_gui { ipview } {
    ###############################################################################################
    # BDM Demo  
    add_board_tab $ipview
    ###############################################################################################

variable c_family
	#set_property ip_complexity "simple" [ipgui::get_canvasspec -of $ipview]	
	set Component_Name [ ipgui::add_param  $ipview  -parent  $ipview -name Component_Name ]
	set Page0 [ ipgui::add_page $ipview  -name "IP Configuration" -layout horizontal]
	set C_USE_USER_PORTS [ipgui::add_param $ipview -parent $Page0 -name C_USE_USER_PORTS ]
	ipgui::add_row $ipview -parent $Page0
	set C_USE_MODEM_PORTS [ipgui::add_param $ipview -parent $Page0 -name C_USE_MODEM_PORTS ]
	ipgui::add_row $ipview -parent $Page0
	set BASE_USER [ipgui::add_param $ipview -parent $Page0 -name BASE_USER ]
	ipgui::add_row $ipview -parent $Page0
	set C_S_AXI_ACLK_FREQ_HZ_d [ipgui::add_param $ipview -parent $Page0 -name C_S_AXI_ACLK_FREQ_HZ_d]
        set AXI_ACLK_unit [ipgui::add_static_text $ipview -parent $Page0 -name AXI_ACLK_unit -text "[25-300]MHz"]
	ipgui::add_row $ipview -parent $Page0
	set C_IS_A_16550 [ipgui::add_param $ipview -parent $Page0 -name C_IS_A_16550 -widget radioGroup -layout horizontal]
	ipgui::add_row $ipview -parent $Page0
	set C_HAS_EXTERNAL_XIN [ipgui::add_param $ipview -parent $Page0 -name C_HAS_EXTERNAL_XIN -widget checkBox]
	ipgui::add_row $ipview -parent $Page0
	set C_EXTERNAL_XIN_CLK_HZ_d [ipgui::add_param $ipview -parent $Page0 -name C_EXTERNAL_XIN_CLK_HZ_d]
        set C_EXTERNAL_unit [ipgui::add_static_text $ipview -parent $Page0 -name C_EXTERNAL_unit -text "[1-150]MHz"]
	ipgui::add_row $ipview -parent $Page0
	set C_HAS_EXTERNAL_RCLK [ipgui::add_param $ipview -parent $Page0 -name C_HAS_EXTERNAL_RCLK -widget checkBox]

        set C_S_AXI_ACLK_FREQ_HZ [ipgui::add_param $ipview -name C_S_AXI_ACLK_FREQ_HZ]
        set_property visible false $C_S_AXI_ACLK_FREQ_HZ
        set C_EXTERNAL_XIN_CLK_HZ [ipgui::add_param $ipview -name C_EXTERNAL_XIN_CLK_HZ]
        set_property visible false $C_EXTERNAL_XIN_CLK_HZ
        
}
################################################################################
proc UART_BOARD_INTERFACE_updated {ipview} {
    set param_range [get_board_interface_param_range $ipview -name "UART_BOARD_INTERFACE"]
    if {[llength [split $param_range ","]] > 1} {
        set_property range $param_range [ipgui::get_paramspec  UART_BOARD_INTERFACE -of $ipview] 
    }
}
################################################################################
# End of Board Related TCL
################################################################################


# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

proc updateModel_C_FAMILY {ipview} {
variable c_family
set_property modelparam_value $c_family [ipgui::get_modelparamspec -name C_FAMILY -of $ipview]
        return true
}

proc C_USE_USER_PORTS_updated {ipview} {
	# Procedure called when C_USE_USER_PORTS is updated
	return true
}

proc validate_C_USE_USER_PORTS {ipview} {
	# Procedure called to validate C_USE_USER_PORTS
set_property visible false [ipgui::get_paramspec C_USE_USER_PORTS -of $ipview]
	return true
}

proc C_USE_MODEM_PORTS_updated {ipview} {
	# Procedure called when C_USE_MODEM_PORTS is updated
	return true
}

proc validate_C_USE_MODEM_PORTS {ipview} {
	# Procedure called to validate C_USE_MODEM_PORTS
set_property visible false [ipgui::get_paramspec C_USE_MODEM_PORTS -of $ipview]
	return true
}

proc BASE_USER_updated {ipview} {
	# Procedure called when BASE_USER is updated
	return true
}

proc validate_BASE_USER {ipview} {
	# Procedure called to validate BASE_USER
set_property visible false [ipgui::get_paramspec BASE_USER -of $ipview]
	return true
}


proc updateOf_C_S_AXI_ACLK_FREQ_HZ {ipview} {
	# Procedure called when C_S_AXI_ACLK_FREQ_HZ is updated
        set value_clk_Mhz [get_param_value C_S_AXI_ACLK_FREQ_HZ_d ]
        set val_clk_hz [expr {int($value_clk_Mhz*1000000)} ];
        set_property value $val_clk_hz [ipgui::get_paramspec C_S_AXI_ACLK_FREQ_HZ -of $ipview ]
	#return true
}

proc C_S_AXI_ACLK_FREQ_HZ_d_updated {ipview} {
	# Procedure called when PARITY is updated
updateOf_C_S_AXI_ACLK_FREQ_HZ $ipview
}


proc updateOf_C_EXTERNAL_XIN_CLK_HZ {ipview} {
	# Procedure called when C_S_AXI_ACLK_FREQ_HZ is updated
        set value_clk_Mhz [get_param_value C_EXTERNAL_XIN_CLK_HZ_d ]
        set val_clk_hz [expr {int($value_clk_Mhz*1000000)} ];
        set_property value $val_clk_hz [ipgui::get_paramspec C_EXTERNAL_XIN_CLK_HZ -of $ipview ]
	#return true
}

proc C_EXTERNAL_XIN_CLK_HZ_d_updated {ipview} {
	# Procedure called when PARITY is updated
updateOf_C_EXTERNAL_XIN_CLK_HZ $ipview
}





#proc C_S_AXI_ACLK_FREQ_HZ_updated {ipview} {
	# Procedure called when C_S_AXI_ACLK_FREQ_HZ is updated
#	return true
#}

proc validate_C_S_AXI_ACLK_FREQ_HZ {ipview} {
	# Procedure called to validate C_S_AXI_ACLK_FREQ_HZ
	return true
}

proc validate_C_S_AXI_ACLK_FREQ_HZ_d {ipview} {
	# Procedure called to validate C_S_AXI_ACLK_FREQ_HZ
	# Procedure called to validate C_S_AXI_ACLK_FREQ_HZ_d
        set AXI_CLK [get_param_value C_S_AXI_ACLK_FREQ_HZ_d ]
        if {$AXI_CLK < 25 || $AXI_CLK > 300} {
          	set_property errmsg "AXI CLK Frequency should be in 25 to 300 MHz Range" [ipgui::get_paramspec C_S_AXI_ACLK_FREQ_HZ_d -of $ipview ]
		return false
        } else {
	return true
        }
}


proc C_IS_A_16550_updated {ipview} {
	# Procedure called when C_IS_A_16550 is updated
	return true
}

proc validate_C_IS_A_16550 {ipview} {
	# Procedure called to validate C_IS_A_16550
	return true
}


# Procedure called when C_HAS_EXTERNAL_XIN is updated
proc C_HAS_EXTERNAL_XIN_updated {ipview} {
set enabled_ext_xin [get_param_value C_HAS_EXTERNAL_XIN ]
#puts "value $enabled_ext_xin";
if {$enabled_ext_xin == 0 } {
set_property value 25 [ipgui::get_paramspec C_EXTERNAL_XIN_CLK_HZ_d -of $ipview]
set_property enabled false [ipgui::get_paramspec C_EXTERNAL_XIN_CLK_HZ_d -of $ipview]
}
if {$enabled_ext_xin == 1} {
set_property value 25 [ipgui::get_paramspec C_EXTERNAL_XIN_CLK_HZ_d -of $ipview]
set_property enabled true [ipgui::get_paramspec C_EXTERNAL_XIN_CLK_HZ_d -of $ipview]
}

        return true
}

proc validate_C_HAS_EXTERNAL_XIN {ipview} {
	# Procedure called to validate C_HAS_EXTERNAL_XIN
	return true
}

proc C_HAS_EXTERNAL_RCLK_updated {ipview} {
	# Procedure called when C_HAS_EXTERNAL_RCLK is updated
	return true
}

proc validate_C_HAS_EXTERNAL_RCLK {ipview} {
	# Procedure called to validate C_HAS_EXTERNAL_RCLK
	return true
}

proc C_EXTERNAL_XIN_CLK_HZ_updated {ipview} {
	# Procedure called when C_EXTERNAL_XIN_CLK_HZ is updated
	return true
}

proc validate_C_EXTERNAL_XIN_CLK_HZ {ipview} {
	# Procedure called to validate C_EXTERNAL_XIN_CLK_HZ
	return true
}

#Procedure called to validate C_EXTERNAL_XIN_CLK_HZ
proc validate_C_EXTERNAL_XIN_CLK_HZ_d {ipview} {
set enabled_ext_xin [get_param_value C_HAS_EXTERNAL_XIN ]
set value_clk_freq [get_param_value C_S_AXI_ACLK_FREQ_HZ_d]
set val_clk_Mhz [expr {$value_clk_freq*0.5} ]
set value1_clk_freq [get_param_value C_EXTERNAL_XIN_CLK_HZ_d]
set val1_clk_Mhz [expr {int ($value1_clk_freq*1)} ]
#puts "Clock values $val_clk_Mhz and $val1_clk_Mhz";
if {$val1_clk_Mhz > $val_clk_Mhz && $enabled_ext_xin ==1 || $value1_clk_freq == 0 } {
set_property errmsg "External clock frequency must be less than half of AXI Clock frequency" [ipgui::get_paramspec C_EXTERNAL_XIN_CLK_HZ_d -of $ipview]
return false
}
     return true
}


# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

proc updateModel_C_S_AXI_ACLK_FREQ_HZ {ipview} {
        set value_clk_freq [get_param_value C_S_AXI_ACLK_FREQ_HZ ]
        #set val_clk_Mhz [expr {int($value_clk_freq*1000000)} ];
        set_property modelparam_value $value_clk_freq [ipgui::get_modelparamspec C_S_AXI_ACLK_FREQ_HZ -of $ipview ]
        return true
}


proc updateModel_C_IS_A_16550 {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
       set uart [get_param_value C_IS_A_16550]
       if {$uart == "16450"} {
       set value 0
       } else {
       set value 1
       }
      set_property modelparam_value $value [ipgui::get_modelparamspec C_IS_A_16550 -of $ipview ]
      return true
}

proc updateModel_C_HAS_EXTERNAL_XIN {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_HAS_EXTERNAL_XIN -of $ipview ]] [ipgui::get_modelparamspec C_HAS_EXTERNAL_XIN -of $ipview ]

	return true
}

proc updateModel_C_HAS_EXTERNAL_RCLK {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_HAS_EXTERNAL_RCLK -of $ipview ]] [ipgui::get_modelparamspec C_HAS_EXTERNAL_RCLK -of $ipview ]

	return true
}

proc updateModel_C_EXTERNAL_XIN_CLK_HZ {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
        set value_clk_freq [get_param_value C_EXTERNAL_XIN_CLK_HZ ]
        #set val_clk_Mhz [expr {int($value_clk_freq*1000000)} ]
        set_property modelparam_value $value_clk_freq [ipgui::get_modelparamspec C_EXTERNAL_XIN_CLK_HZ -of $ipview ]
        return true
}

#proc updateModel_C_INSTANCE {ipview} {
#        # Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
#
#        set_property modelparam_value [get_property value [ipgui::get_paramspec Component_Name -of $ipview ]] [ipgui::get_modelparamspec C_INSTANCE -of $ipview ]
#
#        return true
#}


