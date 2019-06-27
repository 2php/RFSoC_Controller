/*
 * cmd_handler.h
 *
 *  Created on: Jun 27, 2019
 *      Author: Marandi Group B241
 */

#ifndef SRC_DRIVERS_CMD_HANDLER_H_
#define SRC_DRIVERS_CMD_HANDLER_H_


#define PULSE_TEST '0'
#define SINE_TEST '1'


void cmd_pulse_test();
void cmd_sine_test();
void handle_cmd();



#endif /* SRC_DRIVERS_CMD_HANDLER_H_ */
