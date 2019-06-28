-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Thu Jun 27 17:00:41 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_axis_tready_slice_0_0_sim_netlist.vhdl
-- Design      : top_level_axis_tready_slice_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_tready_slice is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    clk : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    reset : in STD_LOGIC;
    ext_trigger : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_tready_slice;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_tready_slice is
  signal s_axis_tready_i_1_n_0 : STD_LOGIC;
  signal s_axis_tready_i_2_n_0 : STD_LOGIC;
begin
m_axis_tvalid_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => gpio_in(0),
      PRE => s_axis_tready_i_2_n_0,
      Q => m_axis_tvalid
    );
s_axis_tready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gpio_in(1),
      I1 => ext_trigger,
      O => s_axis_tready_i_1_n_0
    );
s_axis_tready_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      O => s_axis_tready_i_2_n_0
    );
s_axis_tready_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => s_axis_tready_i_2_n_0,
      D => s_axis_tready_i_1_n_0,
      Q => s_axis_tready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ext_trigger : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "top_level_axis_tready_slice_0_0,axis_tready_slice,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axis_tready_slice,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^s_axis_tdata\ : STD_LOGIC_VECTOR ( 255 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  attribute X_INTERFACE_PARAMETER of m_axis_tready : signal is "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_PARAMETER of s_axis_tlast : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
begin
  \^s_axis_tdata\(255 downto 0) <= s_axis_tdata(255 downto 0);
  m_axis_tdata(255 downto 0) <= \^s_axis_tdata\(255 downto 0);
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_tready_slice
     port map (
      clk => clk,
      ext_trigger => ext_trigger,
      gpio_in(1 downto 0) => gpio_in(1 downto 0),
      m_axis_tvalid => m_axis_tvalid,
      reset => reset,
      s_axis_tready => s_axis_tready
    );
end STRUCTURE;
