/*
 * cmd_handler.c
 *
 *  Created on: Jun 27, 2019
 *      Author: Marandi Group B241
 */
#include "cmd_handler.h"
#include "uart.h"
#include "rf.h"
#include "gpio.h"

//waits for and handles a single command
void handle_cmd()
{
	debug_print("Waiting for command...");
	u8 cmd_buff[1] = {0};
	//wait for a command to come in
	u8 led_value = 0x00;
	u32 led_counter = 0;
	while(uart_cmd_available(cmd_buff) == 0)
	{
		if(led_counter >= LED_DELAY){
			gpio_set_leds(led_value);
			led_value += 1;
			led_counter = 0;
		}
		else
		{
			led_counter += 1;
		}

	}

	gpio_set_leds(0xFF);

	//Decode the command
	switch(cmd_buff[0])
	{

	//Python command cases
	case PING_BOARD:
		uart_send_ack();
		break;
	case RF_LOAD_WAVEFORM:
		//Send an ack back to Python
		uart_send_ack();
		cmd_load_waveform();
		break;
	case RF_TRIGGER:
		rf_trigger();
		uart_send_ack();
		break;
	case RF_SET_TRIGGER_MODE:
		uart_send_ack();
		cmd_set_trigger_mode();
		break;
	case RF_SET_LOOPBACK:
		uart_send_ack();
		cmd_set_loopback();
		break;

	case RF_FLUSH_BUFFER:
		rf_flush_buffer();
		uart_send_ack();
		break;
	case RF_SET_TRIGGER:
		uart_send_ack();
		cmd_set_trigger();
		break;

	case RF_SET_LOCKING_SELECT:
		uart_send_ack();
		cmd_set_locking_select();
		break;

	case RF_SET_ADC_CYCLES:
		uart_send_ack();
		cmd_set_adc_cycles();
		break;

	case RF_READ_ADC:
		uart_send_ack();
		cmd_read_adc();
		break;

	case RF_FLUSH_ADC:
		rf_flush_adc_buffer();
		uart_send_ack();
		break;

		//Test command cases
	case PULSE_TEST:
		cmd_pulse_test();
		break;
	case SINE_TEST:
		cmd_sine_test();
		break;
	case EXT_TRIGGER_TEST:
		cmd_ext_trigger_test();
		break;
	case FLUSH_BUFFER:
		cmd_flush_buffer_test();
		break;
	case REPEAT_TEST:
		cmd_repeat_test();
		break;
	case TRIGGER_DETECT_TEST:
		cmd_trigger_detect_test();
		break;
	default:
		debug_print("Invalid command!");
	}
}

////////////////////////////////////////////
//Python command implementations////////////
////////////////////////////////////////////

void cmd_read_adc()
{
	//Send the number of bytes first
	u8 bytes[4];
	u32 num_bytes = rf_get_last_adc_cycles() * 16;
	for(int i = 0; i < 4; i++)
	{
		bytes[i] = (num_bytes >> (24 - (i*8))) & 0xFF;
	}

	uart_send(bytes, 4);

//	//allocate the buffer
//	u8* sample_buffer = malloc(num_bytes + 100);
//
//	rf_read_adc_buffer(sample_buffer, num_bytes / 2);
//
//			//Send the buffer
//			uart_send(sample_buffer, num_bytes);

	for(int i = 0; i < num_bytes; i+=16){

		u8 sample_buffer[16];
		rf_read_adc_buffer(sample_buffer, 8);

		//Send the buffer
		uart_send(sample_buffer, 16);
	}
	rf_flush_adc_buffer();
	//free the buffer
	//free(sample_buffer);
}

void cmd_set_adc_cycles()
{
	//Recieve the repeat cycles in 4 bytes with MSB first
	u8 repeat[4] = {0x00, 0x00, 0x00, 0x00};
	uart_recieve(repeat, 4);
	u32 final_repeat = (repeat[0] << 24) | (repeat[1] << 16) | (repeat[2] << 8) | repeat[3];
	rf_set_adc_cycles(final_repeat);
	//Send an ack back to Python
	uart_send_ack();
}

void cmd_set_locking_select()
{
	//Recieve 2 bytes from python as our select
	u8 bytes[2];
	uart_recieve(bytes, 2);


	//Write that as our locking waveform
	rf_set_locking_select(bytes);

	uart_send_ack();
}


void cmd_load_waveform()
{
	//Need to recieve the channel number, the channel repeat cycles, the zero cycles, the lockign waveform, and the experiment waveform


	//Get the channel number first
	u8 cn[1] = {0x00};
	uart_recieve(cn, 1);
	//Send an ack back to Python
	uart_send_ack();
	u8 channel = cn[0];

	//Recieve the repeat cycles in 4 bytes with MSB first
	u8 repeat[4] = {0x00, 0x00, 0x00, 0x00};
	uart_recieve(repeat, 4);
	u32 final_repeat = (repeat[0] << 24) | (repeat[1] << 16) | (repeat[2] << 8) | repeat[3];
	rf_set_repeat_cycles(channel, final_repeat);
	//Send an ack back to Python
	uart_send_ack();

	//Recieve the zero cycles in 4 bytes with MSB first
	u8 zeros[4] = {0x00, 0x00, 0x00, 0x00};
	uart_recieve(zeros, 4);
	//Send an ack back to Python
	u32 final_zeros = (zeros[0] << 24) | (zeros[1] << 16) | (zeros[2] << 8) | zeros[3];
	rf_set_zero_delay(channel, final_zeros);
	uart_send_ack();

	//Recieve 32 bytes from python as our locking waveform
	u8 waveform[32];
	uart_recieve(waveform, 32);
	//Write that as our locking waveform
	rf_set_locking_waveform(channel, waveform);
	uart_send_ack();

	//Recieve 32 bytes from python as our pre-waveform
	uart_recieve(waveform, 32);
	//Write that as our locking waveform
	rf_set_pre_waveform(channel, waveform);
	uart_send_ack();


	//Get the bitstream length
	u8 size[4] = {0x00, 0x00, 0x00, 0x00};
	uart_recieve(size, 4);
	//Send an ack back to Python
	uart_send_ack();
	u32 final_size = (size[0] << 24) | (size[1] << 16) | (size[2] << 8) | size[3];


	//Get the bitstream
	u8* bitstream = malloc(final_size);
	uart_recieve(bitstream, final_size);


	//write the bitstream to the selected channel
	rf_load_bitstream(bitstream, final_size, channel);
	//Send an ack back to Python

	free(bitstream);
	uart_send_ack();

}

void cmd_set_trigger_mode()
{
	//Recieve the trigger mode as a single byte
	u8 tm[1] = {0x00};
	uart_recieve(tm, 1);
	//Send an ack back to Python
	uart_send_ack();

	//Set the trigger mode
	rf_set_trigger_mode(tm[0]);
}

void cmd_set_loopback()
{
	//Recieve the loopback mode as a single byte
	u8 tm[1] = {0x00};
	uart_recieve(tm, 1);
	//Send an ack back to Python
	uart_send_ack();

	//Set the trigger mode
	rf_set_loopback(tm[0]);
}

void cmd_set_trigger()
{
	//Recieve the trigger setting in one byte
	u8 tm[1] = {0x00};
	uart_recieve(tm, 1);
	//Send an ack back to Python
	uart_send_ack();

	//Set the trigger mode
	rf_set_trigger(tm[0]);
}


//////////////////////////////////////////////////////////////////
//Testing Commands////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

void cmd_trigger_detect_test()
{
	debug_print("Waiting for trigger signal....");
	while(gpio_read_trigger() == 0);
	debug_print("Saw trigger signal!");
}


void cmd_repeat_test()
{
	debug_print("Running repeat test with 5 cycles");
	rf_repeat_test();
	debug_print("Test finished");
}

void cmd_pulse_test()
{
	u8 cmd_buff[1] = {0};
	debug_print("Performing pulse test with 1 second delay until new character received...");
	while(uart_cmd_available(cmd_buff) == 0)
	{
		rf_single_pulse_test();
		usleep(1000000);
	}
	debug_print("Pulse test ended");
}

void cmd_sine_test()
{
	debug_print("Performing sine test for 10 seconds...");
	rf_sine_test();
	//u8 cmd_buff[1] = {0};
	//while(uart_cmd_available(cmd_buff) == 0);
	//rf_flush_buffer();
	debug_print("Sine test ended");

}

void cmd_ext_trigger_test()
{
	debug_print("Loading 5 pulses into fifos...");
	rf_ext_trigger_test();
	debug_print("Pulses loaded");

}

void cmd_flush_buffer_test()
{
	debug_print("Flushing buffer for all channels");
	rf_flush_buffer();
	debug_print("Flush finished...");
}
