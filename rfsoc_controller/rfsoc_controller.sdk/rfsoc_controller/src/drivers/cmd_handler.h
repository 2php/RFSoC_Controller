/*
 * cmd_handler.h
 *
 *  Created on: Jun 27, 2019
 *      Author: Marandi Group B241
 */

#ifndef SRC_DRIVERS_CMD_HANDLER_H_
#define SRC_DRIVERS_CMD_HANDLER_H_


//Test case defines
#define PULSE_TEST '0'
#define SINE_TEST '1'
#define EXT_TRIGGER_TEST '2'
#define FLUSH_BUFFER '3'
#define REPEAT_TEST '4'
#define TRIGGER_DETECT_TEST '6'

//Python command defines
#define PING_BOARD 0x00
#define WAVEFORM_OVER_UART 0x01

//Python commands
void cmd_waveform_over_uart();

//Test case commands
void cmd_pulse_test();
void cmd_sine_test();
void handle_cmd();
void cmd_ext_trigger_test();
void cmd_led_test();
void cmd_repeat_test();


#endif /* SRC_DRIVERS_CMD_HANDLER_H_ */
