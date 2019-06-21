# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "channels" -parent ${Page_0}
  ipgui::add_param $IPINST -name "delay_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "depth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "width" -parent ${Page_0}


}

proc update_PARAM_VALUE.channels { PARAM_VALUE.channels } {
	# Procedure called to update channels when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.channels { PARAM_VALUE.channels } {
	# Procedure called to validate channels
	return true
}

proc update_PARAM_VALUE.delay_width { PARAM_VALUE.delay_width } {
	# Procedure called to update delay_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.delay_width { PARAM_VALUE.delay_width } {
	# Procedure called to validate delay_width
	return true
}

proc update_PARAM_VALUE.depth { PARAM_VALUE.depth } {
	# Procedure called to update depth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.depth { PARAM_VALUE.depth } {
	# Procedure called to validate depth
	return true
}

proc update_PARAM_VALUE.width { PARAM_VALUE.width } {
	# Procedure called to update width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.width { PARAM_VALUE.width } {
	# Procedure called to validate width
	return true
}


proc update_MODELPARAM_VALUE.width { MODELPARAM_VALUE.width PARAM_VALUE.width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.width}] ${MODELPARAM_VALUE.width}
}

proc update_MODELPARAM_VALUE.depth { MODELPARAM_VALUE.depth PARAM_VALUE.depth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.depth}] ${MODELPARAM_VALUE.depth}
}

proc update_MODELPARAM_VALUE.channels { MODELPARAM_VALUE.channels PARAM_VALUE.channels } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.channels}] ${MODELPARAM_VALUE.channels}
}

proc update_MODELPARAM_VALUE.delay_width { MODELPARAM_VALUE.delay_width PARAM_VALUE.delay_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.delay_width}] ${MODELPARAM_VALUE.delay_width}
}

