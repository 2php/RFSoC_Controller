-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jul  2 10:04:02 2019
-- Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_axis_mux_0_0/rfsoc_data_pipeline_axis_mux_0_0_stub.vhdl
-- Design      : rfsoc_data_pipeline_axis_mux_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rfsoc_data_pipeline_axis_mux_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    s0_axis_tvalid : in STD_LOGIC;
    s0_axis_tready : out STD_LOGIC;
    s0_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s1_axis_tvalid : in STD_LOGIC;
    s1_axis_tready : out STD_LOGIC;
    s1_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    gpio_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );

end rfsoc_data_pipeline_axis_mux_0_0;

architecture stub of rfsoc_data_pipeline_axis_mux_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,s0_axis_tvalid,s0_axis_tready,s0_axis_tdata[255:0],s1_axis_tvalid,s1_axis_tready,s1_axis_tdata[255:0],gpio_in[7:0],m_axis_tdata[255:0],m_axis_tvalid,m_axis_tready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_mux,Vivado 2019.1";
begin
end;
