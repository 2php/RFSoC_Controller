//----------------------------------------------------------------------------
// Title : ROM for tile configuration
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 

`timescale 1ps/1ps

module top_level_usp_rf_data_converter_0_0_device_rom (
    aux_clk,
    data_index,
    data_out,
    addr_out,
    tile_out
  );

    input aux_clk;

    input [10:0] data_index;

    output [15:0] data_out;
    output [10:0] addr_out;
    output [2:0]  tile_out;

    reg [29:0] data;

    // The 30-bit data in the array follows the format below:
    // 29:27 |  26:24  |    23:16    |    15:0
    // Tile  |  Slice  | DRP Address |  DRP Data

    (* rom_style = "distributed" *) reg [29:0] data_array [0:288] = '{
       30'h07280280,  // SYSREF Distribution (ADC0)
       30'h0f280600,  // SYSREF Distribution (ADC1)
       30'h17288880,  // SYSREF Distribution (ADC2)
       30'h1f280700,  // SYSREF Distribution (ADC3)
       30'h27230000,  // Clock Network Control 0 (DAC0)
       30'h27240001,  // Clock Network Control 1 (DAC0)
       30'h2717002e,  // PLL FB Div (DAC0)
       30'h270c0081,  // PLL Output Divide (DAC0)
       30'h27100010,  // PLL Ref clock divide (DAC0)
       30'h27000080,  // PLL SDM CONFIG0 (DAC0)
       30'h27060111,  // PLL SDM seed (DAC0)
       30'h27070011,  // PLL SDM seed setup (DAC0)
       30'h270e0507,  // PLL ChargePump setup (DAC0)
       30'h2712ffff,  // PLL ChargePump setup (DAC0)
       30'h27137f9c,  // PLL loop filter setup (DAC0)
       30'h27140006,  // PLL loop filter setup (DAC0)
       30'h27155800,  // PLL VCO setup (DAC0)
       30'h27160008,  // PLL VCO setup (DAC0)
       30'h270a7a3e,  // PLL Coarse Frequency setup (DAC0)
       30'h270b7008,  // PLL Coarse Frequency setup (DAC0)
       30'h2711003d,  // PLL Voltage Regulator setup (DAC0)
       30'h2728ca80,  // SYSREF Distribution (DAC0)
       30'h272dffc0,  // HSCOM_PWR_MASK (DAC0)
       30'h20020810,  // DAC00 Data Width
       30'h20100001,  // DAC00 Interpolation Control
       30'h20110000,  // DAC00 Interpolation Data
       30'h20300000,  // DAC00 Inv Sinc Filter
       30'h20310040,  // DAC00 Multiband Config
       30'h20600001,  // DAC00 Decoder Control
       30'h20610001,  // DAC00 Decoder Clock Enable
       30'h20710000,  // DAC00 MC_CONFIG0
       30'h20734858,  // DAC00 MC_CONFIG2
       30'h207487c0,  // DAC00 MC_CONFIG3
       30'h2006000f,  // DAC00 FABRIC_IMR
       30'h200f0fff,  // DAC00 DATAPATH_IMR
       30'h20070008,  // DAC00 FABRIC_DEBUG
       30'h21020810,  // DAC01 Data Width
       30'h21100001,  // DAC01 Interpolation Control
       30'h21110000,  // DAC01 Interpolation Data
       30'h21300000,  // DAC01 Inv Sinc Filter
       30'h21310040,  // DAC01 Multiband Config
       30'h21600001,  // DAC01 Decoder Control
       30'h21610001,  // DAC01 Decoder Clock Enable
       30'h21710000,  // DAC01 MC_CONFIG0
       30'h21734858,  // DAC01 MC_CONFIG2
       30'h217487c0,  // DAC01 MC_CONFIG3
       30'h2106000f,  // DAC01 FABRIC_IMR
       30'h210f0fff,  // DAC01 DATAPATH_IMR
       30'h21070008,  // DAC01 FABRIC_DEBUG
       30'h22020810,  // DAC02 Data Width
       30'h22100001,  // DAC02 Interpolation Control
       30'h22110000,  // DAC02 Interpolation Data
       30'h22300000,  // DAC02 Inv Sinc Filter
       30'h22310040,  // DAC02 Multiband Config
       30'h22600001,  // DAC02 Decoder Control
       30'h22610001,  // DAC02 Decoder Clock Enable
       30'h22710000,  // DAC02 MC_CONFIG0
       30'h22734858,  // DAC02 MC_CONFIG2
       30'h227487c0,  // DAC02 MC_CONFIG3
       30'h2206000f,  // DAC02 FABRIC_IMR
       30'h220f0fff,  // DAC02 DATAPATH_IMR
       30'h22070008,  // DAC02 FABRIC_DEBUG
       30'h23020810,  // DAC03 Data Width
       30'h23100001,  // DAC03 Interpolation Control
       30'h23110000,  // DAC03 Interpolation Data
       30'h23300000,  // DAC03 Inv Sinc Filter
       30'h23310040,  // DAC03 Multiband Config
       30'h23600001,  // DAC03 Decoder Control
       30'h23610001,  // DAC03 Decoder Clock Enable
       30'h23710000,  // DAC03 MC_CONFIG0
       30'h23734858,  // DAC03 MC_CONFIG2
       30'h237487c0,  // DAC03 MC_CONFIG3
       30'h2306000f,  // DAC03 FABRIC_IMR
       30'h230f0fff,  // DAC03 DATAPATH_IMR
       30'h23070008,  // DAC03 FABRIC_DEBUG
       30'h2f230000,  // Clock Network Control 0 (DAC1)
       30'h2f240001,  // Clock Network Control 1 (DAC1)
       30'h2f17002e,  // PLL FB Div (DAC1)
       30'h2f0c0081,  // PLL Output Divide (DAC1)
       30'h2f100010,  // PLL Ref clock divide (DAC1)
       30'h2f000080,  // PLL SDM CONFIG0 (DAC1)
       30'h2f060111,  // PLL SDM seed (DAC1)
       30'h2f070011,  // PLL SDM seed setup (DAC1)
       30'h2f0e0507,  // PLL ChargePump setup (DAC1)
       30'h2f12ffff,  // PLL ChargePump setup (DAC1)
       30'h2f137f9c,  // PLL loop filter setup (DAC1)
       30'h2f140006,  // PLL loop filter setup (DAC1)
       30'h2f155800,  // PLL VCO setup (DAC1)
       30'h2f160008,  // PLL VCO setup (DAC1)
       30'h2f0a7a3e,  // PLL Coarse Frequency setup (DAC1)
       30'h2f0b7008,  // PLL Coarse Frequency setup (DAC1)
       30'h2f11003d,  // PLL Voltage Regulator setup (DAC1)
       30'h2f282400,  // SYSREF Distribution (DAC1)
       30'h2f2dffc0,  // HSCOM_PWR_MASK (DAC1)
       30'h28020810,  // DAC10 Data Width
       30'h28100001,  // DAC10 Interpolation Control
       30'h28110000,  // DAC10 Interpolation Data
       30'h28300000,  // DAC10 Inv Sinc Filter
       30'h28310040,  // DAC10 Multiband Config
       30'h28600001,  // DAC10 Decoder Control
       30'h28610001,  // DAC10 Decoder Clock Enable
       30'h28710000,  // DAC10 MC_CONFIG0
       30'h28734858,  // DAC10 MC_CONFIG2
       30'h287487c0,  // DAC10 MC_CONFIG3
       30'h2806000f,  // DAC10 FABRIC_IMR
       30'h280f0fff,  // DAC10 DATAPATH_IMR
       30'h28070008,  // DAC10 FABRIC_DEBUG
       30'h29020810,  // DAC11 Data Width
       30'h29100001,  // DAC11 Interpolation Control
       30'h29110000,  // DAC11 Interpolation Data
       30'h29300000,  // DAC11 Inv Sinc Filter
       30'h29310040,  // DAC11 Multiband Config
       30'h29600001,  // DAC11 Decoder Control
       30'h29610001,  // DAC11 Decoder Clock Enable
       30'h29710000,  // DAC11 MC_CONFIG0
       30'h29734858,  // DAC11 MC_CONFIG2
       30'h297487c0,  // DAC11 MC_CONFIG3
       30'h2906000f,  // DAC11 FABRIC_IMR
       30'h290f0fff,  // DAC11 DATAPATH_IMR
       30'h29070008,  // DAC11 FABRIC_DEBUG
       30'h2a020810,  // DAC12 Data Width
       30'h2a100001,  // DAC12 Interpolation Control
       30'h2a110000,  // DAC12 Interpolation Data
       30'h2a300000,  // DAC12 Inv Sinc Filter
       30'h2a310040,  // DAC12 Multiband Config
       30'h2a600001,  // DAC12 Decoder Control
       30'h2a610001,  // DAC12 Decoder Clock Enable
       30'h2a710000,  // DAC12 MC_CONFIG0
       30'h2a734858,  // DAC12 MC_CONFIG2
       30'h2a7487c0,  // DAC12 MC_CONFIG3
       30'h2a06000f,  // DAC12 FABRIC_IMR
       30'h2a0f0fff,  // DAC12 DATAPATH_IMR
       30'h2a070008,  // DAC12 FABRIC_DEBUG
       30'h2b020810,  // DAC13 Data Width
       30'h2b100001,  // DAC13 Interpolation Control
       30'h2b110000,  // DAC13 Interpolation Data
       30'h2b300000,  // DAC13 Inv Sinc Filter
       30'h2b310040,  // DAC13 Multiband Config
       30'h2b600001,  // DAC13 Decoder Control
       30'h2b610001,  // DAC13 Decoder Clock Enable
       30'h2b710000,  // DAC13 MC_CONFIG0
       30'h2b734858,  // DAC13 MC_CONFIG2
       30'h2b7487c0,  // DAC13 MC_CONFIG3
       30'h2b06000f,  // DAC13 FABRIC_IMR
       30'h2b0f0fff,  // DAC13 DATAPATH_IMR
       30'h2b070008,  // DAC13 FABRIC_DEBUG
       30'h37230000,  // Clock Network Control 0 (DAC2)
       30'h37240001,  // Clock Network Control 1 (DAC2)
       30'h3717002e,  // PLL FB Div (DAC2)
       30'h370c0081,  // PLL Output Divide (DAC2)
       30'h37100010,  // PLL Ref clock divide (DAC2)
       30'h37000080,  // PLL SDM CONFIG0 (DAC2)
       30'h37060111,  // PLL SDM seed (DAC2)
       30'h37070011,  // PLL SDM seed setup (DAC2)
       30'h370e0507,  // PLL ChargePump setup (DAC2)
       30'h3712ffff,  // PLL ChargePump setup (DAC2)
       30'h37137f9c,  // PLL loop filter setup (DAC2)
       30'h37140006,  // PLL loop filter setup (DAC2)
       30'h37155800,  // PLL VCO setup (DAC2)
       30'h37160008,  // PLL VCO setup (DAC2)
       30'h370a7a3e,  // PLL Coarse Frequency setup (DAC2)
       30'h370b7008,  // PLL Coarse Frequency setup (DAC2)
       30'h3711003d,  // PLL Voltage Regulator setup (DAC2)
       30'h37280980,  // SYSREF Distribution (DAC2)
       30'h372dffc0,  // HSCOM_PWR_MASK (DAC2)
       30'h30020810,  // DAC20 Data Width
       30'h30100001,  // DAC20 Interpolation Control
       30'h30110000,  // DAC20 Interpolation Data
       30'h30300000,  // DAC20 Inv Sinc Filter
       30'h30310040,  // DAC20 Multiband Config
       30'h30600001,  // DAC20 Decoder Control
       30'h30610001,  // DAC20 Decoder Clock Enable
       30'h30710000,  // DAC20 MC_CONFIG0
       30'h30734858,  // DAC20 MC_CONFIG2
       30'h307487c0,  // DAC20 MC_CONFIG3
       30'h3006000f,  // DAC20 FABRIC_IMR
       30'h300f0fff,  // DAC20 DATAPATH_IMR
       30'h30070008,  // DAC20 FABRIC_DEBUG
       30'h31020810,  // DAC21 Data Width
       30'h31100001,  // DAC21 Interpolation Control
       30'h31110000,  // DAC21 Interpolation Data
       30'h31300000,  // DAC21 Inv Sinc Filter
       30'h31310040,  // DAC21 Multiband Config
       30'h31600001,  // DAC21 Decoder Control
       30'h31610001,  // DAC21 Decoder Clock Enable
       30'h31710000,  // DAC21 MC_CONFIG0
       30'h31734858,  // DAC21 MC_CONFIG2
       30'h317487c0,  // DAC21 MC_CONFIG3
       30'h3106000f,  // DAC21 FABRIC_IMR
       30'h310f0fff,  // DAC21 DATAPATH_IMR
       30'h31070008,  // DAC21 FABRIC_DEBUG
       30'h32020810,  // DAC22 Data Width
       30'h32100001,  // DAC22 Interpolation Control
       30'h32110000,  // DAC22 Interpolation Data
       30'h32300000,  // DAC22 Inv Sinc Filter
       30'h32310040,  // DAC22 Multiband Config
       30'h32600001,  // DAC22 Decoder Control
       30'h32610001,  // DAC22 Decoder Clock Enable
       30'h32710000,  // DAC22 MC_CONFIG0
       30'h32734858,  // DAC22 MC_CONFIG2
       30'h327487c0,  // DAC22 MC_CONFIG3
       30'h3206000f,  // DAC22 FABRIC_IMR
       30'h320f0fff,  // DAC22 DATAPATH_IMR
       30'h32070008,  // DAC22 FABRIC_DEBUG
       30'h33020810,  // DAC23 Data Width
       30'h33100001,  // DAC23 Interpolation Control
       30'h33110000,  // DAC23 Interpolation Data
       30'h33300000,  // DAC23 Inv Sinc Filter
       30'h33310040,  // DAC23 Multiband Config
       30'h33600001,  // DAC23 Decoder Control
       30'h33610001,  // DAC23 Decoder Clock Enable
       30'h33710000,  // DAC23 MC_CONFIG0
       30'h33734858,  // DAC23 MC_CONFIG2
       30'h337487c0,  // DAC23 MC_CONFIG3
       30'h3306000f,  // DAC23 FABRIC_IMR
       30'h330f0fff,  // DAC23 DATAPATH_IMR
       30'h33070008,  // DAC23 FABRIC_DEBUG
       30'h3f230000,  // Clock Network Control 0 (DAC3)
       30'h3f240001,  // Clock Network Control 1 (DAC3)
       30'h3f17002e,  // PLL FB Div (DAC3)
       30'h3f0c0081,  // PLL Output Divide (DAC3)
       30'h3f100010,  // PLL Ref clock divide (DAC3)
       30'h3f000080,  // PLL SDM CONFIG0 (DAC3)
       30'h3f060111,  // PLL SDM seed (DAC3)
       30'h3f070011,  // PLL SDM seed setup (DAC3)
       30'h3f0e0507,  // PLL ChargePump setup (DAC3)
       30'h3f12ffff,  // PLL ChargePump setup (DAC3)
       30'h3f137f9c,  // PLL loop filter setup (DAC3)
       30'h3f140006,  // PLL loop filter setup (DAC3)
       30'h3f155800,  // PLL VCO setup (DAC3)
       30'h3f160008,  // PLL VCO setup (DAC3)
       30'h3f0a7a3e,  // PLL Coarse Frequency setup (DAC3)
       30'h3f0b7008,  // PLL Coarse Frequency setup (DAC3)
       30'h3f11003d,  // PLL Voltage Regulator setup (DAC3)
       30'h3f280100,  // SYSREF Distribution (DAC3)
       30'h3f2dffc0,  // HSCOM_PWR_MASK (DAC3)
       30'h38020810,  // DAC30 Data Width
       30'h38100001,  // DAC30 Interpolation Control
       30'h38110000,  // DAC30 Interpolation Data
       30'h38300000,  // DAC30 Inv Sinc Filter
       30'h38310040,  // DAC30 Multiband Config
       30'h38600001,  // DAC30 Decoder Control
       30'h38610001,  // DAC30 Decoder Clock Enable
       30'h38710000,  // DAC30 MC_CONFIG0
       30'h38734858,  // DAC30 MC_CONFIG2
       30'h387487c0,  // DAC30 MC_CONFIG3
       30'h3806000f,  // DAC30 FABRIC_IMR
       30'h380f0fff,  // DAC30 DATAPATH_IMR
       30'h38070008,  // DAC30 FABRIC_DEBUG
       30'h39020810,  // DAC31 Data Width
       30'h39100001,  // DAC31 Interpolation Control
       30'h39110000,  // DAC31 Interpolation Data
       30'h39300000,  // DAC31 Inv Sinc Filter
       30'h39310040,  // DAC31 Multiband Config
       30'h39600001,  // DAC31 Decoder Control
       30'h39610001,  // DAC31 Decoder Clock Enable
       30'h39710000,  // DAC31 MC_CONFIG0
       30'h39734858,  // DAC31 MC_CONFIG2
       30'h397487c0,  // DAC31 MC_CONFIG3
       30'h3906000f,  // DAC31 FABRIC_IMR
       30'h390f0fff,  // DAC31 DATAPATH_IMR
       30'h39070008,  // DAC31 FABRIC_DEBUG
       30'h3a020810,  // DAC32 Data Width
       30'h3a100001,  // DAC32 Interpolation Control
       30'h3a110000,  // DAC32 Interpolation Data
       30'h3a300000,  // DAC32 Inv Sinc Filter
       30'h3a310040,  // DAC32 Multiband Config
       30'h3a600001,  // DAC32 Decoder Control
       30'h3a610001,  // DAC32 Decoder Clock Enable
       30'h3a710000,  // DAC32 MC_CONFIG0
       30'h3a734858,  // DAC32 MC_CONFIG2
       30'h3a7487c0,  // DAC32 MC_CONFIG3
       30'h3a06000f,  // DAC32 FABRIC_IMR
       30'h3a0f0fff,  // DAC32 DATAPATH_IMR
       30'h3a070008,  // DAC32 FABRIC_DEBUG
       30'h3b020810,  // DAC33 Data Width
       30'h3b100001,  // DAC33 Interpolation Control
       30'h3b110000,  // DAC33 Interpolation Data
       30'h3b300000,  // DAC33 Inv Sinc Filter
       30'h3b310040,  // DAC33 Multiband Config
       30'h3b600001,  // DAC33 Decoder Control
       30'h3b610001,  // DAC33 Decoder Clock Enable
       30'h3b710000,  // DAC33 MC_CONFIG0
       30'h3b734858,  // DAC33 MC_CONFIG2
       30'h3b7487c0,  // DAC33 MC_CONFIG3
       30'h3b06000f,  // DAC33 FABRIC_IMR
       30'h3b0f0fff,  // DAC33 DATAPATH_IMR
       30'h3b070008,  // DAC33 FABRIC_DEBUG
       30'h00000000};

    //-------------------------------------------------------------------------
    // Output the tile number, address and data for the DRP writes
    // depending on the data_index input
    //-------------------------------------------------------------------------
    always @(posedge aux_clk)
    begin
      data <= data_array[data_index];
    end

    assign data_out = data[15:0];
    assign addr_out = data[26:16];
    assign tile_out = data[29:27];

endmodule
