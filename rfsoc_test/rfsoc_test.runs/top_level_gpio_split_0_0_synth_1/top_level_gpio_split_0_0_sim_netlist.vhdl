-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 21 11:56:36 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_gpio_split_0_0_sim_netlist.vhdl
-- Design      : top_level_gpio_split_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    arm : out STD_LOGIC;
    fire : out STD_LOGIC;
    wave_reg_sclk : out STD_LOGIC;
    wave_reg_pclk : out STD_LOGIC;
    wave_reg_data_in : out STD_LOGIC;
    wave_reg_cycle : out STD_LOGIC;
    delay_reg_sclk : out STD_LOGIC;
    delay_reg_data_in : out STD_LOGIC;
    idle_reg_sclk : out STD_LOGIC;
    idle_reg_data_in : out STD_LOGIC;
    a_tv : out STD_LOGIC;
    dummy_reset : out STD_LOGIC;
    dummy_microblaze_reset : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "top_level_gpio_split_0_0,gpio_split,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "gpio_split,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^gpio_in\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of dummy_microblaze_reset : signal is "xilinx.com:signal:reset:1.0 dummy_microblaze_reset RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of dummy_microblaze_reset : signal is "XIL_INTERFACENAME dummy_microblaze_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of dummy_reset : signal is "xilinx.com:signal:reset:1.0 dummy_reset RST";
  attribute X_INTERFACE_PARAMETER of dummy_reset : signal is "XIL_INTERFACENAME dummy_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  \^gpio_in\(10 downto 0) <= gpio_in(10 downto 0);
  a_tv <= \^gpio_in\(10);
  arm <= \^gpio_in\(0);
  delay_reg_data_in <= \^gpio_in\(7);
  delay_reg_sclk <= \^gpio_in\(6);
  dummy_microblaze_reset <= \<const0>\;
  dummy_reset <= \<const1>\;
  fire <= \^gpio_in\(1);
  idle_reg_data_in <= \^gpio_in\(9);
  idle_reg_sclk <= \^gpio_in\(8);
  wave_reg_cycle <= \^gpio_in\(5);
  wave_reg_data_in <= \^gpio_in\(4);
  wave_reg_pclk <= \^gpio_in\(3);
  wave_reg_sclk <= \^gpio_in\(2);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
