# Hank - medium format CNC mill
*March 2017*

![parts](./img/hank-part-overview.jpg)
*Bought parts on the left, self fabricated parts on the right*

![hank](./img/hank-first-cut.jpg)
*Hank after his first test job*

* A gantry based CNC milling machine where a substantial amount of the parts can be fabricated on a CNC mill
* Linear rails, rack, pinion and glide blocks can all be fabricated on a conventional CNC milling machine
* Based on the chamfer rail system in this repo
* Work area is 600mm x 300mm x 50mm
* The rack and pinion has 4.444444 steps per mm with a 200 step motor

**Design wins**
* It is possible to build a big machine with the chamfer rail system
* Making long rails with the chamfer rail system is easy and fast
* Combining standard proportion chamfer rails with custom machine parts *(axis plate, bed and gantry)* works great.
* Pure POM/Delrin glide blocks on aluminum rail is ok, but not optimal. Next is testing PTFE infused POM. Worst case we will have to revert to brass for glide surfaces.
* Gluing up a stack of HDF plates for the bed and gantry works great
* Finish milling the HDF stack on the bed of a larger CNC mill works great, but requires high level CNC milling skills
* Pockets for self threading wood screws in the POM glide block and machinebed sandwich works great

**Design fails**
* The contact sufrace of the glide blocks is too small for heavy loads. The combination of a slightly skew glide block with small contact surface are makes the POM blocks scratch the alu rails. This quickly became a problem on the X axis because the two glide blaocks carried the entire load of the gantry. *(big single block instead of two small have been successfully tested)*
* It is difficult to make very long and precise rails with the chamfer rail system. *(our 900mm long X axes were a bit higher in the middle during chamfer millng)*
* The two motors on the X axis should be more towards the front to counter balance the weight of the gantry, z axis, spindle and motors
* Dust control on the rails and rack still need to be developed. *(early tests with felt pads seem promising)*



### Source files

[Rhino source](./hank-cnc-mill-3dm.zip)

[STEP 3D](./hank-cnc-mill-stp.zip)

[DXF 2D](./hank-cnc-mill-dxf.zip)


### To do

* Make X rail be able to move smooth with the heavy weight of the gantry *(larger glide block has improved the situation significantly)*
* Find a way to stop the X rails to scratch/wear from the pressure of the glide blocks *(lining block with PTFE could be great)*
* Make dust shoe for extraction
* Make sound and dust insulating box
* Make safety power switch on box
* Fix end stops on all axes
* Make Z plate for auto homing
* Mod various post processors for starting with autohoming
* Do extensive testing
* Improve documentation
* Test self-replication *(first set of chamfer rail axes have already been made for Fellesverkstedets Fab Academy students)*


### Handy replicape commands

* M119 for get endstop states
* G92 for custom home example: G92 X0 Y0 Z0

### the Making off Hank

![hank cad](./img/hank-cad-4view.jpg)
*CAD drawing of Hank*

![rails](./img/hank-chamferrails.jpg)
*The self fabricated rails, note multiple Z axis for hotswap*

![bed](./img/trimming-hdf-sandwhich-for-bed-and-gantry.jpg)
*Finish milling bed to precise dimensions, note the pockets for aattaching the rails with wood screws*

![scrape](./img/reparing-scraped-rail-after-first-cut.jpg)
*Repairing the damaged rails after they got scratched by the small POM bocks*

![new glide block](./img/new-wider-glide-block.jpg)
*Upgrading the X xis glide block to mega contact surface*

![making chamfer rail](./img/hank-milling-axis-for-anew-machine.jpg)
*Hank milling chamfer rails for a new machine*

![Glide blocks](./img/hank-miling-glide-blocks-for-a-new-machine.jpg)
*Milling the glide blocks for a new axis*

![New chamfer rails](./img/hank-making-new-axes-for-fab-academy-students.jpg)
*First self replication test with two chamfer rails*

![Axis in use](http://archive.fabacademy.org/archives/2017/fablabverket/students/100/web/assignments/week11/mech/3.jpg)
*Fellesvertedets Fab Academy 2017 students, Hanne Eriksen and Jakob Nilsson, building a ping pong installation with axes fabricated by Hank*