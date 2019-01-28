# Making the aluminium parts

These parts are milled from 200x8mm flat bar aluminium 6082-T6 grade. We buy them from [Astrup AS](https://astrup.no/).

Total needed aluminium stock is five 3 m long pieces, but we strongly recommend buying an extra piece, then the total is 18 meters of 200x8mm aluminum flat bar, cut into six 3 m long pieces. 

The CNC we used for manufacturing has a 2440 mm long work area, show here in relation to the CAM layout for all parts:

![Alu parts](./img/parts/all_plates.JPG)

Practically the work will be split up into one piece per session since they take many hours per stock.

Recommended changes:
* When milling. Make sure there is a loose fit tolerance between the X-rail and the gantry, otherwise it's hard to fit it on and impossible to change it.

## Files

* Full 3D model files online view [(Fusion)](https://a360.co/2AF6yjp) 
* [Full step model](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/humphrey-large-format-cnc/humphrey_v3/Assembly_h3%20v5_step.zip) 
* [All step files with the aluminium layouts](./parts/alu_parts_STEP.zip)

## Recommend milling sections:

* Mega_nuts_long_motor_plates_2_motor_spacers [Fusion CAM](https://a360.co/2PiNYRo)

![Alu Parts](./img/parts/Mega_nuts_long_motor_plates_2_motor_spacers.JPG)

* Gantry bridge [Fusion CAM](https://a360.co/2PliVEu)

![Alu parts](./img/parts/Gantry_bridge.JPG)

* Y-rails [Fusion CAM](https://a360.co/2MhuMFD)

![Alu Parts](./img/parts/y-rails.JPG)

* Roller axis plates [Fusion CAM](https://a360.co/2Bg37jq)

![Alu Parts](./img/parts/Roller_axis_plates.JPG)

* X_Z_rails_cores [Fusion CAM](https://a360.co/2PhWqAk)

![Alu Parts](./img/parts/X_Z_rails_cores.JPG)

* 2_motor_plates_z_homeing_plate [Fusion CAM](https://a360.co/2PiNYRo)

![Alu parts](./img/parts/2_motor_plates_z_homeing_plate.JPG)

## How to mill aluminium parts

We use VHF single flute milling bits for milling aluminium dry, that is without cooling. Always use new bits or bits that are only used in aluminium.

* [Aluminium milling advice in the wiki](https://github.com/fellesverkstedet/fabricatable-machines/wiki/Fabricatable-axis#how-to-fabricate) Get the feeds and speeds here. (These instructions are for an older version.)

## Worn bits = sticky chips

Provided that you are using the correct feeds and speeds you can easily see on the chips if your bit is still nice and sharp. You will use up one or two bits during this project so this is something you NEED to keep an eye on. 

* Fresh bit = The chips do not stick together or to the stock
* Used bit = the chips stick together in slots but can be brushed away
* Worn bit = The chips stick together in slots and can not be brushed away, this bit will break if you go on.

Use good dust extraction to avoid leaving loose chips on the part being milled, this causes uncesessary chip re-cutting and wears out your bit faster. 

### Hold down of stock

When milling aluminium it's very important that the stock does not vibrate or slide around during milling. We like to avoid using clamps or having to hand drill hold-down holes since that can lead to uncessecarry collissions.

Instead we use a few pieces of valchromat to make a quick jig and to clamp down the aluminium pieces with. This way we know exactly where it is and that it is safely secured with minimal risk of collissions.

**Hold down steps:**

* Make holddown pieces
* Mark the table by milling 0.2 mm into it where the stock should go 
* Screw the jig pieces to the table so that they overlap the milled line a few millimeters.
* Run the marking milling job again, use the same gcode file, this trims the jig pieces.
* Position the aluminium up against the jig pieces
* Use the valchromat clamp pieces to clamp down the aluminium against the table. 

The alumium is now clamped to the table in a known position.

**Milling steps:**

Having a good sequence for milling aluminium helps keeping track of holddowns and avoids loose pieces, saving you from unecessary broken bits or parts flying away. It can also save time since it reduces tool changes. We strongly recommend planning out the whole job before starting to mill since it otherwise is easy to get "lost" trying to see what is what when you are halfway through a job.

* First run a drilling job with a 4 mm bit for all holddown holes that are there to secure loose scrap pieces and the scrap "skeleton". Make sure to have minimum two holes in all parts that will be loose. 9 / 10 times one screw is enough for small pieces but it sucks to damage a bit on the 10th. (Helical drill operation to a 5 mm diameter for this works great in Fusion360).  
* Now put screws in ALL the holes you just drilled. No washers needed. Do this before drilling other holes that you WILL confuse them with. Don't remove the valchromat clamps yet.
* Now the aluminium is firmly secured and you can run all small hole operations that require the 4 mm bit.
* Time to change bit to 6 mm and probe the height.
* Start with milling away all small scrap pieces that were to small to secure with two screws. These can be <10 mm small and still ruin your day (break your bit when they come loose) so look extra carefully for them in the CAM simulation.
* Mill all pockets using a positive tolerance to allow a loose fit.
* Now you can remove the clamps.
* Time to mark the part outlines! We do this to give a visual indication on the part were the cuts will go, this way it is MUCH simpler to see where to put hold down screws before cuttining loose all the parts. This takes no extra time since we will do 4 passes + finish pass anyway. Practically this will just add a pause after the first pass. 
* Screw down all the parts using screws with wooden washers. Be generous and rather use more screws than less. Thanks to marking the part outlines in the previous steps you can see exactly where the mill will go.
* Run the remaining cutout passes with a 0.1mm finishing pass to make it look good.
* Run any tolerance adjustment passes if necessary.
* Check if everything is done
* Remove one part and test the fit
* Remove the rest

[Back to assembly main page](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/humphrey-large-format-cnc/humphrey_v3#how-to-make-humphrey-v3)
