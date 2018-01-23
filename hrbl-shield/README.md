# Hrbl - Grbl shield for integrated motors

A shield aiming to simply connecting motors, limit switches, safety and spindle to an ardunio board. Tailor made for fabricatable CNC milling machine needs. Potentially great to combine with Hertz - axis monitoring board. Optimized for ihss57 integrated closed loop stepper motors.

![top](./img/hrbl-shield-v0_1-top.jpg)
*The goal is give the same super easy connection as when working with RC servos on a breakout shield*

### Status

*First version almost ready for testing. Needs quality control and final component decisions*

### Functionality

* 4 x 8 pole cable connections that combine all connections needed per axis in one  *(Power, gnd, step, dir, limit switch, alarm, enable, signal gnd)*
* Dual output for Y
* The included limit switch signal connection has pull-up with resistors and capacitors for normally open limit switches running on same dc power as the motor drives
* Z axis milling bit probe connection with external pull-up
* Spindle control with start and speed control. Uses optocoupler for safe handling of 24v start signal
* Connection for safety contactor helper connection. Needs to be jumped if not used. Contactor helper need to be normally open

![bottom](./img/hrbl-shield-v0_1-bottom.jpg)
*Power is routed in the bottom layer. The board is deigned to be easy to CNC mill from a 2 sided FR1 board*

![pcb](./img/hrbl-shield-v0_1-pcb.jpg)
*Current PCB layout*

### To do

* Find optinmmal smd connectors and update routing
* Refine vias and connector type for 36v power
* Find optimal smd optcupler and update routing
* Inspect for errors and unfabricatable geometry
* CNC mill, solder and test the board