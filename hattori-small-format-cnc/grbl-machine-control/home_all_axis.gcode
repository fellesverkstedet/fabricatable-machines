$H					;run GRBL homing cycle
G92 X-24.5 Y-2.5 Z0    ;set the difference between homing location and where we want X and X home postion to be
G0 X-24.5 Z-85		;quickly jog to a good postion to start probing. X is important, Z negative is just to save some time
G38.2 F200 Z-300	;start probing downwards
G92 Z0				;make probe surface Z zero
G0 Z1				;move up 1 mm
G38.2 F50 Z-100		;probe again with extra slow speed for maximum precision
G92 Z0				;make probe surface Z zero again
G0 Z16.2				;move to the height of the bed
G92 Z0				;make bed height Z zero