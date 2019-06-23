-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 21 11:56:36 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/james/fpga_projects/rfsoc_test/rfsoc_test.srcs/sources_1/bd/top_level/ip/top_level_gpio_split_0_0/top_level_gpio_split_0_0_stub.vhdl
-- Design      : top_level_gpio_split_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_gpio_split_0_0 is
  Port ( 
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    arm : out STD_LOGIC;
    fire : out STD_LOGIC;
    wave_reg_sclk : out STD_LOGIC;
    wave_reg_pclk : out STD_LOGIC;
    wave_reg_data_in : out STD_LOGIC;
    wave_reg_cycle : out STD_LOGIC;
    delay_reg_sclk : out STD_LOGIC;
    delay_reg_data_in : out STD_LOGIC;
    idle_reg_sclk : out STD_LOGIC;
    idle_reg_data_in : out STD_LOGIC;
    a_tv : out STD_LOGIC;
    dummy_reset : out STD_LOGIC;
    dummy_microblaze_reset : out STD_LOGIC
  );

end top_level_gpio_split_0_0;

architecture stub of top_level_gpio_split_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gpio_in[15:0],arm,fire,wave_reg_sclk,wave_reg_pclk,wave_reg_data_in,wave_reg_cycle,delay_reg_sclk,delay_reg_data_in,idle_reg_sclk,idle_reg_data_in,a_tv,dummy_reset,dummy_microblaze_reset";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "gpio_split,Vivado 2019.1";
begin
end;
