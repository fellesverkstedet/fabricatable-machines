$H						;run GRBL homing cycle
G92 X165.99 Y9 Z0 		;set the difference between homing location and where we want X and Y home postion to be
G0 X161 Y11 Z0			;quickly jog to a good postion to start probing. X is important, Z negative is just to save some time
G38.2 F300 Z-60		;start probing downwards
G92 Z0					;make probe surface Z zero
G0 Z2					;move up 2 mm
G38.2 F50 Z-5			;probe again with extra slow speed for maximum precision
G92 Z0					;make probe surface Z zero again
G0 Z40					;move good height to clear the gantry foot
G92 Z30				;set set the current position of the bit in realtion to the bed surface OFFSET THIS AFTER PLANING THE WORKBED!