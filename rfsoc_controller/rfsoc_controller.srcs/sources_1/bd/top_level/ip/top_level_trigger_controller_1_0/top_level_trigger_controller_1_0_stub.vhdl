-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jul 16 18:36:25 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top top_level_trigger_controller_1_0 -prefix
--               top_level_trigger_controller_1_0_ top_level_trigger_controller_2_0_stub.vhdl
-- Design      : top_level_trigger_controller_2_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_trigger_controller_1_0 is
  Port ( 
    ext_trigger_in : in STD_LOGIC;
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    microblaze_clk : in STD_LOGIC;
    microblaze_reset : in STD_LOGIC;
    pipeline_active_in_0 : in STD_LOGIC;
    pipeline_active_in_1 : in STD_LOGIC;
    pipeline_active_in_2 : in STD_LOGIC;
    pipeline_active_in_3 : in STD_LOGIC;
    rf_clk : in STD_LOGIC;
    rf_reset : in STD_LOGIC;
    trigger_c0 : out STD_LOGIC;
    trigger_c1 : out STD_LOGIC;
    trigger_c2 : out STD_LOGIC;
    trigger_c3 : out STD_LOGIC
  );

end top_level_trigger_controller_1_0;

architecture stub of top_level_trigger_controller_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ext_trigger_in,gpio_in[15:0],microblaze_clk,microblaze_reset,pipeline_active_in_0,pipeline_active_in_1,pipeline_active_in_2,pipeline_active_in_3,rf_clk,rf_reset,trigger_c0,trigger_c1,trigger_c2,trigger_c3";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "trigger_controller,Vivado 2019.1";
begin
end;
