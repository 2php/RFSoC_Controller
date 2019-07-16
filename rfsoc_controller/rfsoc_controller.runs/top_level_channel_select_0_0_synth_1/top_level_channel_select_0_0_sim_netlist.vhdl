-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Jul 15 10:44:47 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_channel_select_0_0_sim_netlist.vhdl
-- Design      : top_level_channel_select_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_shift_register is
  port (
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    mb_clk : in STD_LOGIC;
    mb_reset : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_shift_register;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_shift_register is
  signal \^q\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \data_out[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_out[0]_i_2_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC;
begin
  Q(15 downto 0) <= \^q\(15 downto 0);
\data_out[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gpio_in(1),
      I1 => state,
      O => \data_out[0]_i_1_n_0\
    );
\data_out[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mb_reset,
      O => \data_out[0]_i_2_n_0\
    );
\data_out_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(1),
      Q => \^q\(0)
    );
\data_out_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(11),
      Q => \^q\(10)
    );
\data_out_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(12),
      Q => \^q\(11)
    );
\data_out_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(13),
      Q => \^q\(12)
    );
\data_out_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(14),
      Q => \^q\(13)
    );
\data_out_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(15),
      Q => \^q\(14)
    );
\data_out_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => gpio_in(0),
      Q => \^q\(15)
    );
\data_out_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(2),
      Q => \^q\(1)
    );
\data_out_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(3),
      Q => \^q\(2)
    );
\data_out_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(4),
      Q => \^q\(3)
    );
\data_out_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(5),
      Q => \^q\(4)
    );
\data_out_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(6),
      Q => \^q\(5)
    );
\data_out_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(7),
      Q => \^q\(6)
    );
\data_out_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(8),
      Q => \^q\(7)
    );
\data_out_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(9),
      Q => \^q\(8)
    );
\data_out_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => \data_out[0]_i_1_n_0\,
      CLR => \data_out[0]_i_2_n_0\,
      D => \^q\(10),
      Q => \^q\(9)
    );
state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mb_clk,
      CE => '1',
      CLR => \data_out[0]_i_2_n_0\,
      D => gpio_in(1),
      Q => state
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_channel_select is
  port (
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    mb_clk : in STD_LOGIC;
    mb_reset : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_channel_select;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_channel_select is
begin
sr: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_shift_register
     port map (
      Q(15 downto 0) => Q(15 downto 0),
      gpio_in(1 downto 0) => gpio_in(1 downto 0),
      mb_clk => mb_clk,
      mb_reset => mb_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    mb_clk : in STD_LOGIC;
    mb_reset : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0 : out STD_LOGIC;
    ch1 : out STD_LOGIC;
    ch2 : out STD_LOGIC;
    ch3 : out STD_LOGIC;
    ch4 : out STD_LOGIC;
    ch5 : out STD_LOGIC;
    ch6 : out STD_LOGIC;
    ch7 : out STD_LOGIC;
    ch8 : out STD_LOGIC;
    ch9 : out STD_LOGIC;
    ch10 : out STD_LOGIC;
    ch11 : out STD_LOGIC;
    ch12 : out STD_LOGIC;
    ch13 : out STD_LOGIC;
    ch14 : out STD_LOGIC;
    ch15 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "top_level_channel_select_0_0,channel_select,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "channel_select,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of mb_clk : signal is "xilinx.com:signal:clock:1.0 mb_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of mb_clk : signal is "XIL_INTERFACENAME mb_clk, ASSOCIATED_RESET mb_reset, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of mb_reset : signal is "xilinx.com:signal:reset:1.0 mb_reset RST";
  attribute X_INTERFACE_PARAMETER of mb_reset : signal is "XIL_INTERFACENAME mb_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_channel_select
     port map (
      Q(15) => ch15,
      Q(14) => ch14,
      Q(13) => ch13,
      Q(12) => ch12,
      Q(11) => ch11,
      Q(10) => ch10,
      Q(9) => ch9,
      Q(8) => ch8,
      Q(7) => ch7,
      Q(6) => ch6,
      Q(5) => ch5,
      Q(4) => ch4,
      Q(3) => ch3,
      Q(2) => ch2,
      Q(1) => ch1,
      Q(0) => ch0,
      gpio_in(1) => gpio_in(9),
      gpio_in(0) => gpio_in(4),
      mb_clk => mb_clk,
      mb_reset => mb_reset
    );
end STRUCTURE;
