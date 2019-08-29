# Wireless stepper control board

The idea is to add a wifi microcontroller to our motors

![](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/hertz-axis-monitor/img/ihss57-integrated-closed-loop-stepper-from-jmc.jpg)

+

![](img/esp8266.PNG)

*ESP8266 microcontroller and JMC closed loop stepper motor iHSSXX.*

### Benefits and features
* This will allow for remote control of the motors. 
* Even without precision timing a wirelessly controlled motor is a fun idea.
* The onboard motor controller can even host a small webpage with settings and allow files with drive sequences to be uploaded.

### Powering the board - options
* The motor has a 3.3V voltage pin that can power the board and the inputs can possibly be driven straight from the microcontroller pins, min 3.5 V acc to a [data sheet](https://www.cnc-technics.de/stepper_motoren_integrated.pdf) and min 3.3 V acc to another [data sheet](https://webseite.sorotec.de/download/Technische-Daten/schrittmotor_datenblaetter/jmc_closed_loop/DS_iHSSXXen_181030Soro.pdf)
* A 5V voltage regulator can be added.

### Mounting on and connecting to the motor
Can be done in the same way as proposed in [Hertz motor monitoring board](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/hertz-axis-monitor#hertz---axis-monitoring-board)

### Development 
This [issue](https://github.com/fellesverkstedet/fabricatable-machines/issues/30#) debates if we can sync the clocks of such boards to make them perform precision tasks in paralell, like CNC milling. 


