-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 21 11:55:54 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/james/fpga_projects/rfsoc_test/rfsoc_test.srcs/sources_1/bd/top_level/ip/top_level_RFSoC_Controller_0_0/top_level_RFSoC_Controller_0_0_stub.vhdl
-- Design      : top_level_RFSoC_Controller_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_RFSoC_Controller_0_0 is
  Port ( 
    clk_in : in STD_LOGIC;
    reset : in STD_LOGIC;
    fire_clk_out : out STD_LOGIC;
    fire_clk_in : in STD_LOGIC;
    arm : in STD_LOGIC;
    fire : in STD_LOGIC;
    wave_reg_sclk : in STD_LOGIC;
    wave_reg_pclk : in STD_LOGIC;
    wave_reg_data_in : in STD_LOGIC;
    wave_reg_cycle : in STD_LOGIC;
    delay_reg_sclk : in STD_LOGIC;
    delay_reg_data_in : in STD_LOGIC;
    idle_reg_sclk : in STD_LOGIC;
    idle_reg_data_in : in STD_LOGIC;
    ch_0_data : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );

end top_level_RFSoC_Controller_0_0;

architecture stub of top_level_RFSoC_Controller_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in,reset,fire_clk_out,fire_clk_in,arm,fire,wave_reg_sclk,wave_reg_pclk,wave_reg_data_in,wave_reg_cycle,delay_reg_sclk,delay_reg_data_in,idle_reg_sclk,idle_reg_data_in,ch_0_data[255:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "RFSoC_Controller,Vivado 2019.1";
begin
end;
