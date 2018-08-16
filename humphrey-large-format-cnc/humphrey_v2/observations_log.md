# Lessons learned from Humphrey v2

## Torsion box



### Observations
Avoid edge effects that crack screwholes
Y axis screws har unscrewd themselves many!! Do I need to add loctite?
Welded legs could not be adjusted. Idea, bolt on the long support after all is mounted. Also include something to attach to legs

### Suggested updates
Countersink deeper on botttom
Spacers for roller axis on y
Y echain needs more floor to not overbend
### Future ideas
Could standardize so no special ends
Around hole, better symmetry on holes and not hit alu
 move meganuts out so that they dont interfear with holddown (problematic with size of sheet?)
## Ganty

### Observations
Alu: skip needless tabs and or increase tols where not critical
Y motor plate collides with y backstop screws so that motor can’t disengage rack (?)
Had to file quite a bit to get the X-rail on. 
### Suggested updates
Make access holes so that the feet to bottom plate screws can be easier accessed.
X echain collides with screws
Accitentaly Flipped the installation of the ribs in gantry and in gantry feet, make symmetrical or not fit the wrong way
Ribs in gantry should not touch press out x axis, risk of missalign
X endstop and limit switch is to close. (hand drilled new hole to solve, moved to slot for pinion to not trigger on alu by mistake. Add new hole to model)
raise gantry a bit to allow more dust skirt schennanigans?
Foot to gantry mount holes access screws - fixed
Foot excenter did not reach rail on one foot. Perhaps messure when building foot? Or other method.


Stop dust path to on top of y rail from gantry feet.

### Future ideas

## general
Wire emergency stop to reset arduino would be great
Folder with all nice files 
fusion360 post processor
Investigate, can usg run a homeing macro at the start of each job?
Viper hooks extend past end of rail: pinch point
Test less sharp angle on glide block for less squeeze
Too tight / missing holes for long x viper
### Observations
Z limit screw can be passed and malfunction seeking past it (added a bunch of more screws to solve this)
Could it be that 6mm cycloid teeth gives a too uneven torque and that causes vibration? (only noticable when high friction. problem dissapeared when friction was reduced)
Ev inte stramma yttersta holddown screws when milling axis due to spoilboard compression= too tight in corners (possibillity that this was caused by uneven table)
Z plate jordade pga dritt i hull
40mm pinions weaker than 3nm motor is max strong. Perhaps better with larger gear geometry? Trimma ned motorer så de stallar tidigare och ändra alarmpunkt = bra ide



Noted: friction increases with speed on x axis
### Suggested updates
Safety manual and how to use correctly instructions
Y axis rail pieces should be different length so the gaps does not align. Make bigger head clearnace holes so they can be adjusted (was more of an issue on the tight glide blocks)
Post processor fusion
Safety signs
Kurs och handover
Assembly instructions
Write and Print safety manual
Make homing screws adjustable

### Future ideas


Fab acc science:
Map strength vs hisu settings for motor 
## Dust skirt

### Observations
Dust skirt could have simpler design with more air channel and paralell front. Also test thinner design pga weight
Fel i modell, spindel motor cylinder del är 62Ømm

Dust skirt design is challanging if it can’t go under gantry. One option is to put spindle on spacers to simplify. The brushes also interfear with the gantry feet. Consider lowering inner foot side and increasing outer instead


Dust skirt collision with strikk holddrs = annoying. Also skirt interfears with tuning 
### Suggested updates
Use newtone design
### Future ideas


## glide blocks

###Observations
Andre upplever att alu glideblokker blir full i stöv snabbare än plast, kanske sprids kraften mer på plast.



## CAM

### Observations


Excenter core 7.7 mm with finish pass fits precisely into a 608 ball bearing, using a shopbot 60.000RPM spindle


### Suggested updates
Updating references with cam data takes for fucking ever. Find a fix, do a bug report. (moved CAM to separate files without history was a success)


## Assembly

### Suggested updates
Mark on alu what goes where, adjust etc
Sätt på hjul före montering when doing roller axis
Y feet assy order wheels first, make possible clash with veritcal holder
Excentrer holes too tight in bottom, bit deflections? make larger holes
Check rattle beyond hole in torsion box at newtone, possible misaligned
#### Future ideas
Mulighet å rikta x o z? Optional more adjustable wheels




Weight file:
12,5 kg pull in motor to keep x moving with strikk erta på alu med oxid. Loose tune. Same other way without strikk from strikk ears on x plate

Tape blok mot alu, ingen oxid 10 kg pull i strikk ears, mkt loose tune. 7 kg om jag drar långsammare. Går ned under 5 om jag avlastar vridmoment.

Tape på tape, med lös testeaxe. 18kg!!

Tuned uhmw ca 10kg

Vikt 1,77kg stepper motor plus motor plate o spacers

X carriage 14,8 kg utan x stepper se ovan.

16,6 kg tot weight x carriage
X plate 1,22kg
Z axis 1,7 kg
Två halvor glide block 170g

High movement resistance: motor drove uneven/”missed steps”, increased gearing, motor pushed glide blocks out of tune, roughed glide block subsurface, motor broke pinion/stalled out. 

Mindre spindle: less friction more precision.
Tynn uhmw på axis? Alt torrmöremiddel eller lack?

Ide: dust skirt lossnar som kinavarianten. Nån docka för den så man kan köra utan. Så är den inte i vägen
60mm testcirk, conventional clockwice, inside profile.
59,4 bred
59,0 hög
59,6 22:30
60 13:30

New weak link pinion, lower motor setting to create soft weak link

Incident kunde bränt spindel shopbot 
Andra i bygg acceptera vårdslös om brand

## Notes h3

Make easier access to screws between gantry feet and bottom plate in gantry

