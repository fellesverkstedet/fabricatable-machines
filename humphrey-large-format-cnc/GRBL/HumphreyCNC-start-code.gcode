M8					;give signal for motors to go to home position
G4 P1   			;wait one second
M9					;turn signal off
G4 P10				;wait for all motors to reach zero
G92 X600 Y-20 Z0    ;set the difference between homing location and where we want X and X home postion to be
G0 X650 Y-20 Z-30	;quickly jog to a good postion to start probing. X and Y is important, Z negative is just to save some time
G38.2 F200 Z-400	;start probing downwards
G92 Z0				;make probe surface Z zero upon impact
G0 Z1				;move up 1 mm
G38.2 F50 Z-100		;probe again with extra slow speed for maximum precision
G92 Z0				;make probe surface Z zero again
G0 Z18				;move to the height of the bed 	  !!!CHANGE THIS VALUE after surfacing!!!
G92 Z0				;make bed height Z zero