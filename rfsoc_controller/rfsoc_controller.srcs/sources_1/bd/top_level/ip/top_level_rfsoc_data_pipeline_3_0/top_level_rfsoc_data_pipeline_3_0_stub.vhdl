-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Wed Jul 10 18:30:40 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top top_level_rfsoc_data_pipeline_3_0 -prefix
--               top_level_rfsoc_data_pipeline_3_0_ top_level_rfsoc_data_pipeline_2_0_stub.vhdl
-- Design      : top_level_rfsoc_data_pipeline_2_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_rfsoc_data_pipeline_3_0 is
  Port ( 
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    count_val_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ext_trigger_0 : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    is_locking : in STD_LOGIC;
    m_axis_0_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axis_0_tready : in STD_LOGIC;
    m_axis_0_tvalid : out STD_LOGIC;
    microblaze_clk : in STD_LOGIC;
    microblaze_resetn : in STD_LOGIC;
    pipeline_active : out STD_LOGIC;
    rf_clock : in STD_LOGIC;
    rf_resetn : in STD_LOGIC
  );

end top_level_rfsoc_data_pipeline_3_0;

architecture stub of top_level_rfsoc_data_pipeline_3_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "S_AXIS_0_tdata[31:0],S_AXIS_0_tready,S_AXIS_0_tvalid,count_val_in_0[31:0],ext_trigger_0,gpio_in[7:0],is_locking,m_axis_0_tdata[255:0],m_axis_0_tready,m_axis_0_tvalid,microblaze_clk,microblaze_resetn,pipeline_active,rf_clock,rf_resetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rfsoc_data_pipeline,Vivado 2019.1";
begin
end;
