/*
 * gpio.h
 *
 *  Created on: Jun 28, 2019
 *      Author: Marandi Group B241
 */

#ifndef SRC_DRIVERS_GPIO_H_
#define SRC_DRIVERS_GPIO_H_

#include "xparameters.h"
#include "xbasic_types.h"
#include "xgpio.h"

#define GPIO_EXAMPLE_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID

#define TRIGGER_OVERRIDE_PIN 0
#define FIFO_TREADY_PIN 1
#define FIFO_MUX_PIN 2
#define LOCKING_SCLK 3
#define LOCKING_SDATA 4
#define BUFFER_FLUSH_PIN 5
#define LOCKING_SELECT_SCLK 6
#define ZERO_SCLK 7
#define CYCLES_SCLK 8
#define CHANNEL_SELECT_SCLK 9
#define PRE_WAVEFORM_SCLK 10
#define INT_TRIGGER 11
#define ADC_CYCLES 12
#define POST_DELAY 13
#define ADC_SHIFT 14

#define RF_BANK 2
#define LED_BANK 1

XGpio Gpio; /* The Instance of the GPIO Driver */


void gpio_set_pin(u8 bank, u8 bit, u8 value);
void gpio_set_bank(u8 bank, u16 value);
void gpio_write_repeat_cycles(u32 cycles);
u8 gpio_read_trigger();
void gpio_set_leds(u8 value);
void gpio_select_channel(u8 c);


#endif /* SRC_DRIVERS_GPIO_H_ */