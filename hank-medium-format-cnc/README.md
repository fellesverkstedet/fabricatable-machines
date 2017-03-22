# Hank - medium format CNC mill
*March 2017*

![parts](./img/hank-part-overview.jpg)
*bought parts on the left, self fabricated parts on the right*

![hank](./img/hank-first-cut.jpg)
*Hank after his first test job*


* A gantry based CNC milling machine where a substantial amount of the parts can be fabricated on a CNC mill
* Linear rails, rack, pinion and glide blocks can all be fabricated on a conventional CNC milling machine
* Based on the chamfer rail system in this repo
* Work area is 600mm x 300mm x 50mm
* The rack and pinion has 4.444444 steps per mm with a 200 step motor

We are having challenges with the alu rails and pom glide blocks. It seems that the heavy weight creates alu dust. and the dust builds up and scratches the alu glide surface. this is only a problem so far on the x axis, since it carries.the weight of the gantry. we thought first it was wood dust scraping, but is seems to be alu dust, or abrasive from the metal grinder about 3m away from the machine. next we will try different glide block geometry, and different materials

[Rhino source](./hank-cnc-mill-3dm.zip)

[STEP 3D](./hank-cnc-mill-stp.zip)

[DXF 2D](./hank-cnc-mill-dxf.zip)

### To do

* Make X rail be able to move smooth with the heavy weight of the gantry
* Find a way to stop the X rails to scratch/wear from the pressure of the glide blocks
* Do extensive testing
* Improve documenation
* Test self-replication

### Handy replicape commands

* M119 for get endstop sates
* G92 for custom home example: G92 X0 Y0 Z0


![rails](./img/hank-chamferrails.jpg)

![bed](./img/trimming-hdf-sandwhich-for-bed-and-gantry.jpg)

![scrape](./img/reparing-scraped-rail-after-first-cut.jpg)