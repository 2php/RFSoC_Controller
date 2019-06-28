-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Thu Jun 27 17:04:23 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/james/fpga_projects/microblaze_stream_test/microblaze_stream_test.srcs/sources_1/bd/top_level/ip/top_level_trigger_buffer_0_0/top_level_trigger_buffer_0_0_sim_netlist.vhdl
-- Design      : top_level_trigger_buffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_level_trigger_buffer_0_0_trigger_buffer is
  port (
    trigger_out : out STD_LOGIC;
    trigger_in : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_level_trigger_buffer_0_0_trigger_buffer : entity is "trigger_buffer";
end top_level_trigger_buffer_0_0_trigger_buffer;

architecture STRUCTURE of top_level_trigger_buffer_0_0_trigger_buffer is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal count : STD_LOGIC;
  signal \count[0]_i_10_n_0\ : STD_LOGIC;
  signal \count[0]_i_11_n_0\ : STD_LOGIC;
  signal \count[0]_i_3_n_0\ : STD_LOGIC;
  signal \count[0]_i_4_n_0\ : STD_LOGIC;
  signal \count[0]_i_5_n_0\ : STD_LOGIC;
  signal \count[0]_i_6_n_0\ : STD_LOGIC;
  signal \count[0]_i_7_n_0\ : STD_LOGIC;
  signal \count[0]_i_8_n_0\ : STD_LOGIC;
  signal \count[0]_i_9_n_0\ : STD_LOGIC;
  signal \count[8]_i_2_n_0\ : STD_LOGIC;
  signal \count[8]_i_3_n_0\ : STD_LOGIC;
  signal \count[8]_i_4_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^trigger_out\ : STD_LOGIC;
  signal trigger_out_i_1_n_0 : STD_LOGIC;
  signal trigger_out_i_2_n_0 : STD_LOGIC;
  signal trigger_out_i_3_n_0 : STD_LOGIC;
  signal trigger_out_i_4_n_0 : STD_LOGIC;
  signal trigger_out_i_5_n_0 : STD_LOGIC;
  signal \NLW_count_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_count_reg[8]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_2\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "state_trigger:01,state_cleanup:10,state_wait_trigger:00,iSTATE:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "state_trigger:01,state_cleanup:10,state_wait_trigger:00,iSTATE:11";
begin
  trigger_out <= \^trigger_out\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => state(0),
      I1 => trigger_in,
      I2 => state(1),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0734"
    )
        port map (
      I0 => trigger_out_i_3_n_0,
      I1 => state(0),
      I2 => state(1),
      I3 => trigger_in,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => trigger_in,
      I1 => state(1),
      I2 => state(0),
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_sequential_state[1]_i_1_n_0\,
      CLR => trigger_out_i_2_n_0,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_sequential_state[1]_i_1_n_0\,
      CLR => trigger_out_i_2_n_0,
      D => \FSM_sequential_state[1]_i_2_n_0\,
      Q => state(1)
    );
\count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => count
    );
\count[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(1),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_10_n_0\
    );
\count[0]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => count_reg(0),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_11_n_0\
    );
\count[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => trigger_out_i_4_n_0,
      I1 => trigger_out_i_5_n_0,
      I2 => count_reg(11),
      O => \count[0]_i_3_n_0\
    );
\count[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(7),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_4_n_0\
    );
\count[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(6),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_5_n_0\
    );
\count[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(5),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_6_n_0\
    );
\count[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(4),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_7_n_0\
    );
\count[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(3),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_8_n_0\
    );
\count[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(2),
      I1 => trigger_out_i_3_n_0,
      O => \count[0]_i_9_n_0\
    );
\count[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(10),
      I1 => trigger_out_i_3_n_0,
      O => \count[8]_i_2_n_0\
    );
\count[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(9),
      I1 => trigger_out_i_3_n_0,
      O => \count[8]_i_3_n_0\
    );
\count[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => count_reg(8),
      I1 => trigger_out_i_3_n_0,
      O => \count[8]_i_4_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_15\,
      Q => count_reg(0)
    );
\count_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \count_reg[0]_i_2_n_0\,
      CO(6) => \count_reg[0]_i_2_n_1\,
      CO(5) => \count_reg[0]_i_2_n_2\,
      CO(4) => \count_reg[0]_i_2_n_3\,
      CO(3) => \count_reg[0]_i_2_n_4\,
      CO(2) => \count_reg[0]_i_2_n_5\,
      CO(1) => \count_reg[0]_i_2_n_6\,
      CO(0) => \count_reg[0]_i_2_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => \count[0]_i_3_n_0\,
      O(7) => \count_reg[0]_i_2_n_8\,
      O(6) => \count_reg[0]_i_2_n_9\,
      O(5) => \count_reg[0]_i_2_n_10\,
      O(4) => \count_reg[0]_i_2_n_11\,
      O(3) => \count_reg[0]_i_2_n_12\,
      O(2) => \count_reg[0]_i_2_n_13\,
      O(1) => \count_reg[0]_i_2_n_14\,
      O(0) => \count_reg[0]_i_2_n_15\,
      S(7) => \count[0]_i_4_n_0\,
      S(6) => \count[0]_i_5_n_0\,
      S(5) => \count[0]_i_6_n_0\,
      S(4) => \count[0]_i_7_n_0\,
      S(3) => \count[0]_i_8_n_0\,
      S(2) => \count[0]_i_9_n_0\,
      S(1) => \count[0]_i_10_n_0\,
      S(0) => \count[0]_i_11_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[8]_i_1_n_13\,
      Q => count_reg(10)
    );
\count_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[8]_i_1_n_4\,
      Q => count_reg(11)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_14\,
      Q => count_reg(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_13\,
      Q => count_reg(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_12\,
      Q => count_reg(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_11\,
      Q => count_reg(4)
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_10\,
      Q => count_reg(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_9\,
      Q => count_reg(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_2_n_8\,
      Q => count_reg(7)
    );
\count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[8]_i_1_n_15\,
      Q => count_reg(8)
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \count_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7 downto 4) => \NLW_count_reg[8]_i_1_CO_UNCONNECTED\(7 downto 4),
      CO(3) => \count_reg[8]_i_1_n_4\,
      CO(2) => \NLW_count_reg[8]_i_1_CO_UNCONNECTED\(2),
      CO(1) => \count_reg[8]_i_1_n_6\,
      CO(0) => \count_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_count_reg[8]_i_1_O_UNCONNECTED\(7 downto 3),
      O(2) => \count_reg[8]_i_1_n_13\,
      O(1) => \count_reg[8]_i_1_n_14\,
      O(0) => \count_reg[8]_i_1_n_15\,
      S(7 downto 3) => B"00001",
      S(2) => \count[8]_i_2_n_0\,
      S(1) => \count[8]_i_3_n_0\,
      S(0) => \count[8]_i_4_n_0\
    );
\count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[8]_i_1_n_14\,
      Q => count_reg(9)
    );
trigger_out_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEFF0030"
    )
        port map (
      I0 => trigger_out_i_3_n_0,
      I1 => state(1),
      I2 => trigger_in,
      I3 => state(0),
      I4 => \^trigger_out\,
      O => trigger_out_i_1_n_0
    );
trigger_out_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      O => trigger_out_i_2_n_0
    );
trigger_out_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => trigger_out_i_4_n_0,
      I1 => trigger_out_i_5_n_0,
      I2 => count_reg(11),
      O => trigger_out_i_3_n_0
    );
trigger_out_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEAAAAAAAA"
    )
        port map (
      I0 => count_reg(5),
      I1 => count_reg(2),
      I2 => count_reg(3),
      I3 => count_reg(0),
      I4 => count_reg(1),
      I5 => count_reg(4),
      O => trigger_out_i_4_n_0
    );
trigger_out_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => count_reg(8),
      I1 => count_reg(10),
      I2 => count_reg(9),
      I3 => count_reg(6),
      I4 => count_reg(7),
      O => trigger_out_i_5_n_0
    );
trigger_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => trigger_out_i_2_n_0,
      D => trigger_out_i_1_n_0,
      Q => \^trigger_out\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_level_trigger_buffer_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    trigger_in : in STD_LOGIC;
    trigger_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_level_trigger_buffer_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_level_trigger_buffer_0_0 : entity is "top_level_trigger_buffer_0_0,trigger_buffer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of top_level_trigger_buffer_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of top_level_trigger_buffer_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of top_level_trigger_buffer_0_0 : entity is "trigger_buffer,Vivado 2019.1";
end top_level_trigger_buffer_0_0;

architecture STRUCTURE of top_level_trigger_buffer_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.top_level_trigger_buffer_0_0_trigger_buffer
     port map (
      clk => clk,
      reset => reset,
      trigger_in => trigger_in,
      trigger_out => trigger_out
    );
end STRUCTURE;
