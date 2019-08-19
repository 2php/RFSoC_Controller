/*
 * gpio.c
 *
 *  Created on: Jun 28, 2019
 *      Author: Marandi Group B241
 */

#include "gpio.h"
#include "xgpio.h"

u16 RF_PREV_STATE;

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

	RF_PREV_STATE = 0x0000;

	//set channel 1 and 2 to be all outputs
	XGpio_SetDataDirection(&Gpio, 1, 0x00);
	XGpio_SetDataDirection(&Gpio, 2, 0x0000);



	//turn off everything on the RF bank
	gpio_set_bank(RF_BANK, 0x0000);

}

void gpio_set_pin(u8 bank, u8 bit, u8 value)
{
	if(bank != RF_BANK || bit > 15 || bit < 0)
	{
		return;
	}
	u16 new_bank_value;
	if(value){
		new_bank_value = RF_PREV_STATE | (0x01 << bit);
	}
	else
	{
		new_bank_value = RF_PREV_STATE & ~(0x01 << bit);
	}

	XGpio_DiscreteWrite(&Gpio, bank, new_bank_value);
	RF_PREV_STATE = new_bank_value;
}
void gpio_set_bank(u8 bank, u16 value)
{
	if(bank != RF_BANK)
	{
		return;
	}
	XGpio_DiscreteWrite(&Gpio, bank, value);
	RF_PREV_STATE = value;

}

void gpio_write_repeat_cycles(u32 value)
{
	for(int i = 0; i < 32; i++)
	{
		//Set the output to the correct bit
		u8 current_bit = (value & (1 << i)) == 0 ? 0 : 1;
		gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
		//cycle the cycles sclk
		gpio_set_pin(RF_BANK, CYCLES_SCLK, 0x01);
		gpio_set_pin(RF_BANK, CYCLES_SCLK, 0x00);
	}
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

void gpio_set_leds(u8 value)
{
	XGpio_DiscreteWrite(&Gpio, LED_BANK, value);
}

void gpio_select_channel(u8 c)
{
	for(int i = 0; i < 16; i++)
	{
		//If the channel matches, shift in a 1 to select it
		if(i == c)
		{
			gpio_set_pin(RF_BANK, LOCKING_SDATA, 0x01);
		}
		else
		{
			gpio_set_pin(RF_BANK, LOCKING_SDATA, 0x00);
		}

		//cycle the channel select clock
		gpio_set_pin(RF_BANK, CHANNEL_SELECT_SCLK, 0x01);
		gpio_set_pin(RF_BANK, CHANNEL_SELECT_SCLK, 0x00);
	}
}
