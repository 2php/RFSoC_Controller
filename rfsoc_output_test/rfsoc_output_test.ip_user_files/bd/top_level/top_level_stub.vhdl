-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Thu Jun 20 21:36:34 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/fpga_projects/rfsoc_output_test/rfsoc_output_test.srcs/sources_1/bd/top_level/top_level_stub.vhdl
-- Design      : top_level
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
  Port ( 
    app_leds_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dac0_clk_clk_n : in STD_LOGIC;
    dac0_clk_clk_p : in STD_LOGIC;
    diff_clock_rtl_clk_n : in STD_LOGIC;
    diff_clock_rtl_clk_p : in STD_LOGIC;
    sysref_in_diff_n : in STD_LOGIC;
    sysref_in_diff_p : in STD_LOGIC;
    uart2_pl_rxd : in STD_LOGIC;
    uart2_pl_txd : out STD_LOGIC;
    vout00_v_n : out STD_LOGIC;
    vout00_v_p : out STD_LOGIC
  );

end top_level;

architecture stub of top_level is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "app_leds_tri_o[7:0],dac0_clk_clk_n,dac0_clk_clk_p,diff_clock_rtl_clk_n,diff_clock_rtl_clk_p,sysref_in_diff_n,sysref_in_diff_p,uart2_pl_rxd,uart2_pl_txd,vout00_v_n,vout00_v_p";
begin
end;
