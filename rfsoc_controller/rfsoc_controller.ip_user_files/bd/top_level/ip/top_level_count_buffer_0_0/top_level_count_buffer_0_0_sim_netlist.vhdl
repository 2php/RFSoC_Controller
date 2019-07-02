-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jul  2 14:13:40 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_count_buffer_0_0/top_level_count_buffer_0_0_sim_netlist.vhdl
-- Design      : top_level_count_buffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_level_count_buffer_0_0_count_buffer is
  port (
    gpio_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_level_count_buffer_0_0_count_buffer : entity is "count_buffer";
end top_level_count_buffer_0_0_count_buffer;

architecture STRUCTURE of top_level_count_buffer_0_0_count_buffer is
  signal \^gpio_in\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of \^gpio_in\ : signal is std.standard.true;
  signal \^s_axis_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DONT_TOUCH of \^s_axis_tdata\ : signal is std.standard.true;
begin
  \^gpio_in\(31 downto 0) <= gpio_in(31 downto 0);
  \^s_axis_tdata\(31 downto 0) <= s_axis_tdata(31 downto 0);
  gpio_out(31 downto 0) <= \^s_axis_tdata\(31 downto 0);
  m_axis_tdata(31 downto 0) <= \^gpio_in\(31 downto 0);
insti_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => s_axis_tready
    );
insti_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => m_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_level_count_buffer_0_0 is
  port (
    gpio_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_clk : in STD_LOGIC;
    s_axis_resetn : in STD_LOGIC;
    m_axis_clk : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_level_count_buffer_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_level_count_buffer_0_0 : entity is "top_level_count_buffer_0_0,count_buffer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of top_level_count_buffer_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of top_level_count_buffer_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of top_level_count_buffer_0_0 : entity is "count_buffer,Vivado 2019.1";
end top_level_count_buffer_0_0;

architecture STRUCTURE of top_level_count_buffer_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m_axis_clk : signal is "xilinx.com:signal:clock:1.0 m_axis_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m_axis_clk : signal is "XIL_INTERFACENAME m_axis_clk, ASSOCIATED_BUSIF m_axis, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  attribute dont_touch : string;
  attribute dont_touch of m_axis_tready : signal is "true";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_clk : signal is "xilinx.com:signal:clock:1.0 s_axis_clk CLK";
  attribute X_INTERFACE_PARAMETER of s_axis_clk : signal is "XIL_INTERFACENAME s_axis_clk, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET s_axis_resetn, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_resetn : signal is "xilinx.com:signal:reset:1.0 s_axis_resetn RST";
  attribute X_INTERFACE_PARAMETER of s_axis_resetn : signal is "XIL_INTERFACENAME s_axis_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_PARAMETER of s_axis_tvalid : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute dont_touch of s_axis_tvalid : signal is "true";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute dont_touch of s_axis_tdata : signal is "true";
begin
inst: entity work.top_level_count_buffer_0_0_count_buffer
     port map (
      gpio_in(31 downto 0) => gpio_in(31 downto 0),
      gpio_out(31 downto 0) => gpio_out(31 downto 0),
      m_axis_tdata(31 downto 0) => m_axis_tdata(31 downto 0),
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
