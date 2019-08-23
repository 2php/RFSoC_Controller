/*
 * uart.c
 *
 *  Created on: Jun 26, 2019
 *      Author: Marandi Group B241
 */

#include "uart.h"

void debug_print(char* buff)
{
	print(buff);
	print("\n\r");
}


int uart_init()
{
	u16 DeviceId = UARTLITE_DEVICE_ID;
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

//returns 1 if receive timed out
int uart_receive(u8* buff, u16 num_char)
{
	//create a temp buffer
	u8 t_buff[1] = {0};
	u32 j = 0;
	for(int i = 0; i < num_char; i++)
	{
		//wait for a character to arrive
		while(XUartLite_Recv(&UartLite, t_buff, 1)==0)
		{
			j++;
			if(j > UART_MAX_REC_COUNT)
			{
				return 1;
			}
		}
		//place the character into the buffer
		buff[i] = t_buff[0];
	}
	//flush the buffer of any remaining characters
	while(XUartLite_Recv(&UartLite, t_buff, 1)!=0);
}

void uart_send(u8* buff, u32 len)
{
	for(int i = 0; i < len; i++){
		u8 l_buff[1] = {buff[i]};
		while(XUartLite_IsSending(&UartLite));
		XUartLite_Send(&UartLite, l_buff, 1);
	}
}

//returns 1 if cmd is availabe, also writes command to first position of buffer
u8 uart_cmd_available(u8* cmd_buff)
{
	//create a temp buffer
	u8 t_buff[1] = {0};
	//If there's anything waiting in the buffer
	if(XUartLite_Recv(&UartLite, t_buff, 1)!=0)
	{
		//write the command to the user provided buffer
		cmd_buff[0] = t_buff[0];
		//flush the rest of the buffer
		while(XUartLite_Recv(&UartLite, t_buff, 1)!=0);
		return 1;
	}
	//If there's no command
	else
	{
		return 0;
	}
}

void uart_send_ack()
{
	u8 buff[1] = {0x00};
	XUartLite_Send(&UartLite, buff,1);
}