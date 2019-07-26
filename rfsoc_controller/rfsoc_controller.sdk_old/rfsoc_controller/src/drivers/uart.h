/*
 * uart.h
 *
 *  Created on: Jun 26, 2019
 *      Author: Marandi Group B241
 */

#ifndef SRC_DRIVERS_UART_H_
#define SRC_DRIVERS_UART_H_



#include "xuartlite.h"
#include "xparameters.h"

#define UARTLITE_DEVICE_ID	XPAR_UARTLITE_0_DEVICE_ID

XUartLite UartLite;		/* Instance of the UartLite Device */


void debug_print(char* buff);
int uart_init();
void uart_recieve(u8* buff, u16 num_char);
//returns 1 if cmd is availabe, also writes command to first position of buffer
u8 uart_cmd_available(u8* cmd_buff);
void uart_send_ack();
void uart_send(u8* buff, u32 len);


#endif /* SRC_DRIVERS_UART_H_ */
