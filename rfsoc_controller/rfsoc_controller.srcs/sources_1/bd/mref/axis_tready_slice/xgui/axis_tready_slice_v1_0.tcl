# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "buffer_flush_bit" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ready_bit" -parent ${Page_0}
  ipgui::add_param $IPINST -name "sclk" -parent ${Page_0}
  ipgui::add_param $IPINST -name "sdata" -parent ${Page_0}
  ipgui::add_param $IPINST -name "trigger_override_bit" -parent ${Page_0}


}

proc update_PARAM_VALUE.buffer_flush_bit { PARAM_VALUE.buffer_flush_bit } {
	# Procedure called to update buffer_flush_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.buffer_flush_bit { PARAM_VALUE.buffer_flush_bit } {
	# Procedure called to validate buffer_flush_bit
	return true
}

proc update_PARAM_VALUE.ready_bit { PARAM_VALUE.ready_bit } {
	# Procedure called to update ready_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ready_bit { PARAM_VALUE.ready_bit } {
	# Procedure called to validate ready_bit
	return true
}

proc update_PARAM_VALUE.sclk { PARAM_VALUE.sclk } {
	# Procedure called to update sclk when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.sclk { PARAM_VALUE.sclk } {
	# Procedure called to validate sclk
	return true
}

proc update_PARAM_VALUE.sdata { PARAM_VALUE.sdata } {
	# Procedure called to update sdata when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.sdata { PARAM_VALUE.sdata } {
	# Procedure called to validate sdata
	return true
}

proc update_PARAM_VALUE.trigger_override_bit { PARAM_VALUE.trigger_override_bit } {
	# Procedure called to update trigger_override_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.trigger_override_bit { PARAM_VALUE.trigger_override_bit } {
	# Procedure called to validate trigger_override_bit
	return true
}


proc update_MODELPARAM_VALUE.trigger_override_bit { MODELPARAM_VALUE.trigger_override_bit PARAM_VALUE.trigger_override_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.trigger_override_bit}] ${MODELPARAM_VALUE.trigger_override_bit}
}

proc update_MODELPARAM_VALUE.ready_bit { MODELPARAM_VALUE.ready_bit PARAM_VALUE.ready_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ready_bit}] ${MODELPARAM_VALUE.ready_bit}
}

proc update_MODELPARAM_VALUE.sclk { MODELPARAM_VALUE.sclk PARAM_VALUE.sclk } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sclk}] ${MODELPARAM_VALUE.sclk}
}

proc update_MODELPARAM_VALUE.sdata { MODELPARAM_VALUE.sdata PARAM_VALUE.sdata } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sdata}] ${MODELPARAM_VALUE.sdata}
}

proc update_MODELPARAM_VALUE.buffer_flush_bit { MODELPARAM_VALUE.buffer_flush_bit PARAM_VALUE.buffer_flush_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.buffer_flush_bit}] ${MODELPARAM_VALUE.buffer_flush_bit}
}

