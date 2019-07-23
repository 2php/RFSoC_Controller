-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jul 23 12:09:31 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_rfsoc_adc_data_captu_0_0/top_level_rfsoc_adc_data_captu_0_0_stub.vhdl
-- Design      : top_level_rfsoc_adc_data_captu_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_rfsoc_adc_data_captu_0_0 is
  Port ( 
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_1_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_1_tready : in STD_LOGIC;
    M_AXIS_1_tvalid : out STD_LOGIC;
    M_AXIS_2_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_2_tready : in STD_LOGIC;
    M_AXIS_2_tvalid : out STD_LOGIC;
    M_AXIS_3_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_3_tready : in STD_LOGIC;
    M_AXIS_3_tvalid : out STD_LOGIC;
    ext_trigger : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    microblaze_clk : in STD_LOGIC;
    microblaze_reset : in STD_LOGIC;
    rf_clk : in STD_LOGIC;
    rf_reset : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC
  );

end top_level_rfsoc_adc_data_captu_0_0;

architecture stub of top_level_rfsoc_adc_data_captu_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "M_AXIS_0_tdata[31:0],M_AXIS_0_tready,M_AXIS_0_tvalid,M_AXIS_1_tdata[31:0],M_AXIS_1_tready,M_AXIS_1_tvalid,M_AXIS_2_tdata[31:0],M_AXIS_2_tready,M_AXIS_2_tvalid,M_AXIS_3_tdata[31:0],M_AXIS_3_tready,M_AXIS_3_tvalid,ext_trigger,gpio_in[15:0],microblaze_clk,microblaze_reset,rf_clk,rf_reset,s_axis_tdata[127:0],s_axis_tready,s_axis_tvalid";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rfsoc_adc_data_capture,Vivado 2019.1";
begin
end;
