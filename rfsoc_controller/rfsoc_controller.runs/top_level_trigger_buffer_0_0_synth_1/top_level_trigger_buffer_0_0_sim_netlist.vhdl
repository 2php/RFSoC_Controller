-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Jul 15 10:43:50 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_trigger_buffer_0_0_sim_netlist.vhdl
-- Design      : top_level_trigger_buffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer is
  port (
    trigger_out : out STD_LOGIC;
    clk : in STD_LOGIC;
    trigger_in : in STD_LOGIC;
    pipeline_active_in_13 : in STD_LOGIC;
    pipeline_active_in_11 : in STD_LOGIC;
    pipeline_active_in_9 : in STD_LOGIC;
    pipeline_active_in_7 : in STD_LOGIC;
    pipeline_active_in_15 : in STD_LOGIC;
    pipeline_active_in_1 : in STD_LOGIC;
    pipeline_active_in_12 : in STD_LOGIC;
    pipeline_active_in_6 : in STD_LOGIC;
    pipeline_active_in_14 : in STD_LOGIC;
    pipeline_active_in_4 : in STD_LOGIC;
    pipeline_active_in_8 : in STD_LOGIC;
    pipeline_active_in_2 : in STD_LOGIC;
    pipeline_active_in_0 : in STD_LOGIC;
    pipeline_active_in_3 : in STD_LOGIC;
    pipeline_active_in_10 : in STD_LOGIC;
    pipeline_active_in_5 : in STD_LOGIC;
    reset : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer is
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal count : STD_LOGIC;
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count[0]_i_3_n_0\ : STD_LOGIC;
  signal \count[0]_i_4_n_0\ : STD_LOGIC;
  signal \count[0]_i_5_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \count_reg[0]_i_1_n_13\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_14\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_15\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \^trigger_out\ : STD_LOGIC;
  signal trigger_out_i_1_n_0 : STD_LOGIC;
  signal trigger_out_i_2_n_0 : STD_LOGIC;
  signal trigger_out_i_3_n_0 : STD_LOGIC;
  signal trigger_out_i_4_n_0 : STD_LOGIC;
  signal trigger_out_i_5_n_0 : STD_LOGIC;
  signal trigger_out_i_6_n_0 : STD_LOGIC;
  signal trigger_out_i_7_n_0 : STD_LOGIC;
  signal \NLW_count_reg[0]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_count_reg[0]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "state_wait_trigger:001,state_trigger:010,state_cleanup:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "state_wait_trigger:001,state_trigger:010,state_cleanup:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "state_wait_trigger:001,state_trigger:010,state_cleanup:100,";
begin
  trigger_out <= \^trigger_out\;
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2FFF22222222222"
    )
        port map (
      I0 => count,
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      I3 => trigger_in,
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      I5 => \FSM_onehot_state[2]_i_3_n_0\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(2),
      I2 => count_reg(1),
      O => \FSM_onehot_state[2]_i_2_n_0\
    );
\FSM_onehot_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => trigger_out_i_7_n_0,
      I1 => trigger_out_i_6_n_0,
      I2 => trigger_out_i_5_n_0,
      I3 => trigger_out_i_4_n_0,
      O => \FSM_onehot_state[2]_i_3_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[2]_i_1_n_0\,
      D => \FSM_onehot_state_reg_n_0_[2]\,
      PRE => trigger_out_i_2_n_0,
      Q => \FSM_onehot_state_reg_n_0_[0]\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[2]_i_1_n_0\,
      CLR => trigger_out_i_2_n_0,
      D => \FSM_onehot_state_reg_n_0_[0]\,
      Q => count
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[2]_i_1_n_0\,
      CLR => trigger_out_i_2_n_0,
      D => count,
      Q => \FSM_onehot_state_reg_n_0_[2]\
    );
\count[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(2),
      I2 => count_reg(1),
      O => \count[0]_i_2_n_0\
    );
\count[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => count_reg(1),
      I1 => count_reg(2),
      I2 => count_reg(3),
      O => \count[0]_i_3_n_0\
    );
\count[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => count_reg(1),
      I1 => count_reg(2),
      I2 => count_reg(3),
      O => \count[0]_i_4_n_0\
    );
\count[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0015"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => count_reg(1),
      I2 => count_reg(2),
      I3 => count_reg(3),
      O => \count[0]_i_5_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_1_n_15\,
      Q => \count_reg_n_0_[0]\
    );
\count_reg[0]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 4) => \NLW_count_reg[0]_i_1_CO_UNCONNECTED\(7 downto 4),
      CO(3) => \count_reg[0]_i_1_n_4\,
      CO(2) => \NLW_count_reg[0]_i_1_CO_UNCONNECTED\(2),
      CO(1) => \count_reg[0]_i_1_n_6\,
      CO(0) => \count_reg[0]_i_1_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => \count[0]_i_2_n_0\,
      O(7 downto 3) => \NLW_count_reg[0]_i_1_O_UNCONNECTED\(7 downto 3),
      O(2) => \count_reg[0]_i_1_n_13\,
      O(1) => \count_reg[0]_i_1_n_14\,
      O(0) => \count_reg[0]_i_1_n_15\,
      S(7 downto 3) => B"00001",
      S(2) => \count[0]_i_3_n_0\,
      S(1) => \count[0]_i_4_n_0\,
      S(0) => \count[0]_i_5_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => count,
      CLR => trigger_out_i_2_n_0,
      D => \count_reg[0]_i_1_n_14\,
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
      D => \count_reg[0]_i_1_n_13\,
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
      D => \count_reg[0]_i_1_n_4\,
      Q => count_reg(3)
    );
trigger_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABBBFFFFAAAAAAAA"
    )
        port map (
      I0 => trigger_out_i_3_n_0,
      I1 => count_reg(3),
      I2 => count_reg(2),
      I3 => count_reg(1),
      I4 => count,
      I5 => \^trigger_out\,
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
trigger_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => trigger_out_i_4_n_0,
      I1 => trigger_out_i_5_n_0,
      I2 => trigger_out_i_6_n_0,
      I3 => trigger_out_i_7_n_0,
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      I5 => trigger_in,
      O => trigger_out_i_3_n_0
    );
trigger_out_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pipeline_active_in_15,
      I1 => pipeline_active_in_1,
      I2 => pipeline_active_in_12,
      I3 => pipeline_active_in_6,
      O => trigger_out_i_4_n_0
    );
trigger_out_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pipeline_active_in_13,
      I1 => pipeline_active_in_11,
      I2 => pipeline_active_in_9,
      I3 => pipeline_active_in_7,
      O => trigger_out_i_5_n_0
    );
trigger_out_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => pipeline_active_in_0,
      I1 => pipeline_active_in_3,
      I2 => pipeline_active_in_10,
      I3 => pipeline_active_in_5,
      O => trigger_out_i_6_n_0
    );
trigger_out_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pipeline_active_in_14,
      I1 => pipeline_active_in_4,
      I2 => pipeline_active_in_8,
      I3 => pipeline_active_in_2,
      O => trigger_out_i_7_n_0
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
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    trigger_in : in STD_LOGIC;
    pipeline_active_in_0 : in STD_LOGIC;
    pipeline_active_in_1 : in STD_LOGIC;
    pipeline_active_in_2 : in STD_LOGIC;
    pipeline_active_in_3 : in STD_LOGIC;
    pipeline_active_in_4 : in STD_LOGIC;
    pipeline_active_in_5 : in STD_LOGIC;
    pipeline_active_in_6 : in STD_LOGIC;
    pipeline_active_in_7 : in STD_LOGIC;
    pipeline_active_in_8 : in STD_LOGIC;
    pipeline_active_in_9 : in STD_LOGIC;
    pipeline_active_in_10 : in STD_LOGIC;
    pipeline_active_in_11 : in STD_LOGIC;
    pipeline_active_in_12 : in STD_LOGIC;
    pipeline_active_in_13 : in STD_LOGIC;
    pipeline_active_in_14 : in STD_LOGIC;
    pipeline_active_in_15 : in STD_LOGIC;
    trigger_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "top_level_trigger_buffer_0_0,trigger_buffer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "trigger_buffer,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer
     port map (
      clk => clk,
      pipeline_active_in_0 => pipeline_active_in_0,
      pipeline_active_in_1 => pipeline_active_in_1,
      pipeline_active_in_10 => pipeline_active_in_10,
      pipeline_active_in_11 => pipeline_active_in_11,
      pipeline_active_in_12 => pipeline_active_in_12,
      pipeline_active_in_13 => pipeline_active_in_13,
      pipeline_active_in_14 => pipeline_active_in_14,
      pipeline_active_in_15 => pipeline_active_in_15,
      pipeline_active_in_2 => pipeline_active_in_2,
      pipeline_active_in_3 => pipeline_active_in_3,
      pipeline_active_in_4 => pipeline_active_in_4,
      pipeline_active_in_5 => pipeline_active_in_5,
      pipeline_active_in_6 => pipeline_active_in_6,
      pipeline_active_in_7 => pipeline_active_in_7,
      pipeline_active_in_8 => pipeline_active_in_8,
      pipeline_active_in_9 => pipeline_active_in_9,
      reset => reset,
      trigger_in => trigger_in,
      trigger_out => trigger_out
    );
end STRUCTURE;
