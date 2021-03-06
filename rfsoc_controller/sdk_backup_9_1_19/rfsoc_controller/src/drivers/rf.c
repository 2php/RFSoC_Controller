/*
 * rf.c
 *
 *  Created on: Jun 26, 2019
 *      Author: Marandi Group B241
 */

#include "rf.h"
#include "gpio.h"
#include "uart.h"

#define RF_VALID_TIME 250000

u16 sine_wave[16] = {0x8000, 0xB0FC, 0xDA82, 0xF642, 0xFFFF, 0xF642, 0xDA82, 0xB0FC, 0x8000, 0x4F04, 0x257E, 0x9BE, 0x0, 0x9BE, 0x257E, 0x4F04};
u16 t_wave[16] = {0x0, 0x2000, 0x4000, 0x6000, 0x8000, 0xA000, 0xC000, 0xE000, 0xC000, 0xA000, 0x8000, 0x6000, 0x4000, 0x2000, 0x0, 0x0};
u16 pulse[16] = {0x0, 0x7FFF, 0xFFFF, 0xFFFF, 0x7FFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
u16 zeros [16];

u8 pulse_bitstream[32] = {0x0, 0x0, 0x3F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x3F, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
u8 zeros_bitstream[32] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};

u32 last_adc_cycles;

u32 num_trigs_before_adc_readout;
u32 last_adc_shift;

u8 adc_available;


/////////////////////////////////////////////////////////////////////////
//CORE FUNCTIONS/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

//Returns 1 if available (clock is running)
u8 rf_adc_available()
{

	u8 Tile = 0x0;
	XRFdc *RFdcInstPtr = &RFdcInst;

	u8 Status = XRFdc_Reset(RFdcInstPtr, XRFDC_ADC_TILE, Tile);
	if (Status != XRFDC_SUCCESS) {
		//return XRFDC_FAILURE;
		adc_available = 0;
		return 0;
	}
	adc_available = 1;
	return 1;
}

u32 rf_get_adc_shift()
{
	return last_adc_shift;
}

//Returns 1 if adc data can be read successfully, 0 otherwise
u8 adc_data_valid()
{
	u32 num_cycles_needed = 1 << last_adc_shift;
	if(num_trigs_before_adc_readout < num_cycles_needed)
	{
		return 0;
	}
	return 1;
}

void rf_set_adc_shift(u32 value)
{
	last_adc_shift = value;
	for(int i = 0; i < 32; i++)
	{
		//Set the output to the correct bit
		u8 current_bit = (value & (1 << i)) == 0 ? 0 : 1;
		gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
		//cycle locking_sclk
		gpio_set_pin(RF_BANK, ADC_SHIFT, 0x01);
		gpio_set_pin(RF_BANK, ADC_SHIFT, 0x00);
	}
}

void rf_set_pre_waveform(u8 channel, u8* stream)
{
	gpio_select_channel(channel);

	//Stream will alway be 32 bytes long
	for(int i = 31; i >= 0; i--)
	{
		for(int j = 0; j < 8; j++){
			//Set the output to the correct bit
			u8 current_bit = (stream[i] & (1 << j)) == 0 ? 0 : 1;
			gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
			//cycle locking_sclk
			gpio_set_pin(RF_BANK, PRE_WAVEFORM_SCLK, 0x01);
			gpio_set_pin(RF_BANK, PRE_WAVEFORM_SCLK, 0x00);
		}
	}

}

void rf_set_zero_delay(u8 channel, u32 value)
{
	gpio_select_channel(channel);
	for(int i = 0; i < 32; i++)
	{
		//Set the output to the correct bit
		u8 current_bit = (value & (1 << i)) == 0 ? 0 : 1;
		gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
		//cycle locking_sclk
		gpio_set_pin(RF_BANK, ZERO_SCLK, 0x01);
		gpio_set_pin(RF_BANK, ZERO_SCLK, 0x00);
	}
}

void rf_set_locking_select(u8* bytes)
{
	//There will always be two bytes here
	for(int i = 1; i >= 0; i--)
	{
		for(int j = 0; j < 8; j++)
		{
			//Set the output to the correct bit
			u8 current_bit = (bytes[i] & (1 << j)) == 0 ? 0 : 1;
			gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
			//cycle locking_sclk
			gpio_set_pin(RF_BANK, LOCKING_SELECT_SCLK, 0x01);
			gpio_set_pin(RF_BANK, LOCKING_SELECT_SCLK, 0x00);
		}
	}
}

void rf_set_locking_waveform(u8 channel, u8* stream)
{

	gpio_select_channel(channel);
	//Stream will alway be 32 bytes long
	for(int i = 31; i >= 0; i--)
	{
		for(int j = 0; j < 8; j++){
			//Set the output to the correct bit
			u8 current_bit = (stream[i] & (1 << j)) == 0 ? 0 : 1;
			gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
			//cycle locking_sclk
			gpio_set_pin(RF_BANK, LOCKING_SCLK, 0x01);
			gpio_set_pin(RF_BANK, LOCKING_SCLK, 0x00);
		}
	}
}

void rf_set_trigger(u8 option)
{
	if(option == ON)
	{
		gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0x01);
	}
	else
	{
		gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0x00);
	}
}

void rf_load_bitstream(u8* stream, u32 length, u8 channel)
{
	//Make sure the length is correct
	if(length%32 != 0)
	{
		debug_print("ERROR: bitstream must have a length which is a multiple of 32");
	}

	//Set the mux pin to 0 so we can load data
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0);
	//Turn off buffer flush
	gpio_set_pin(RF_BANK, BUFFER_FLUSH_PIN, 0x00);
	//turn off ready
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0);

	//Loop over all DAC words (256-bit)
	for(int i = 0; i < length; i+=32)
	{
		u16 dac_word[16];
		//loop over all sample words (16-bit)
		for(int j = 0; j < 16; j++)
		{
			//get the two bytes from the stream
			u8 b0 = stream[i+(2*j)];
			u8 b1 = stream[i+(2*j)+1];

			//Make them into a sample and put it into the array
			dac_word[j] = (b0 << 8) | b1;
		}

		//write the completed word to the stream interface
		write_sample_stream(dac_word, 16, channel);
	}
}

void rf_set_repeat_cycles(u8 channel, u32 cycles)
{

	gpio_select_channel(channel);
	gpio_write_repeat_cycles(cycles);
}



void rf_flush_buffer()
{
	//Turn off trigger override and buffer flush
	gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x01);
	gpio_set_pin(RF_BANK, BUFFER_FLUSH_PIN, 0x01);
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x01);
	//turn on ready
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0x01);
	usleep(250000);
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x00);
	usleep(250000);
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0x00);
	gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x00);
	gpio_set_pin(RF_BANK, BUFFER_FLUSH_PIN, 0x00);
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x00);

	//Write the locking waveforms to 0
	for(int i = 0; i < NUM_CHANNELS; i++)
	{
		rf_set_locking_waveform(i, zeros_bitstream);
	}
	rf_flush_adc_buffer();
}

void rf_set_trigger_mode(u8 mode)
{
	if(mode == TRIGGER_CONTINUOUS)
	{
		gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x01);
	}
	else
	{
		gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x00);
	}
}

void rf_set_loopback(u8 option)
{
	if(option == YES)
	{
		gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x01);
	}
	else
	{
		gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x00);
	}
}

void rf_trigger()
{
	//empty the buffer before we capture anything
	//rf_flush_adc_buffer();
	gpio_set_pin(RF_BANK, INT_TRIGGER, 0x01);
	//usleep();
	gpio_set_pin(RF_BANK, INT_TRIGGER, 0x00);
	num_trigs_before_adc_readout++;
}

void rf_set_adc_cycles(u32 cycles)
{
	//Stream will alway be 32 bytes long
	for(int i = 0; i < 32; i++)
	{
		//Set the output to the correct bit
		u8 current_bit = (cycles & (1 << i)) == 0 ? 0 : 1;
		gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);
		//cycle locking_sclk
		gpio_set_pin(RF_BANK, ADC_CYCLES, 0x01);
		gpio_set_pin(RF_BANK, ADC_CYCLES, 0x00);

	}
	last_adc_cycles = cycles;
}

u32 rf_get_last_adc_cycles()
{
	return last_adc_cycles;
}


//Writes samples into buffer with MSB first
void rf_read_adc_buffer(u8* buffer, u32 num_samples)
{
	//If our shift isnt 0
	if(last_adc_shift != 0)
	{
		//Set it to 0 to facilitate the readout
		rf_set_adc_shift(0);
	}

	num_trigs_before_adc_readout = 0;
	//Each buffer will have 2 samples, and there are 4 buffers, so one loop through all buffers will read 8 samples
	u32 num_loops = num_samples / 8;
	u32 buffer_pos = 0;
	for(int i = 0; i < num_loops; i++)
	{
		for(int j = 0; j < 4; j++)
		{
			//Read the word from the stream
			u32 word = rf_read_stream(j);
			//Write the 4 bytes to the buffer
			buffer[buffer_pos + 0] = (word >> 24) & 0xFF;
			buffer[buffer_pos + 1] = (word >> 16) & 0xFF;
			buffer[buffer_pos + 2] = (word >> 8) & 0xFF;
			buffer[buffer_pos + 3] = word & 0xFF;
			buffer_pos += 4;
		}
	}
}

void rf_flush_adc_buffer()
{
	u32 las = last_adc_shift;
	rf_set_adc_shift(0);

	for(int i = 0; i < ADC_BUFFER_DEPTH; i++)
	{
		register int a0;
		register int a1;
		register int a2;
		register int a3;
		ngetfsl(a0,  0);
		ngetfsl(a1,  1);
		ngetfsl(a2,  2);
		ngetfsl(a3,  3);
	}
	rf_set_adc_shift(las);
}


void rf_set_post_delay(u8 channel, u32 val)
{
	gpio_select_channel(channel);

	for(int i = 0; i < 32; i++)
	{
		//Set the output to the correct bit
		u8 current_bit = (val & (1 << i)) == 0 ? 0 : 1;
		gpio_set_pin(RF_BANK, LOCKING_SDATA, current_bit);

		//cycle the post clock
		gpio_set_pin(RF_BANK, POST_DELAY, 0x01);
		gpio_set_pin(RF_BANK, POST_DELAY, 0x00);
	}
}

/////////////////////////////////////////////////////////////////////////
//TESTING FUNCTIONS//////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void rf_repeat_test()
{
	rf_flush_buffer();

	//set the repeat cycles
	//rf_set_repeat_cycles(15);


	//load the bitstream to all channels
	for(int i = 0; i < NUM_CHANNELS; i++)
	{
		//Load some zeros
		rf_load_bitstream(zeros_bitstream, 32, i);
		//Load the pulse
		rf_load_bitstream(pulse_bitstream, 32, i);
		//Load some zeros
		rf_load_bitstream(zeros_bitstream, 32, i);
	}


	//set the trigger mode
	rf_set_trigger_mode(TRIGGER_CYCLES);

	//set up the MUX
	rf_set_loopback(YES);

	//trigger once
	rf_trigger();

	//flush the buffers
	rf_flush_buffer();

	rf_set_loopback(NO);



}

void rf_single_pulse_test()
{
	rf_flush_buffer();

	//load the bitstream to all channels
	for(int i = 0; i < NUM_CHANNELS; i++)
	{
		//Load some zeros
		rf_load_bitstream(zeros_bitstream, 32, i);
		//Load the pulse
		rf_load_bitstream(pulse_bitstream, 32, i);
		//Load some zeros
		rf_load_bitstream(zeros_bitstream, 32, i);
	}

	//set the trigger mode
	rf_set_trigger_mode(TRIGGER_CONTINUOUS);

	//trigger once
	rf_trigger();

	//flush the buffer
	rf_flush_buffer();

}


void rf_sine_test()
{

	rf_flush_buffer();


	//Just write the sine wave to each channel
	for(int i = 0; i < 5; i++){
		write_sample_stream(sine_wave, 16,0);
		write_sample_stream(sine_wave, 16,1);
	}

	//turn on the loop pin
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x01);
	//Turn on trigger overide
	gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x01);
	//trigger for 10 seconds
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0x01);
	usleep(10000000);
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0x00);
	//Turn off trigger override
	gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x00);
	//turn off mux
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0x00);
	//flush the buffer
	rf_flush_buffer();


}



void rf_ext_trigger_test()
{

	rf_flush_buffer();

	//set the repeat cycles
	//rf_set_repeat_cycles(15);

	//load the bitstream to all channels
	for(int i = 0; i < NUM_CHANNELS; i++)
	{
		//Load some zeros
		rf_load_bitstream(zeros_bitstream, 32, i);
		//Load the pulse
		rf_load_bitstream(pulse_bitstream, 32, i);
		//Load some zeros
		rf_load_bitstream(zeros_bitstream, 32, i);
	}


	//set the trigger mode
	rf_set_trigger_mode(TRIGGER_CYCLES);

	//set the loopback mode
	rf_set_loopback(YES);
}

void rf_pulse_test()
{


	//turn off ready
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0);
	//set the override pin as we don't need to count cycles for a single shot
	gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x01);

	for(int i = 0; i < 1; i++){
		write_sample_stream(zeros, 16,0);
		write_sample_stream(zeros, 16,1);
	}

	for(int i = 0; i < 5; i++){
		write_sample_stream(pulse, 16,0);
		write_sample_stream(pulse, 16,1);
	}
	for(int i = 0; i < 1; i++){
		write_sample_stream(zeros, 16,0);
		write_sample_stream(zeros, 16,1);
	}
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 1);
	//turn on ready
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 1);
	usleep(100);
	gpio_set_pin(RF_BANK, FIFO_TREADY_PIN, 0);
	gpio_set_pin(RF_BANK, FIFO_MUX_PIN, 0);
	gpio_set_pin(RF_BANK, TRIGGER_OVERRIDE_PIN, 0x00);
}

/////////////////////////////////////////////////////////////////////////
//INTERNAL FUNCTIONS/////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

u32 rf_read_stream(u8 stream_num)
{
	register int a0;
	switch(stream_num){

	case 0:
		getfsl(a0,  0);
		break;
	case 1:
		getfsl(a0,  1);
		break;
	case 2:
		getfsl(a0,  2);
		break;
	case 3:
		getfsl(a0,  3);
		break;

	}
	return (u32) a0;
}


void write_sample_stream(u16* samples, u16 length, u8 channel)
{
#define sample_0 0
#define sample_1 1

	register int sample;
	volatile unsigned int word;



	for(int i = 0; i < length; i+=2)
	{
		word = (samples[i+sample_1] << 16) | (samples[i+sample_0]);
		sample = word;
		if(channel == 0)
		{
			putfsl(sample,  0);
		}
		else if(channel == 1)
		{
			putfsl(sample,  1);
		}
		else if(channel == 2)
		{
			putfsl(sample,  2);
		}
		else if(channel == 3)
		{
			putfsl(sample,  3);
		}
		else if(channel == 4)
		{
			putfsl(sample,  4);
		}
		else if(channel == 5)
		{
			putfsl(sample,  5);
		}
		else if(channel == 6)
		{
			putfsl(sample,  6);
		}
		else if(channel == 7)
		{
			putfsl(sample,  7);
		}

	}

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

void rf_init()
{

	num_trigs_before_adc_readout = 0;

	waveform_buffer = malloc(WAVEFORM_BUFFER_SIZE);

	if(waveform_buffer == NULL)
	{
		debug_print("Error, unable to allocate waveform buffer.");
	}
	else
	{
		debug_print("Successfully allocated waveform buffer!");
	}

	last_adc_cycles = 0;

	debug_print("Running RF self test...");

	if(rf_self_test() == XRFDC_SUCCESS)
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
		debug_print("DAC data path enabled!");
	}
	else
	{
		debug_print("DAC data path not available!");
	}

	//Check the ADC path
	if(XRFdc_IsADCDigitalPathEnabled(&RFdcInst, 0, 0))
	{
		debug_print("ADC data path enabled!");
	}
	else
	{
		debug_print("ADC data path not available!");
	}

	gpio_init();

	//fx the test data
	for(int i = 0; i < 16; i++)
	{
		t_wave[i] = t_wave[i] >> 1;
		sine_wave[i] = sine_wave[i] >> 1;
		pulse[i] = pulse[i] >> 1;
		zeros[i] = 0;

	}
}

int rf_self_test()
{
	u16 RFdcDeviceId = RFDC_DEVICE_ID;
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
		debug_print("Failed to reset ADC tile");
		adc_available = 0;
	}
	else
	{
		adc_available = 1;
	}
	Status = XRFdc_Reset(RFdcInstPtr, XRFDC_DAC_TILE, Tile);
	if (Status != XRFDC_SUCCESS) {
		//return XRFDC_FAILURE;
		debug_print("Failed to reset DAC tile");
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
int CompareFabricRate(u32 SetFabricRate, u32 GetFabricRate)
{
	if (SetFabricRate == GetFabricRate)
		return 0;
	else
		return 1;
}
