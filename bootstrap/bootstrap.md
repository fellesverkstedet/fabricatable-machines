# Bootstrap CNC mill
Made with a 3D printer, a laser cutter and a plywood saw.

![](img/persp.JPG)
*Full sheet CNC milling machine, work area 2,6*1,2m*

## BOM
* 12 mm Plywood rails, 99% straight cuts. Glue and nailgun assembly. Use 8mm for structural parts = lighter = faster.
* Integrated stepper motors 3Nm
* Hrbl controller
* Laser cut plastic racks
* 3D printed pinion Ø6mm teeth
* 48 of type 608 bearings mounted on 3D printed simple holders
* M8 Hex head screws, washers and locknuts (Some M5 will also be needed)
* Spindle, 800W 24000 rpm, air cooled + VFD.
* Dust extraction

# Files

[Full size Fusion360 model (no rollers)](https://a360.co/33g6WgV)

## Images

* [images](img/)


## Roller holders
![](img/3D-printed_rollers.JPG)

* Most tuning is made by changing shims. Locknuts are important, the wood and plastic will not withstand full M8 pretension = would come loose. The wood will shrink and the plastic creep so some tuning will have to be done after a while but hopefully it wil be very robust.
* Needs many walls and either controller infill zones or 100% fill, will take ages to print.
* 48 holders are needed, 4 pinions.

[Fusion360 link](https://a360.co/2pHU1Xv) (Fully jointed)

## Guessed performance 
* Errors under 1 mm should be very realistic, errors under 0,5mm is optimistic.

## Todo
* Finish rough design of roller holders, testprint with high / max infill for strenght.
* Make a test axis and test them under load. 3D print flex and wood deterioration from roller load is very interesting.
* Add rollers to machine layout.
* Import large teeth rack and pinion from wiki. Large teeth = Lower maximum performance but should be stronger.
* Decide on axis width, now all have 120mm = low on X and hight on Y, ok on Z?
* Decide on fasteners, 3D prints with trapped nuts or metal threaded inserts?
* Add probing plate
* Consider hiding Y rails under bed for dust protection. Add spacer.


## Future development
* If tuning does not stay tight, add tuning features to prints

