-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Jun 21 08:19:46 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/fpga_projects/rfsoc_output_test/rfsoc_output_test.srcs/sources_1/bd/microblaze_test_top/ip/microblaze_test_top_microblaze_mcs_0_0/microblaze_test_top_microblaze_mcs_0_0_stub.vhdl
-- Design      : microblaze_test_top_microblaze_mcs_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity microblaze_test_top_microblaze_mcs_0_0 is
  Port ( 
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UART_Interrupt : out STD_LOGIC;
    INTC_IRQ : out STD_LOGIC;
    UART_rxd : in STD_LOGIC;
    UART_txd : out STD_LOGIC;
    GPIO1_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end microblaze_test_top_microblaze_mcs_0_0;

architecture stub of microblaze_test_top_microblaze_mcs_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Clk,Reset,UART_Interrupt,INTC_IRQ,UART_rxd,UART_txd,GPIO1_tri_o[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bd_4f04,Vivado 2019.1";
begin
end;
