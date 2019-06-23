-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 21 11:54:41 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/james/fpga_projects/rfsoc_test/rfsoc_test.srcs/sources_1/bd/top_level/ip/top_level_microblaze_mcs_0_0/top_level_microblaze_mcs_0_0_stub.vhdl
-- Design      : top_level_microblaze_mcs_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_microblaze_mcs_0_0 is
  Port ( 
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    GPIO1_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    GPIO2_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end top_level_microblaze_mcs_0_0;

architecture stub of top_level_microblaze_mcs_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Clk,Reset,GPIO1_tri_o[7:0],GPIO2_tri_o[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bd_04f1,Vivado 2019.1";
begin
end;
