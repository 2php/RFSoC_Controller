/*
 * rf.h
 *
 *  Created on: Jun 26, 2019
 *      Author: Marandi Group B241
 */

#ifndef SRC_DRIVERS_RF_H_
#define SRC_DRIVERS_RF_H_


#include "xrfdc.h"
#include "mb_interface.h"
#include "xparameters.h"


XRFdc RFdcInst;      /* RFdc driver instance */



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

void rf_wave_test();
void write_sample_stream(u16* samples, u16 length, u8 channel);
int CompareFabricRate(u32 SetFabricRate, u32 GetFabricRate);
void gpio_init();
void rf_pulse_test();
void rf_sine_test();
void rf_ext_trigger_test();
void rf_init();
void rf_repeat_test();


//Core defines
#define TRIGGER_CONTINUOUS 0x00
#define TRIGGER_CYCLES 0x01
#define YES 0x00
#define NO 0x01
#define NUM_CHANNELS 2


//Core functions
void rf_load_bitstream(u8* stream, u32 length, u8 channel);
void rf_set_repeat_cycles(u32 cycles);
void rf_flush_buffer();
void rf_set_trigger_mode(u8 mode);
void rf_set_loopback(u8 option);
void rf_trigger();




#endif /* SRC_DRIVERS_RF_H_ */
