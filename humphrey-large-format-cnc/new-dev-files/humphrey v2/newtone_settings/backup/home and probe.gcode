$H					;run GRBL homing cycle
G92 X-105 Y-40 Z0   ;set the difference between homing location and where we want X and X home postion to be
G0 X-82 Z-50			;quickly jog to a good postion to start probing. X is important, Z negative is just to save some time
G38.2 F300 Z-130	;start probing downwards
G92 Z0				;make probe surface Z zero
G0 Z1				;move up 1 mm
G38.2 F50 Z-5		;probe again with extra slow speed for maximum precision
G92 Z0				;make probe surface Z zero again
G0 Z40				;move good height to clear the gantry foot
G92 Z43				;set set the current position of the bit in realtion to the bed surface