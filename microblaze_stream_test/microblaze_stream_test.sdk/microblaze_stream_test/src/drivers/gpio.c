/*
 * gpio.c
 *
 *  Created on: Jun 28, 2019
 *      Author: Marandi Group B241
 */

#include "gpio.h"
#include "xgpio.h"

u8 GPIO_PREV_STATE[2];

void gpio_init()
{
	if (XGpio_Initialize(&Gpio, GPIO_EXAMPLE_DEVICE_ID) == XST_SUCCESS)
	{
		debug_print("GPIO init success!");
	}
	else
	{
		debug_print("GPIO init failed!");
	}

	GPIO_PREV_STATE[0] = 0x0;
	GPIO_PREV_STATE[1] = 0x0;

	//set channel 1 and 2 to be all outputs
	XGpio_SetDataDirection(&Gpio, 1, 0x00);
	XGpio_SetDataDirection(&Gpio, 2, 0x00);
	//turn off the mux pin
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0);
	//assert valid and not ready
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0);
	gpio_set_pin(RF_BANK, RF_TVALID_PIN, 1);

	//turn LEDs on
	gpio_set_bank(LED_BANK, 0xAA);

	GPIO_PREV_STATE[0] = 0xFF;
	GPIO_PREV_STATE[1] = 0x03;
}

void gpio_set_pin(u8 bank, u8 bit, u8 value)
{
	if(bank > 2 || bank < 1 || bit > 7 || bit < 0)
	{
		return;
	}
	u8 new_bank_value;
	if(value){
		new_bank_value = GPIO_PREV_STATE[bank-1] | (0x01 << bit);
	}
	else
	{
		new_bank_value = GPIO_PREV_STATE[bank-1] & ~(0x01 << bit);
	}

	XGpio_DiscreteWrite(&Gpio, bank, new_bank_value);
	GPIO_PREV_STATE[bank-1] = new_bank_value;
}
void gpio_set_bank(u8 bank, u8 value)
{
	if(bank > 2 || bank < 1)
	{
		return;
	}
	XGpio_DiscreteWrite(&Gpio, bank, value);
	GPIO_PREV_STATE[bank-1] = value;

}

void gpio_write_repeat_cycles(u32 cycles)
{
	for(int i = 0; i < 32; i++)
	{
		//Set the output to the correct bit
		u8 current_bit = (cycles & (1 << i)) == 0 ? 0 : 1;
		gpio_set_pin(RF_BANK, SDATA_PIN, current_bit);

		//cycle the serial clock
		gpio_set_pin(RF_BANK, SCLK_PIN, 0x01);
		usleep(1);
		gpio_set_pin(RF_BANK, SCLK_PIN, 0x00);

	}
}
