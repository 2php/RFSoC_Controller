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
#include "xuartlite.h"
#include <sleep.h>
#include "xrfdc.h"
#include "mb_interface.h"


/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define RFDC_DEVICE_ID 	XPAR_XRFDC_0_DEVICE_ID
#ifndef __BAREMETAL__
#define BUS_NAME        "platform"
#define RFDC_DEV_NAME    "a0000000.usp_rf_data_converter"
#endif

/**************************** Type Definitions ******************************/


/***************** Macros (Inline Functions) Definitions ********************/
#ifdef __BAREMETAL__
#define printf xil_printf
#endif
/************************** Function Prototypes *****************************/

static int SelfTestExample(u16 SysMonDeviceId);
static int CompareFabricRate(u32 SetFabricRate, u32 GetFabricRate);

/************************** Variable Definitions ****************************/

static XRFdc RFdcInst;      /* RFdc driver instance */

#define UARTLITE_DEVICE_ID	XPAR_UARTLITE_0_DEVICE_ID

XUartLite UartLite;		/* Instance of the UartLite Device */

int init_uartlite(u16 DeviceId);



#define MAX_COUNT 1000
#define BUFFER_SIZE 16

/*
 * Write 16 32-bit words as efficiently as possible.
 */
static void inline write_axis(volatile unsigned int *a)
{
    register int a0,  a1,  a2,  a3;
    register int a4,  a5,  a6,  a7;
    register int a8,  a9,  a10, a11;
    register int a12, a13, a14, a15;

    a3  = a[3];  a1  = a[1];  a2  = a[2];  a0  = a[0];
    a7  = a[7];  a5  = a[5];  a6  = a[6];  a4  = a[4];
    a11 = a[11]; a9  = a[9];  a10 = a[10]; a8  = a[8];
    a15 = a[15]; a13 = a[13]; a14 = a[14]; a12 = a[12];

    putfsl(a0,  0); putfsl(a1,  0); putfsl(a2,  0); putfsl(a3,  0);
    putfsl(a4,  0); putfsl(a5,  0); putfsl(a6,  0); putfsl(a7,  0);
    putfsl(a8,  0); putfsl(a9,  0); putfsl(a10, 0); putfsl(a11, 0);
    putfsl(a12, 0); putfsl(a13, 0); putfsl(a14, 0); putfsl(a15, 0);
}

/*
 * Read 16 32-bit words as efficiently as possible.
 */
static void inline read_axis(volatile unsigned int *a)
{
    register int a0,  a1,  a2,  a3;
    register int a4,  a5,  a6,  a7;
    register int a8,  a9,  a10, a11;
    register int a12, a13, a14, a15;

    getfsl(a0,  0); getfsl(a1,  0); getfsl(a2,  0); getfsl(a3,  0);
    getfsl(a4,  0); getfsl(a5,  0); getfsl(a6,  0); getfsl(a7,  0);
    getfsl(a8,  0); getfsl(a9,  0); getfsl(a10, 0); getfsl(a11, 0);
    getfsl(a12, 0); getfsl(a13, 0); getfsl(a14, 0); getfsl(a15, 0);

    a[3]  = a3;  a[1]  = a1;  a[2]  = a2;  a[0]  = a0;
    a[7]  = a7;  a[5]  = a5;  a[6]  = a6;  a[4]  = a4;
    a[11] = a11; a[9]  = a9;  a[10] = a10; a[8]  = a8;
    a[15] = a15; a[13] = a13; a[14] = a14; a[12] = a12;
}



int main()
{
	init_platform();

	print("Hello World\n\r");

	init_uartlite(UARTLITE_DEVICE_ID);

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

	debug_print("Writing test data over AXIS...");

	volatile unsigned int *data = malloc(sizeof(volatile unsigned int) * 16);
	for(int i = 0; i < 16; i++){
		data[i] = i;
	}

	write_axis(data);

	debug_print("Data written!");

	while(1)
	{
		write_axis(data);

	}

	cleanup_platform();
	return 0;
}


void debug_print(char* buff)
{
	print(buff);
	print("\n\r");
}


int init_uartlite(u16 DeviceId)
{
	int Status;

	/*
	 * Initialize the UartLite driver so that it is ready to use.
	 */
	Status = XUartLite_Initialize(&UartLite, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XUartLite_SelfTest(&UartLite);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


/****************************************************************************/
/**
 *
 * This function runs a test on the RFSoC data converter device using the
 * driver APIs.
 * This function does the following tasks:
 *	- Initialize the RFdc device driver instance
 *	- Set the Decoder Mode.
 *	- Get the Decoder Mode
 *	- Compare Set and Get settings
 *
 * @param	RFdcDeviceId is the XPAR_<XRFDC_instance>_DEVICE_ID value
 *		from xparameters.h.
 *
 * @return
 *		- XRFDC_SUCCESS if the example has completed successfully.
 *		- XRFDC_FAILURE if the example has failed.
 *
 * @note   	None
 *
 ****************************************************************************/
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
		//return XRFDC_FAILURE;
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
