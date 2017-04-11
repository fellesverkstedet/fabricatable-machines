# Hank - medium format CNC mill
*March 2017*

![Bought parts on the left, self fabricated parts on the right](./img/hank-part-overview.jpg)
*Bought parts on the left, self fabricated parts on the right*

![Hank after his first test job](./img/hank-first-cut.jpg)
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
* The machine is able to mill 5mm thick steel

**Design fails**
* The contact sufrace of the glide blocks is too small for heavy loads. The combination of a slightly skew glide block with small contact surface are makes the POM blocks scratch the alu rails. This quickly became a problem on the X axis because the two glide blaocks carried the entire load of the gantry. *(big single block instead of two small have been successfully tested)*
* It is difficult to make very long and precise rails with the chamfer rail system. *(our 900mm long X axes were a bit higher in the middle during chamfer millng)*
* The two motors on the X axis should be more towards the front to counter balance the weight of the gantry, z axis, spindle and motors
* Dust control on the rails and rack still need to be developed. *(early tests with felt pads seem promising)*
* The glide blocks requires very carefull calibration
* The pinion set screws are critical, there should be two set scrwes at 90degress on the pinions



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
* Make BOM (bill of materials)
* Test self-replication *(first set of chamfer rail axes have already been made for Fellesverkstedets Fab Academy students)*


### Handy replicape commands

* M119 for get endstop states
* G92 for custom home example: G92 X0 Y0 Z0



### CAD model

![hank cad](./img/hank-cad-4view.jpg)
*CAD drawing of Hank*



### Fabricating chamfer rails
Full tutorial on milling Chamfer rails [here](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/chamferrail/README.md)

![Engraving source URL](./img/engraving-docu-link.jpg)
*Engraving source URL*

![X-rails finsihed](./img/x-rails.jpg)
*X-rails finsihed*

![The self fabricated rails, note multiple Z axis for hotswap](./img/hank-chamferrails.jpg)
*The self fabricated rails, note multiple Z axis for hotswap*



### Fabricating POM parts

![Milling motor plates and glide blocks](./img/motorplates.jpg)
*Milling motor plates and glide blocks*

![Milling POM pinions](./img/milling-pinions.jpg)
*Milling POM pinions*



### Fabrictaing axis plates

![Milling axes plates](./img/axes-plate.jpg)
*Milling axes plates*

![Registrating ZY-axis plate for twosided milling](./img/registation-twosided-yplate.jpg)
*Registrating ZY-axis plate for twosided milling*



### Fabricating bed and gantry

![Milling bed and gantry sandwich](./img/bedandgantry1.jpg)
*Milling bed and gantry sandwich*

![Gluing bed and gantry sandwich](./img/bedandgantry2glued.jpg)
*Gluing bed and gantry sandwich*

![Finish milling bed to precise dimensions, note the pockets for attaching the rails with wood screws](./img/trimming-hdf-sandwhich-for-bed-and-gantry.jpg)
*Finish milling bed to precise dimensions, note the pockets for attaching the rails with wood screws*



### Assembly

![Bought parts on the left, self fabricated parts on the right](./img/hank-part-overview.jpg)
*Bought parts on the left, self fabricated parts on the right*

![Attatching rails with wood screws](./img/attaching-rails.jpg)
*Attatching rails with wood screws*

![Attaching X axis plate to gantry](./img/attaching-x-axis-plate-to-gantry.jpg)
*Attaching X axis plate to gantry*

![Attaching glide blocks with wood screw](./img/attaching-glide-blocks.jpg)
*Attaching glide blocks with wood screw*

![Bed, gantry and YZ-axis plate](./img/bed-gantry-and-zy-axisplate.jpg)
*Bed, gantry and YZ-axis plate*

![Adding endtops](./img/adding-endstop.jpg)
*Adding end stops*

![Wiring Replicape controller, drivers and powersupply](./img/wiring-electronics.jpg)
*Wiring Replicape controller, drivers and powersupply*

![Calibrating controller and fixing cabling](./img/almost-done.jpg)
*Calibrating controller and fixing cabling*



### Hello world test mill

![Hank after his first test job](./img/hank-first-cut.jpg)
*Hank after his first test job, making parts for Alex wooden boat*



### Working on fixing glide blocks scratching X rails

![scrape](./img/reparing-scraped-rail-after-first-cut.jpg)
*Repairing the damaged rails after they got scratched by the small POM bocks*

![new glide block](./img/new-wider-glide-block.jpg)
*Upgrading the X xis glide block to mega contact surface*



### Testing self replication

![making chamfer rail](./img/hank-milling-axis-for-anew-machine.jpg)
*Hank milling chamfer rails for a new machine*

![Glide blocks](./img/hank-miling-glide-blocks-for-a-new-machine.jpg)
*Milling the glide blocks for a new axis*

![New chamfer rails](./img/hank-making-new-axes-for-fab-academy-students.jpg)
*First self replication test with two chamfer rails*

![Axis in use](http://archive.fabacademy.org/archives/2017/fablabverket/students/100/web/assignments/week11/mech/3.jpg)
*Fellesverkstedets Fab Academy 2017 students, Hanne Eriksen and Jakob Nilsson, building a ping pong installation with axes fabricated by Hank*



### Testing performance

![5mm steel](./img/dry-machining-5mm-steel.jpg)
*Dry machining 5mm low carbon steel in one pass. Trochoidal milling at 50mm/s, 10% stepover. Using a 3 flute 6mm bit at 30.000RPM. Router is a lowcost Makita RT0700C*

![ISP PCB](./img/hank-test-pcb-mill1.jpg)
*Testing precision by milling circuit for ISP programmer. No-tune up between steel milling and this test. Circuit milled with a wood v-bit, not proper pcb bit*

![ISP PCB2](./img/hank-test-pcb-mill2.jpg)
*First test on the right was milled at too high speed (15mm/s with single flute V-Bit bit). The more succesfull test on the right was milled at 6mm/s.*