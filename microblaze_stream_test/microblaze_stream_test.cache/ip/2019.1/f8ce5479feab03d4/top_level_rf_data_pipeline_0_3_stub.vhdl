-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Jul  1 09:05:38 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_rf_data_pipeline_0_3_stub.vhdl
-- Design      : top_level_rf_data_pipeline_0_3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    ext_trigger_0 : in STD_LOGIC;
    gpio_in_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_0_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axis_0_tready : in STD_LOGIC;
    m_axis_0_tvalid : out STD_LOGIC;
    microblaze_clk : in STD_LOGIC;
    microblaze_resetn : in STD_LOGIC;
    rf_clk : in STD_LOGIC;
    rf_resetn : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "S_AXIS_0_tdata[31:0],S_AXIS_0_tready,S_AXIS_0_tvalid,ext_trigger_0,gpio_in_0[7:0],m_axis_0_tdata[255:0],m_axis_0_tready,m_axis_0_tvalid,microblaze_clk,microblaze_resetn,rf_clk,rf_resetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rf_data_pipeline,Vivado 2019.1";
begin
end;
