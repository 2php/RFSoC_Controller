-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Aug 23 11:14:50 2019
-- Host        : MB241LABVIEW running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top top_level_rfsoc_data_pipeline_14_0 -prefix
--               top_level_rfsoc_data_pipeline_14_0_ top_level_rfsoc_data_pipeline_0_0_stub.vhdl
-- Design      : top_level_rfsoc_data_pipeline_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_rfsoc_data_pipeline_14_0 is
  Port ( 
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tvalid : in STD_LOGIC;
    ext_trigger : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    is_selected : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axis_tready : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    microblaze_clk : in STD_LOGIC;
    microblaze_resetn : in STD_LOGIC;
    pipeline_active : out STD_LOGIC;
    rf_clock : in STD_LOGIC;
    rf_resetn : in STD_LOGIC
  );

end top_level_rfsoc_data_pipeline_14_0;

architecture stub of top_level_rfsoc_data_pipeline_14_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "S_AXIS_tdata[31:0],S_AXIS_tready,S_AXIS_tvalid,ext_trigger,gpio_in[15:0],is_selected,m_axis_tdata[255:0],m_axis_tready,m_axis_tvalid,microblaze_clk,microblaze_resetn,pipeline_active,rf_clock,rf_resetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rfsoc_data_pipeline,Vivado 2019.1";
begin
end;
