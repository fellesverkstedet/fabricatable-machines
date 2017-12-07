
# Humphrito Medium format CNC 

A medium sized gantry based CNC machine made to be able to machine an area the size of a quarter of a standard 1200x2500mm plate.

See also (Humphrey)[/humphrey-large-format-cnc/README.md] for a full size machine.

### Latest developments:

### New model and more parts

If you want to see it all together, use the latest step model.
I could not export the assembly as f3d from fusion so I uploaded it in parts.

![](img/overview.JPG "Full assembly")

![](img/x-carriage.JPG "The X carriage")

![](img/z-axis.JPG "The Z axis with spindle mounting holes and trapped nuts on the back.")


### Joint experiment
[Fulltext Joinery experiment](experiment.md)
![](img/experiment/screw_locked_finger_joint_test.jpg)

In development. Design files in Fusion360, step and Rhino format.

The Fusion 360 files are further progressed and will be completed and milled shortly. 

### Design decisions

#### Size and orientation
* Workarea 1200x600 mm.
* Should fit on top of a standard shipping pallet when mounted vertical.
* Z is the normal axis from the spoilboard.
* Y i vertical
* X is horizontal

![](img/humphrito-sketch-on-pallet.jpg)

#### Materials
* 12 mm POM plastic sheet for the pinions and glide blocks.
* 16 mm Valchromat HDF sheet for the frame and ribs of the torsion box holding the spoilboard and some key parts of the gantry.
* 8 mm Valchromat HDF sheet for all other parts, including rails with rack, these can be swapped to aluminium later.

#### Fasteners
* M5 hex head machine screws for rails
* L50x5Ø 30mm Threaded wood screws for structure

### Notes on the Fusion model:
*Must be fixed:*
* Holes for easy glueing of spoilboard
* Fingers for aligning the tosion box to the y-axis and backing
* 8mm X and Z axis plates
* 8mm All Motor plates, sketches exist
* 8mm z-axis rail, spacer and backing   ((perhaps not enought 8mm material)
* Add perforation and guide for changing to alu later
* Add rack teeth (will lag so I do this last)
* All POM pieces (glide blocks and pinions) Sketches exists
* CAM

*Before milling*
* Test screw slot grip
* Tune dimensions for nut sizes and for screw lengths

*Check*
* Issues - enhancements
* Can the Y range be increased so that we have acces to the work area above the gantry in resting position

## Safety and human interaction

The machine has many moving parts. It should be mounted inside an enclosure so that no-one can reach in and get fingers trapped or touch a powered spindle. All power should be cut when the enclosure is open. Cutting the power means that the gantry wants to slide down to the bottom, making tool change awkvard. Therefore a spring could be used to keep the gantry somewhere where the spindle end is easy to reach. (A counter weight increases the mass that has to be accelerated.)

**User safety rules:**
* Mount the machine securely so that it can not fall over under operation.  
* Needs to be safe when power is removed 
* Connect emergency stop button so that it cuts all power in an easy to reach place

## Images

![stock.JPG](img/stock.JPG "top 8mm bottom 16 mm valchromat")
![front.JPG](img/front.JPG "front view")
![side.JPG](img/side.JPG "side view")
![assy.JPG](img/assy.JPG "top view")
![assy.JPG](img/humphrito-core-platform.jpg "Rhino model")
![assy.JPG](img/humphrito-sketch-on-pallet.jpg "Rhino model")
![assy.JPG](img/humphrito-sketch-on-pallet2.jpg "Rhino model")
