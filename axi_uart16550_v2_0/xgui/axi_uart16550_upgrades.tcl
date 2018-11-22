namespace eval axi_uart16550_v2_0_utils {

#        proc warning_for_upgrade_from_axi_uart16550_v1_01_a {} {

#            return "Upgrading from AXI Timer core version 1.01.a to version 2.0 will provide this warning message. User need to make sure about the updates in the parameters while upgrading to the new version.\n"
#        }
	proc upgrade_from_from_axi_uart16550_v1_01_a {xciValues} {

          namespace import ::xcoUpgradeLib::*
          upvar $xciValues valueArray

          removeParameter c_instance valueArray

	  return
        }


}

