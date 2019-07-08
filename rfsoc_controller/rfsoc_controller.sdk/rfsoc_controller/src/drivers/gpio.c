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

	//set channel 1 and 2 to be all outputs except the trigger pin
	XGpio_SetDataDirection(&Gpio, 1, 0x00000000);
	XGpio_SetDataDirection(&Gpio, 2, 0x80);



	//turn off everything on the RF bank
	gpio_set_bank(RF_BANK, 0x00);

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
	XGpio_DiscreteWrite(&Gpio, COUNT_BANK, cycles);
}

//returns 1 if the trigger is active
u8 gpio_read_trigger()
{
	u32 result = XGpio_DiscreteRead(&Gpio, RF_BANK);
	if(result == 0)
	{
		return 0;
	}
	return 1;
}
