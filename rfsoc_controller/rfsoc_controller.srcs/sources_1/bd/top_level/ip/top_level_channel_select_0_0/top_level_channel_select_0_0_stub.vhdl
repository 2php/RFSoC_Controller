-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Jul 15 10:44:47 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_channel_select_0_0/top_level_channel_select_0_0_stub.vhdl
-- Design      : top_level_channel_select_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_channel_select_0_0 is
  Port ( 
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

end top_level_channel_select_0_0;

architecture stub of top_level_channel_select_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "mb_clk,mb_reset,gpio_in[15:0],ch0,ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8,ch9,ch10,ch11,ch12,ch13,ch14,ch15";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "channel_select,Vivado 2019.1";
begin
end;
