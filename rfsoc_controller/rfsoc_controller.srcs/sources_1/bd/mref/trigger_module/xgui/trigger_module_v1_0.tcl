# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "count_cycles" -parent ${Page_0}
  ipgui::add_param $IPINST -name "gpio_trigger" -parent ${Page_0}


}

proc update_PARAM_VALUE.count_cycles { PARAM_VALUE.count_cycles } {
	# Procedure called to update count_cycles when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.count_cycles { PARAM_VALUE.count_cycles } {
	# Procedure called to validate count_cycles
	return true
}

proc update_PARAM_VALUE.gpio_trigger { PARAM_VALUE.gpio_trigger } {
	# Procedure called to update gpio_trigger when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.gpio_trigger { PARAM_VALUE.gpio_trigger } {
	# Procedure called to validate gpio_trigger
	return true
}


proc update_MODELPARAM_VALUE.count_cycles { MODELPARAM_VALUE.count_cycles PARAM_VALUE.count_cycles } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.count_cycles}] ${MODELPARAM_VALUE.count_cycles}
}

proc update_MODELPARAM_VALUE.gpio_trigger { MODELPARAM_VALUE.gpio_trigger PARAM_VALUE.gpio_trigger } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.gpio_trigger}] ${MODELPARAM_VALUE.gpio_trigger}
}

