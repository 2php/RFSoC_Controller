-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jul  2 17:21:56 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_gpio_trigger_breakin_0_0/top_level_gpio_trigger_breakin_0_0_sim_netlist.vhdl
-- Design      : top_level_gpio_trigger_breakin_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_level_gpio_trigger_breakin_0_0 is
  port (
    trigger_in : in STD_LOGIC;
    gpio_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_level_gpio_trigger_breakin_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_level_gpio_trigger_breakin_0_0 : entity is "top_level_gpio_trigger_breakin_0_0,gpio_trigger_breakin,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of top_level_gpio_trigger_breakin_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of top_level_gpio_trigger_breakin_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of top_level_gpio_trigger_breakin_0_0 : entity is "gpio_trigger_breakin,Vivado 2019.1";
end top_level_gpio_trigger_breakin_0_0;

architecture STRUCTURE of top_level_gpio_trigger_breakin_0_0 is
  signal \^trigger_in\ : STD_LOGIC;
begin
  \^trigger_in\ <= trigger_in;
  gpio_out(7) <= \^trigger_in\;
  gpio_out(0) <= 'Z';
  gpio_out(1) <= 'Z';
  gpio_out(2) <= 'Z';
  gpio_out(3) <= 'Z';
  gpio_out(4) <= 'Z';
  gpio_out(5) <= 'Z';
  gpio_out(6) <= 'Z';
end STRUCTURE;
