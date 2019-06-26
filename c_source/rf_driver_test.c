/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include <sleep.h>
#include "xrfdc.h"

#define RFDC_DEVICE_ID 	XPAR_XRFDC_0_DEVICE_ID
#ifndef __BAREMETAL__
#define BUS_NAME        "platform"
#define RFDC_DEV_NAME    "a0000000.usp_rf_data_converter"
#endif

#ifdef __BAREMETAL__
#define printf xil_printf
#endif

static XRFdc RFdcInst;      /* RFdc driver instance */


int SelfTestExample(u16 RFdcDeviceId);
static int CompareFabricRate(u32 SetFabricRate, u32 GetFabricRate);


int main()
{
	init_platform();

	debug_print("Running RF self test...");

	if(SelfTestExample(RFDC_DEVICE_ID) == XRFDC_SUCCESS)
	{
		debug_print("Self test success!");
	}
	else
	{
		debug_print("Self test failed!");
	}

	debug_print("Checking data path...");

	if(XRFdc_IsDACDigitalPathEnabled(&RFdcInst, 0, 0))
	{
		debug_print("Data path enabled!");
	}
	else
	{
		debug_print("Data path not available!");
	}

	while(1)
	{
		debug_print("DAC active...");
		usleep(5000000);

	}

	cleanup_platform();
	return 0;
}

void debug_print(char* buff)
{
	print(buff);
	print("\n\r");
}


int SelfTestExample(u16 RFdcDeviceId)
{
	int Status;
	u16 Tile;
	u16 Block;
	XRFdc_Config *ConfigPtr;
	XRFdc *RFdcInstPtr = &RFdcInst;
	u32 SetFabricRate;
	u32 GetFabricRate;
#ifndef __BAREMETAL__
	struct metal_device *device;
	struct metal_io_region *io;
	int ret = 0;
#endif

	struct metal_init_params init_param = METAL_INIT_DEFAULTS;


	if (metal_init(&init_param)) {
		printf("ERROR: Failed to run metal initialization\n");
		return XRFDC_FAILURE;
	}

	/* Initialize the RFdc driver. */
	ConfigPtr = XRFdc_LookupConfig(RFdcDeviceId);
	if (ConfigPtr == NULL) {
		return XRFDC_FAILURE;
	}

	Status = XRFdc_CfgInitialize(RFdcInstPtr, ConfigPtr);
	if (Status != XRFDC_SUCCESS) {
		return XRFDC_FAILURE;
	}

#ifndef __BAREMETAL__
	ret = metal_device_open(BUS_NAME, RFDC_DEV_NAME, &device);
	if (ret) {
		printf("ERROR: Failed to open device a0000000.usp_rf_data_converter.\n");
		return XRFDC_FAILURE;
	}

	/* Map RFDC device IO region */
	io = metal_device_io_region(device, 0);
	if (!io) {
		printf("ERROR: Failed to map RFDC regio for %s.\n",
				device->name);
		return XRFDC_FAILURE;
	}
	RFdcInstPtr->device = device;
	RFdcInstPtr->io = io;
#endif

	SetFabricRate = 0x8;
	Tile = 0x0;
	for (Block = 0; Block <4; Block++) {
		if (XRFdc_IsDACBlockEnabled(RFdcInstPtr, Tile, Block)) {
			Status = XRFdc_SetFabWrVldWords(RFdcInstPtr, Tile, Block, SetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
			Status = XRFdc_GetFabWrVldWords(RFdcInstPtr, XRFDC_DAC_TILE,
					Tile, Block, &GetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
			Status = CompareFabricRate(SetFabricRate, GetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
		}
		SetFabricRate = 0x4;
		if (XRFdc_IsADCBlockEnabled(RFdcInstPtr, Tile, Block)) {
			if (RFdcInstPtr->ADC4GSPS == XRFDC_ADC_4GSPS) {
				if ((Block == 2) || (Block == 3))
					continue;
				else if (Block == 1) {
					if (XRFdc_IsADCBlockEnabled(RFdcInstPtr, Tile, 2) == 0)
						continue;
				}
			}
			Status = XRFdc_SetFabRdVldWords(RFdcInstPtr, Tile, Block, SetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
			Status = XRFdc_GetFabRdVldWords(RFdcInstPtr, XRFDC_ADC_TILE,
					Tile, Block, &GetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
			Status = CompareFabricRate(SetFabricRate, GetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
		}
	}

	Status = XRFdc_Reset(RFdcInstPtr, XRFDC_ADC_TILE, Tile);
	if (Status != XRFDC_SUCCESS) {
		//return XRFDC_FAILURE;
	}
	Status = XRFdc_Reset(RFdcInstPtr, XRFDC_DAC_TILE, Tile);
	if (Status != XRFDC_SUCCESS) {
		return XRFDC_FAILURE;
	}

	for (Block = 0; Block <4; Block++) {
		if (XRFdc_IsDACBlockEnabled(RFdcInstPtr, Tile, Block)) {
			Status = XRFdc_GetFabWrVldWords(RFdcInstPtr, XRFDC_DAC_TILE,
					Tile, Block, &GetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
			if (GetFabricRate == 0x8) {
				return XRFDC_FAILURE;
			}
		}
		if (XRFdc_IsADCBlockEnabled(RFdcInstPtr, Tile, Block)) {
			if (RFdcInstPtr->ADC4GSPS == XRFDC_ADC_4GSPS) {
				if ((Block == 2) || (Block == 3))
					continue;
				else if (Block == 1) {
					if (XRFdc_IsADCBlockEnabled(RFdcInstPtr, Tile, 2) == 0)
						continue;
				}
			}
			Status = XRFdc_GetFabRdVldWords(RFdcInstPtr, XRFDC_ADC_TILE,
					Tile, Block, &GetFabricRate);
			if (Status != XRFDC_SUCCESS) {
				return XRFDC_FAILURE;
			}
			if (GetFabricRate == 0x4) {
				return XRFDC_FAILURE;
			}
		}
	}

	return XRFDC_SUCCESS;
}


/****************************************************************************/
/*
 *
 * This function compares the two Fabric Rate variables and return 0 if
 * same and returns 1 if not same.
 *
 * @param	SetFabricRate Fabric Rate value set.
 * @param	GetFabricRate Fabric Rate value get.
 *
 * @return
 *			- 0 if both structures are same.
 *			- 1 if both structures are not same.
 *
 * @note		None
 *
 *****************************************************************************/
static int CompareFabricRate(u32 SetFabricRate, u32 GetFabricRate)
{
	if (SetFabricRate == GetFabricRate)
		return 0;
	else
		return 1;
}
