# Electronics

## HRBL-Controller

The HRBL-controller is a optoisolated connection shield for an Arduino Nano running the GRBL CNC control firmware. 

[Source files for KiCAD](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/hrbl-shield/nano)

### Connections

![Connections](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/humphrey-large-format-cnc/humphrey_v3/img/electronics/hrbl_connections_all.JPG)

### Programming

* [Download and install arduino if you don't have it](https://www.arduino.cc/download_handler.php)
* Download the [GRBL files for arduino IDE programming with spindle enable configured](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/humphrey-large-format-cnc/humphrey_v3/GRBL_Spindle_ENABLE.zip)
* Unzip and open the file in Examples > grblUpload > grblUpload.ino in the Arduino IDE interface
* In the Arduino IDE interface: Select Arduino NANO and the correct COM port in the menu
* In the Arduino IDE interface: Press upload

[How to use GRBL](https://github.com/gnea/grbl/wiki)

## Spindle and Variable Frequency Drive

The spidle will spin 24000 rpm when given 400hz from the vfd.

It should not be run slower than 10000 rpm since it's air cooled, so we set a minimum of PD011 = 166 
 
### Connections

[Recommendations](http://www.woodworkforums.com/f170/tips-newbie-huanyang-vfd-users-96380)
[Guide for Mach3](http://www.kronosrobotics.com/hy02d223b-vfd-type-1/) use the settings below:

### Programming

Set these parameters on the VFD

* pd001= 1
* pd002 = 1
* pd070 = 1
* pd007 = clear
* PD011 = 166 
* jumper leftmost (VI to center)

Also set the spin up and spin down time to 2s.

## Motors

### Connections

### Programming

[Stepper manual](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/hrbl-shield/dev_files/integrated_stepper/20160528161106_17875.pdf)

Set the dip switches on the steppers to 001100 to use  3200 steps per revolution.
The pinion rolls 40 mm per revolution so that gives us 80 microsteps per mm (5 fullsteps per mm).

#### HISU motor calibration

A HISU should be used to increase motor torque, remove smoothing and set the max error value for the closed loop.

![Hisu](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/hrbl-shield/dev_files/integrated_stepper/6C3A13B4-B353-4DFC-950C-6E98B35EEC22.jpeg)

[HISU on aliexpress](https://www.aliexpress.com/item/HISU-for-Andriy-Kyrychenko/32805819281.html?spm=2114.search0104.3.1.6c2661d1JJVdOY&ws_ab_test=searchweb0_0,searchweb201602_3_10065_10068_10059_5015212_10696_100031_10084_10083_10103_5015812_451_452_10618_5015112_10307_5015912,searchweb201603_56,ppcSwitch_5&algo_expid=bcced743-392b-477b-ba84-0d559d9ffe03-0&algo_pvid=bcced743-392b-477b-ba84-0d559d9ffe03&priceBeautifyAB=0) to adjust motor settings

![how to HISU](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/hrbl-shield/dev_files/integrated_stepper/HTB1.IttbURIWKJjSZFgq6zoxXXak.jpg)
 
 _How to HISU_
 
 [Default values for the motor](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hrbl-shield/dev_files/integrated_stepper/Default%20values.txt)

## Commanding computer

* Download nightly build of [UGS](https://winder.github.io/ugs_website/)
* Use this [file](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/humphrey_v2/Settings_backup/home%20and%20probe.gcode) to set up a good homeing-routine.
* Use the homeing routine to make a post processor for Vcarve.
