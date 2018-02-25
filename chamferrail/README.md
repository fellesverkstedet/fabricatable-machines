# Chamfer Rail

![Chamfer rail on cnc bed](./img/16detail.JPG)

![Chamfer rail 320mm axis](./img/33back-side.JPG)

* A linear actuator with rack & pinion drive system, designed to be CNC-milled.
* This is a simplified version of the axis system from [V-bird](#V-bird) and [Simple Gantry](#simple-gantry),
* Can be reproduced using only standard CNC operations and bits *(chamfering using a 90deg V-bit, or 3D mill with ball nose bit)*
* The rack and pinion has 3.33333 steps per mm with a 200 step motor *(performance with with a nema23 motor is so good we have opted for larger circumference on the pinion. Makes for much faster rack fabrication with a larger bit, and stronger teeth when the rack is made form a weak material)*
* All parts except pinion can be milled from a single cutsheet
* If you fabricate the glide blocks and chamfer rail from the same material we reccomed that you apply [UHMW tape](https://www.amazon.co.uk/gp/product/B00DE2RUMC/) on the glide blocks 

**NOTE:** The glide block design in this repo was updated on november 6th 2017. Check [Hattori - small format CNC mill](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hattori-small-format-cnc/README.md) for an examples how we use the state of the art glide block design.

* [Rhino files](./standard-chamferrails.3dm)
* [Grasshopper based paramteric axis generator](./chamfer-rail-generator.gh)
* [STEP 3D](./standard-chamferrails.stp)
* [DXF 2D](./standard-chamferrails.dxf)
* [FreeCAD source, older design](./old-dev-files/chamferrail.fcstd)

**Projects using chamfer rail:**
* [Humphrey - large format CNC mill](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/README.md)
* [Hattori - small format CNC mill](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hattori-small-format-cnc/README.md)
* [Hector - luggage based CNC platform](http://archive.fabacademy.org/archives/2017/fablabverket/students/100/web/projects/diy_cnc/index.html)
* [Hank - medium sized CNC mill](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hank-medium-format-cnc/README.md)
* [Ping pong arcade machine by Verket Fab Academy students](http://archive.fabacademy.org/2017/fablabverket/group-project.html)
* [Mad max drawing machine by Barcelona Fab Academy students](http://archive.fabacademy.org/2017/fablabbcn/group/machine/group3/)
* [Robot arm by Trivandrum Fab Academy Students](http://archive.fabacademy.org/archives/2017/fablabtrivandrum/machine_building/team_1/index.html) [Test in 6mm acrylic](http://archive.fabacademy.org/archives/2017/fablabtrivandrum/students/280/week9.html)

# How to fabricate

### BOM (Bill of materials)
* 8mm Aluminium, minimum 130mm wide *(we use 6082 alloy)* or for less hardcore machine 8mm HDF (Valchromat or other type)
* 12.7mm POM/Delrin/Acetal
* M5 25mm bolts (6pcs for one axis plate)
* M5 20mm bolts (10pcs for one axis sandwhich)
* M5 16mm bolts (4pcs for one motor plate)
* M5 nuts (4pcs if trapped nut teqnique is used for attaching motor plates)
* M5 washeres (20pcs)
* M5 hex set-setscrews (3 pcs for one pinion)
* Nema 17 or Nema23 size stepper motor (we reccomend the [ihss57](https://www.aliexpress.com/store/product/NEMA-23-2N-m-283ozf-in-Integrated-Closed-Loop-Stepper-motor-36VDC-JMC-iHSS57-36-20/1932111_32712473144.html?spm=2114.12010612.0.0.243238e3iJu6Vc) integrated cloed loop stepper from JMC)
* Stepper driver
* End stop optional
* Motor and end stop cable
* Stepper driver controller (Arduino+GRBL, Replicape, LinuxCNC etc.)


### Tools needed
* 3 axis CNC millng machine *(we use a Fab Lab standard ShopBot Alpha PRS 96-48, 4hp spindle)*
* Screw driver
* M5 tap


### Milling bits
* 6mm Up-Cut single-flute *(for cutouts, clearing pinion pocket and rack geometry)*
* 3mm Up-Cut single-flute *(for small inside holes and pinon tooth geometry)*
* V-Bit 90deg large, at least 10mm diameter *(for milling the chamfer glide suraces)*
* Alternatively you can use a 6mm ball nose bit to 3D mill the chamfer *(reccomeded for weaker machines)*
* V-Bit 90deg small *(for chamfering the rack teeth, not critical)*

Both aluminium and plastic requires very sharp milling bits.


### Feeds and speeds
**Alumnium**

* 6mm Endmill Up-Cut single-flute: Feed rate 12mm/s, plunge rate 8mm/s, Spindle RPM 18000, pass depth 2.5mm, ramp angle 12deg
* 3mm Endmill Up-Cut single-flute: Feed rate 9mm/s, plunge rate 6mm/s, Spindle RPM 18000, pass depth 1.2mm, ramp angle 12deg
* 30mm V-bit double-flute: Feed rate 40mm/s, plunge rate 6mm/s, Spindle RPM 18000, pass depth 0.5mm, ramp angle 12deg
* 6mm V-bit single-flute: Feed rate 11mm/s, plunge rate 6mm/s, Spindle RPM 18000, pass depth 1.0mm, ramp angle 12deg
* 6mm Ball nose Up-Cut single-flute: Feed rate 30mm/s, plunge rate 20mm/s, Spindle RPM 18000, stepover 0.36mm, start from the bottom

No coolant required. The milling bit should be cold or luke warm after milling. It is important that your mililng machines is well tuned and set up. Follow instructions on the [theory](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/theory) page. Finish milling can be done at full depth (set pass depth to a bit more than material thickness). Leave about 0.1mm offset for the finish pass to clean up.

**POM**

* 6mm Up-Cut single-flute: Feed rate 22mm/s, plunge rate 15mm/s, Spindle RPM 18000, pass depth 8mm, ramp angle 18deg
* 3mm Up-Cut single-flute: Feed rate 18mm/s, plunge rate 12mm/s, Spindle RPM 18000, pass depth 4mm, ramp angle 18deg


### Fabrication time *these are old values, expect faster fabrication with our new rack geoemtry suitable for 6mm bit*
* 320m x 127mm aluminium axis including rack and rail geometry: **39minutes** + tool change and setup
* Aluminum axis plate for 127mm wide rail: **32minutes** + tool change and setup
* POM pinion, 4 x glide blocks, motor plate and adjustment wedge: **9minutes** + tool change and setup


### Axis milling

You can practise milling this in wood or other cheap material.

Always use climb millng direction when milling aluminum or plastic.


#### The holes
Manually drill holes in the corner of the aluminium sheet. Screw it down to the bed. Then do the screw pocket milling to 6mm depth with a 6mm bit, and the holes to full depth (10.6mm) with a 3mm bit,
![Chamfer rail 320mm axis](./img/04pockets-axis.JPG)

Place a screw with a spacer in the holes. This will hold the axis down after it is has been cut out. We lasercut wooden washers from high quality plywood. They can be safely milled into and wont dent the aluminium. You can also use metal washers insde the screw pockets. This gives the strongest and most reialble fixturing.
![Chamfer rail 320mm axis](./img/05hold-down-with-ply-spacers.JPG)

#### The rack pocket
Mill the rack pockets 4.1mm depth with a 6mm bit.
![Chamfer rail 320mm axis](./img/06rack-pocket.JPG)

#### Cutout
Cut the axis out. We usually add 0.6mm, making the cut depth 10.6mm. If you mill multiple axes make sure there is enough space between for the v-bit to only work one side at a time. We should have added some more distance.
![Chamfer rail 320mm axis](./img/07cutout.JPG)

Remove the rest of alumium plate. This makes the chamfer and rack milling safer and easier.
![Chamfer rail 320mm axis](./img/08cutsheet-removal.JPG)

![Chamfer rail 320mm axis](./img/09ready-for-chamfer.JPG)

#### The chamfered edge
Zero the large V-Bit on the bed instead of the top of the material. Then move the Z axis up 10mm and set custom Z zero. This way you are not depending on perfect material thickness.
![Chamfer rail 320mm axis](./img/10zeroing-on-bed.JPG)

Chamfer the sides to 4mm depth. Be carefull of your offset. If your curve is offet with 2mm, you need mill 6mm deep for 4mm chamfer. If you bit is not flat underneath, you will need to compensate this too. The chamfered surface will be the precision rail geometry. You can make a second final finish pass a little slower for max smoothness. If you machine is weak you can 3D mill these surfaces with an endmill (up-down milling) or ballnose (starting from the bottom) instead of the v-bit.
![Chamfer rail 320mm axis](./img/12chamfered-sideview.JPG)

#### The rack teeth
Rough mill the rack geometry to 4mm depth, with a 2mm bit and 0.1mm offset. Make sure you are using climb milling direction.
![Chamfer rail 320mm axis](./img/13rack-milling.JPG)

Finish mill the rack geometry to 4mm depth, with a 2mm bit. Make sure you are using climb milling direction. You can use 3.9mm vertical pass depth for maximum surface finish. If your machine is weak, make multiple finsih passes.
![Chamfer rail 320mm axis](./img/13rack-milling.JPG)


you can add a 0.3mm chamfer to reduce pinion wear.
![Chamfer rail 320mm axis](./img/14rack-chamfered.JPG)

#### Axis finished
Unscrew and enjoy
![Chamfer rail 320mm axis](./img/15finsihed-axis.JPG)



### Axis plate milling

Follow the same procedure as axis milling. Inside first, then screw down and cutout. Use pocket milling for the big hole. Be carefull with small deep holes. It can be better to mill halfway, and drill the rest manually.
![Chamfer rail 320mm axis](./img/01pockets.JPG)

![Chamfer rail 320mm axis](./img/02through-holes.JPG)

![Chamfer rail 320mm axis](./img/03cutout.JPG)


### Pinion milling

Precut the outside of the pinion to ease the presuusre when milling the teeth. Mill the inside hole to full depth with 3mm or 6mmbit. Check axis fit. Rough mill the pinoin with 2mm bit and 0.03mm offset. Finish mill the pinion. Again, use climb milling.
![Chamfer rail 320mm axis](./img/21pinions.JPG)

Place a screw with spacer and cutout the pinions. Notice how the precision surfaces are all milled before placing the screw and cutting out, sneaky!
![Chamfer rail 320mm axis](./img/22pinoin-cutout.JPG)


### Glide block milling NOTE: *this an old glide block design* check Hattori or Humprhrey design in the repo for examples of latest design*

Make the screw pockets to 7mm depth and the wedge hole to full depth using 3mm bit.
![Chamfer rail 320mm axis](./img/17woodscrew-pocksets.JPG)

Cut out the glide blocks with tabs. Place tabs an non contact surfaces for max precision. We placed these parts too tigth. Be generous with part spacing.
![Chamfer rail 320mm axis](./img/18cutout-with-tabs.JPG)


### Motor plate and wedge milling

Make a pocket to surface down the POM to the thickness you want the motor plate. We made our plates 10mm thick. Make another pocket to 9.7mm depth so your wedge will be 3mm thick, or lasercut it.
![Chamfer rail 320mm axis](./img/19poecket-for-thickness.JPG)

Cut out the motor plate and wedge. Notice tabs on non critical surface on wedge, and screws with spacers holding the motor plate.
![Chamfer rail 320mm axis](./img/20cutout.JPG)


### Assembly

Tap the four holes for the motor plate.
![Chamfer rail 320mm axis](./img/.JPG)

The screw pockets in the glide blocks are autotapping! Just make sure you add spacers.
![Chamfer rail 320mm axis](./img/26autotapping-with-wood-screw.JPG)

![Chamfer rail 320mm axis](./img/27finished-axis-plate.JPG)

Use wedge to fine adjust the pressure the glide block excerts on the rail. Be patient! (wedge and axis not shown in picture)
![Chamfer rail 320mm axis](./img/28plate-on-axis.JPG)

Countersink the screw holes for the motor and screw the motorplate onto the motor.
![Chamfer rail 320mm axis](./img/29motor-plate.JPG)

Sideways drill holes for the set screw in the pinion wall beneath the teeth. There is no set screw visible in this image. Fine adjust the pinion height so there is 0.5-1mm clearing from the rack floor.
![Chamfer rail 320mm axis](./img/30pinion-needs-set-screw.JPG)

Fine tune the position of the motor plate. Make the teeth a bit tight on the rack. Test! You will need to fine adjust pinion pressure and glide block pressure after running in the axis. Remove motors when adjusting the glide blocks. Be patient!
![Chamfer rail 320mm axis](./img/31axis-plate-and-axis.JPG)

![Chamfer rail 320mm axis](./img/32front-side.JPG)

![Chamfer rail 320mm axis](./img/33back-side.JPG)

# Happy axis making!

*Jens Dyvik, march 2017*
*Updated november 2017*





