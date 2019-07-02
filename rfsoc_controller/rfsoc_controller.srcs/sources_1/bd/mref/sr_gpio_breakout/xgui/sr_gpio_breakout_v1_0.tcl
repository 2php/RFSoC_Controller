# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "sclk_bit" -parent ${Page_0}
  ipgui::add_param $IPINST -name "sdata_bit" -parent ${Page_0}


}

proc update_PARAM_VALUE.sclk_bit { PARAM_VALUE.sclk_bit } {
	# Procedure called to update sclk_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.sclk_bit { PARAM_VALUE.sclk_bit } {
	# Procedure called to validate sclk_bit
	return true
}

proc update_PARAM_VALUE.sdata_bit { PARAM_VALUE.sdata_bit } {
	# Procedure called to update sdata_bit when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.sdata_bit { PARAM_VALUE.sdata_bit } {
	# Procedure called to validate sdata_bit
	return true
}


proc update_MODELPARAM_VALUE.sclk_bit { MODELPARAM_VALUE.sclk_bit PARAM_VALUE.sclk_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sclk_bit}] ${MODELPARAM_VALUE.sclk_bit}
}

proc update_MODELPARAM_VALUE.sdata_bit { MODELPARAM_VALUE.sdata_bit PARAM_VALUE.sdata_bit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sdata_bit}] ${MODELPARAM_VALUE.sdata_bit}
}

