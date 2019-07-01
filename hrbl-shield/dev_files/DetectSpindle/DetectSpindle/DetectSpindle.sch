EESchema Schematic File Version 4
LIBS:DetectSpindle-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 850  1350 0    50   ~ 0
Purpose: \n\nSend an alarm signal to the controller if the spindle stalls.\n\nMode of operation:\nListen for spindle ON signal\nListen for power being send out to spindle\nif 
$Comp
L Isolator:SFH6206-3T U?
U 1 1 5D1A1034
P 2800 3200
F 0 "U?" H 2800 3567 50  0000 C CNN
F 1 "SFH6206-3T" H 2800 3476 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 2800 2800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 2800 3200 50  0001 C CNN
	1    2800 3200
	1    0    0    -1  
$EndComp
Text GLabel 2450 3800 0    50   Input ~ 0
U_spindle_driver
Text GLabel 2500 3300 0    50   Input ~ 0
V_spindle_driver
Text Notes 250  3850 0    50   ~ 0
These form a 36V AC source \nwith dynamic frequency. \nWe want a "slow" reaction of a\n few 1/10 sec so we can filter\n agressively
$Comp
L Device:R R?
U 1 1 5D1A1105
P 3350 3450
F 0 "R?" H 3280 3404 50  0000 R CNN
F 1 "R" H 3280 3495 50  0000 R CNN
F 2 "" V 3280 3450 50  0001 C CNN
F 3 "~" H 3350 3450 50  0001 C CNN
	1    3350 3450
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5D1A11A0
P 3600 3450
F 0 "C?" H 3715 3496 50  0000 L CNN
F 1 "C" H 3715 3405 50  0000 L CNN
F 2 "" H 3638 3300 50  0001 C CNN
F 3 "~" H 3600 3450 50  0001 C CNN
	1    3600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3300 3600 3300
Wire Wire Line
	3600 3600 3450 3600
$Comp
L power:GND #PWR?
U 1 1 5D1A128B
P 3450 3650
F 0 "#PWR?" H 3450 3400 50  0001 C CNN
F 1 "GND" H 3455 3477 50  0000 C CNN
F 2 "" H 3450 3650 50  0001 C CNN
F 3 "" H 3450 3650 50  0001 C CNN
	1    3450 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3650 3450 3600
Connection ~ 3450 3600
Wire Wire Line
	3450 3600 3350 3600
$Comp
L power:VCC #PWR?
U 1 1 5D1A1317
P 3100 3100
F 0 "#PWR?" H 3100 2950 50  0001 C CNN
F 1 "VCC" V 3117 3228 50  0000 L CNN
F 2 "" H 3100 3100 50  0001 C CNN
F 3 "" H 3100 3100 50  0001 C CNN
	1    3100 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 3300 3100 3300
Connection ~ 3350 3300
Text GLabel 3600 3100 1    50   Input ~ 0
SPINDLE_PWR
Text GLabel 1300 4650 0    50   Input ~ 0
SPINDLE_EN
$Comp
L Isolator:SFH6206-3T U?
U 1 1 5D1A1560
P 1900 4750
F 0 "U?" H 1900 5117 50  0000 C CNN
F 1 "SFH6206-3T" H 1900 5026 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W9.53mm_Clearance8mm" H 1900 4350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/83675/sfh620a.pdf" H 1900 4750 50  0001 C CNN
	1    1900 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5D1A15AA
P 1450 4650
F 0 "R?" V 1657 4650 50  0000 C CNN
F 1 "R220" V 1566 4650 50  0000 C CNN
F 2 "" V 1380 4650 50  0001 C CNN
F 3 "~" H 1450 4650 50  0001 C CNN
	1    1450 4650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D1A16D0
P 1600 4850
F 0 "#PWR?" H 1600 4600 50  0001 C CNN
F 1 "GND" V 1605 4722 50  0000 R CNN
F 2 "" H 1600 4850 50  0001 C CNN
F 3 "" H 1600 4850 50  0001 C CNN
	1    1600 4850
	0    1    1    0   
$EndComp
Text Notes 700  4850 0    50   ~ 0
Not needed?
Text GLabel 4700 2600 1    50   Input ~ 0
SPINDLE_EN
Connection ~ 3600 3300
Wire Wire Line
	3600 3100 3600 3300
$Comp
L power:GND #PWR?
U 1 1 5D1A1C42
P 5400 3300
F 0 "#PWR?" H 5400 3050 50  0001 C CNN
F 1 "GND" H 5405 3127 50  0000 C CNN
F 2 "" H 5400 3300 50  0001 C CNN
F 3 "" H 5400 3300 50  0001 C CNN
	1    5400 3300
	1    0    0    -1  
$EndComp
Wire Notes Line
	8700 650  11000 650 
Wire Notes Line
	11000 650  11000 4350
Wire Notes Line
	11000 4350 8700 4350
Wire Notes Line
	8700 4350 8700 800 
Text GLabel 9350 1150 2    50   Input ~ 0
SPINDLE_EN
$Comp
L power:GND #PWR?
U 1 1 5D1A1DEF
P 9550 1450
F 0 "#PWR?" H 9550 1200 50  0001 C CNN
F 1 "GND" H 9555 1277 50  0000 C CNN
F 2 "" H 9550 1450 50  0001 C CNN
F 3 "" H 9550 1450 50  0001 C CNN
	1    9550 1450
	1    0    0    -1  
$EndComp
Text GLabel 10000 2000 0    50   Input ~ 0
U_spindle_driver
Text GLabel 10000 2200 0    50   Input ~ 0
V_spindle_driver
$Comp
L power:VCC #PWR?
U 1 1 5D1A1E78
P 9600 2600
F 0 "#PWR?" H 9600 2450 50  0001 C CNN
F 1 "VCC" H 9617 2773 50  0000 C CNN
F 2 "" H 9600 2600 50  0001 C CNN
F 3 "" H 9600 2600 50  0001 C CNN
	1    9600 2600
	1    0    0    -1  
$EndComp
Text Notes 9000 900  0    50   ~ 0
Interface to arduino \n\nDon't do extra shield layer\n
Text GLabel 9500 3200 0    50   Input ~ 0
ABORT
$Comp
L Device:Q_NPN_BCE Q?
U 1 1 5D1A1F6F
P 5300 3100
F 0 "Q?" H 5491 3146 50  0000 L CNN
F 1 "Q_NPN_BCE" H 5491 3055 50  0000 L CNN
F 2 "" H 5500 3200 50  0001 C CNN
F 3 "~" H 5300 3100 50  0001 C CNN
	1    5300 3100
	1    0    0    -1  
$EndComp
Text Notes 9700 3050 0    50   ~ 0
Pull low to trigger
$Comp
L Device:R R?
U 1 1 5D1A2493
P 4700 2750
F 0 "R?" H 4770 2796 50  0000 L CNN
F 1 "R" H 4770 2705 50  0000 L CNN
F 2 "" V 4630 2750 50  0001 C CNN
F 3 "~" H 4700 2750 50  0001 C CNN
	1    4700 2750
	1    0    0    -1  
$EndComp
Text GLabel 5400 2900 1    50   Input ~ 0
ABORT
$Comp
L Device:Q_NPN_BCE Q?
U 1 1 5D1A2726
P 4600 3300
F 0 "Q?" H 4500 3450 50  0000 L CNN
F 1 "Q_NPN_BCE" H 4150 3150 50  0000 L CNN
F 2 "" H 4800 3400 50  0001 C CNN
F 3 "~" H 4600 3300 50  0001 C CNN
	1    4600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3100 5050 3100
Wire Wire Line
	4700 2900 4700 3100
Connection ~ 4700 3100
$Comp
L power:GND #PWR?
U 1 1 5D1A2B81
P 4700 3500
F 0 "#PWR?" H 4700 3250 50  0001 C CNN
F 1 "GND" H 4705 3327 50  0000 C CNN
F 2 "" H 4700 3500 50  0001 C CNN
F 3 "" H 4700 3500 50  0001 C CNN
	1    4700 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3300 4400 3300
$Comp
L Device:C C?
U 1 1 5D1A2E8A
P 5050 3300
F 0 "C?" H 5165 3346 50  0000 L CNN
F 1 "C" H 5165 3255 50  0000 L CNN
F 2 "" H 5088 3150 50  0001 C CNN
F 3 "~" H 5050 3300 50  0001 C CNN
	1    5050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3150 5050 3100
Connection ~ 5050 3100
Wire Wire Line
	5050 3100 4700 3100
$Comp
L power:GND #PWR?
U 1 1 5D1A2FD7
P 5050 3450
F 0 "#PWR?" H 5050 3200 50  0001 C CNN
F 1 "GND" H 5055 3277 50  0000 C CNN
F 2 "" H 5050 3450 50  0001 C CNN
F 3 "" H 5050 3450 50  0001 C CNN
	1    5050 3450
	1    0    0    -1  
$EndComp
Text Notes 4850 3750 0    50   ~ 0
To give the driver time to start the spindle
$Comp
L Device:R R?
U 1 1 5D1CBB86
P 2350 3100
F 0 "R?" V 2143 3100 50  0000 C CNN
F 1 "1k" V 2234 3100 50  0000 C CNN
F 2 "" V 2280 3100 50  0001 C CNN
F 3 "~" H 2350 3100 50  0001 C CNN
	1    2350 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D1CBC9B
P 2050 3100
F 0 "R?" V 1843 3100 50  0000 C CNN
F 1 "1k" V 1934 3100 50  0000 C CNN
F 2 "" V 1980 3100 50  0001 C CNN
F 3 "~" H 2050 3100 50  0001 C CNN
	1    2050 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D1CBD1B
P 1750 3100
F 0 "R?" V 1543 3100 50  0000 C CNN
F 1 "1k" V 1634 3100 50  0000 C CNN
F 2 "" V 1680 3100 50  0001 C CNN
F 3 "~" H 1750 3100 50  0001 C CNN
	1    1750 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5D1CBDA2
P 1450 3100
F 0 "R?" V 1243 3100 50  0000 C CNN
F 1 "1k" V 1334 3100 50  0000 C CNN
F 2 "" V 1380 3100 50  0001 C CNN
F 3 "~" H 1450 3100 50  0001 C CNN
	1    1450 3100
	0    1    1    0   
$EndComp
Text Notes 1700 2850 0    50   ~ 0
220V = 4k\n36V 660ohm\ntarget 60mA at 1,25Vf\nsolder 3x220 + 1x0 ohm for 36 v 
$EndSCHEMATC
