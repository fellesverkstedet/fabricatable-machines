# Humphrey wood version - how to make
*(page in progress, please help improve this page)*

Wooden humphrey designed by Jens Dyvik, January 2019

[Back to Humphrey overview](README.md)

![](img/wood-humphrey-with-3dprinthead.JPG)
*Wood humphrey with Moarstruder 3D print head, test printing Prusa designed face shield part*

* [Description and lessons learned](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#design-wins)
* [Bill of materials](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#bom)
* [The files](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#cut-sheets)
* [How to fabriacte parts](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#how-to-fabricate-the-parts)
* [Fabrication and assembly gallery](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#fabriaction-and-assembly-gallery)
* [Machine use gallery](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#machine-use-gallery)
* [Future work](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood_version_how_to_make.md#potential-future-work)

### What to expect
* A weak machine that is precise enough to mill 0.3mm wide circuit board traces under low load, but will deflect under heavy cuts.
* Rigidty is about the same as a Shapeoko 3
* A fun machine that is easy to hack and that has such cheap strucutral components that you will not be afraid to play around, crash and experiement with.
* A trojan horse! Once you have this is on your house, you or your organization will be hooked, and if you fabricate a longer bed, you can reuse the gantry and all the electronics for a super cheap 1220mm x 2440mm work area machine.
* Wood creeps a bit over time. Expect about 1-2mm sag along a 1000m axis span.
* A wood Humphrey requires more frequent and careful tuning than a metal Humphrey.

### Design wins
* Performance is amazing given the materials used and gantry length *(OSB, MDF, Polycarnonaete, POM - the gantry span is 1.3meter)*
* Torsion box based gantry and bed shows that you can make a reasonably stiff machine from weak materials
* Wood construction makes it very easy to modify the parts and attatch extra hardware with screws and glue.
* Placing the Y rails underneath the torsion box bed protects them from dust and eases machine access.
* Using dowels pins to register rack and rail positions makes for easy and precise assembly.
* Modular rack pieces aligned with dowels works great and is surprisingly precise.

### Design fails
* Gantry feet can wobble outwards *(rotation along Z axis- forces along X axis)*, making the machine less stiff for cutting along X axis diraction than Y.
* There should have been an extra bearing on the Y axis accariages *(under the bed)*. Currently spring loading the gantry is the only force keeping pinions from moving away from rack.
* Valchromat leaves a lot of dust particles on bearings, requiring frequent cleaning
* KR16 and KRE16 track rollers are too expensive given cost and performance of the machine. Plain 16mm outer iamter bearings with eccentric 3D printed bushings are currently being investigate


### BOM
*(Bill of materials, the stuff you need to buy in order to make one)*

**Stock for milling:**
* For rails and axis carriages: 1pcs - 8mm Valchromat sheet 2440mm x 1220mm *(or similar type of HDF)*
* For gantry and bed torsion box struture: 2pcs - 12mm OSB, Valchromat, MDF or other type of cheap wood composite sheet in 2440mm x 1220mm size
* For rack piecs: 1pcs - 4-8mm thickness polycarbonate 800mm x 320mm *(or other strong plastic type; POM, UHMWPE etc)*
* For pinions: 1pcs  - 12mm POM 150mm x 100mm *(or other strong plastic type)*

**Bearings:**
* 16pcs - [non-adjustable KR16 stud type track rollers](https://www.kugellager-express.de/stud-type-track-roller-kr16-16x6x28-mm)
* 20pcs - [adjustable KRE16 stud type track rollers](https://www.kugellager-express.de/stud-type-track-roller-kre16-pp-16x9x28-mm)

Note May 2020: The KRE bearings are very expensive. Jens Dyvik has developed an alternative solution,a 3D printable bushing in combintion a rualer 16mm OD bearing and M5 screw. Files and documentaion [here](https://github.com/fellesverkstedet/fabricatable-machines/wiki/Modules#eccentric-bearing-bushing). If you decide to 3D print these bushings your will need 36 regular [5x16x5 bearings](https://www.kugellager-express.de/miniature-deep-groove-ball-bearing-625-2rs-5x16x5-mm) and M5 12-16mm machine screw as well as large and small M5 washers. You will also need to modify the cutsheet and update all the 6mm holes to 5mm holes (the holes for non adjustable beaings). The 9mm holes can be left as they are. 3D printing bushings will be about 20% of the cost of KRE track rollers depending on the bearing type you buy. 

**Safety:**
* 1pcs - [Emergency stop buttom](https://www.sick.com/se/en/safety-switches/safety-command-devices/es21/es21-sb10g1/p/p81746)
* 2pcs - [Door switch](https://www.sick.com/se/en/safety-switches/electro-mechanical-safety-switches/i16s/i16-sa203/p/p12219)
* 3pcs - [M20 Cable gland](https://www.sick.com/se/en/m20-gland/p/p315311)

**Electronics:**
* 4pcs - [ihss60 closed loop stepper motor with intergrated driver](https://www.aliexpress.com/store/product/NEMA-24-3N-m-425ozf-in-Integrated-Closed-Loop-Stepper-motor-36VDC-JMC-iHSS60-36-30/1932111_32713260490.html)
* 1pcs - [40000 RPM spindle and driver kit](https://www.aliexpress.com/store/product/250w-40000rpm-ER8-Brushless-spindle-motor-MACH3-driver-DC36V-for-CNC-drilling-milling-carving-kits/1932111_32757165445.html)
* Spindle alternative - [24000rpm 800 watt](https://www.aliexpress.com/store/product/Square-0-8KW-Air-cooled-Spindle-motor-ER11-24000rpm-400Hz-ENGRAVING-MILLING-GRIND-6-5A/907217_32665487318.html?spm=2114.12010612.0.0.54a41c927Yz5F6) and [VFD](https://inverterdrive.com/group/AC-Inverter-Drives-230V/Invertek-Optidrive-E3-1-1-kW-single-Inverter/)
* 1pcs - [36V power supply](https://no.farnell.com/mean-well/hep-480-36a/power-supply-ac-dc-36v-13-3a/dp/2815954?st=power%20supply) *to power the four stepper moters and spindle*
* 3pcs - [proximity switches](https://www.aliexpress.com/store/product/SN04-N-SN04-N2-SN04-P-SN04-P2-DC-NPN-PNP-NO-NC-4MM-DC-10/3105031_32842303693.html) or [green version](https://www.aliexpress.com/store/3105031/search?filterAllSearch=false&freeShipCountry=&minPrice=&maxPrice=&SearchText=sn04)
* 1pcs - Aruduino Nano microcontroller
* 1pcs - Breakout shield with easy connections and optocouplers for sensor inputs and spindle start output *[or fab your own HRBL shield](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hrbl-shield/README.md)*

**Cables:**
* 10m+- - two lead power cable 0.75mm2 cross section or higher
* 10m+- - 6 lead ribbon cable for signals

**Fasteners:**
* 0.5l - standard PVA wood glue
* 100pcs+- - 30mm torx20 wood screws, plus 1pcs wood drill of suitable diamter for predrilling
* 20pcs+- - M5 25mm socket head bolt *(DIN standard machine screw)*
* 8pcs+- - M5 30mm socket head bolt *(DIN standard machine screw)*
* 30pcs+- - M5 nuts
* 50pcs+- - M5 washers
* 12pcs - M5 10mm set screws *(for attaching the pinoins to the motor shafts)*
* 1pcs - M5 tap *(for tapping the set screw holes in the pinoins)*
* 20pcs+- - 6mm wood dowel pins *(for aligning the rack pices to the rails)*

### Cut sheets
Download work in progress cutsheets [here](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/humphrey-large-format-cnc/wood-gantry-files)
![12mm and 8m cut sheet](https://raw.githubusercontent.com/fellesverkstedet/fabricatable-machines/master/humphrey-large-format-cnc/img/wood-version-cut-sheets.jpg)


### How to fabricate the parts
Download the [cutsheets](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/humphrey-large-format-cnc/wood-gantry-files), order materials then CNC mill all the parts at your local fab lab, makerspace or hackerspace *(more info pending)*. See picures bellow.

You can also 3D print the four [pinions](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/wood-gantry-files/pinion_for_3Dprinting.stl) with fabrication service like Shapeways. We reccomend SLS nylon printing for maxiumum strength and wear resistance.

Vcarve and gcode files (including log files for aproximate milling times) have been added [here](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/humphrey-large-format-cnc/wood-gantry-files/Vcarve%20and%20gcode)

### How to assemble
Step by step instructions are pending, for now you can study the [3D assembly STEP or Rhino file](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/humphrey-large-format-cnc/wood-gantry-files) for guidance. There also lots pictures further down on this page.

You can also check out the new [Fusion 360 file](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/humphrey-large-format-cnc/wood-gantry-files/named-grouped-in-the-order-of-assembly-humphrey-wood-version-quarter-length-bed-v60.f3d) where all the parts have been named, put into groups and put into a suggested order of assembly. Tip: expand a group of bodies all the way, uncheck the lightbulbs for the individual bodies, not for the groups(!), and work your way through the assembly by turning on the lightbulbs starting at the top. Todo: mark the individual CNC-milled parts with an unique number, [1], [2], [3]... [148] etc and update the cutsheets with these numbers using blue stroke Hershey-text (for example using inkscape). When the 3D assembly CAD files and the cutsheets both have unique identification of the parts it will be much easier to make clear assembly instructions and to communicate about parts (for example when ordering spare parts, or talking about design improvemnts for a specific part).

### How to wire electronics
Step and direcion signals from microcontroller to each of the intergrated motor drivers *(more info pending, also see [grbl documentation](https://github.com/gnea/grbl/wiki))*

### How to configure
Steps per mm = 40 *(more info pending)*

### How to tune

Carefully adjust the eccentric bearings towards the rail surfce with the help of an hex/allen key. No bearing should be able to spin freely (in the air), but dont tighten too hard as this will create prematre wear of the valchromat rails. When you lock the position of an axis with one hand and spin a bearing with the other, it should take some force to make it rotate/slip against the wooden rail. If you cannot spin it at all( make it slip) it is too tight and if it spins freely with no force it is too loose.

The sideways bearings on the Y axis (gantry feet) are the most difficult to tune. You migth run out of tuning range on the eccentric bearings. The good news is the axis carriages are designed as a separate part that attaches to the gantry feet. So you can unscrew the and drill the holes for the securung bolts a little larger. This allows you shift the entire carriage closurer to the rail.

Before you start tuning the bearings it can be convenient to disenage the pinions from the rack. Once the bearings are turned you can reposition the pinions against the rack. The motor with pinion should be held against the rack when you tighten the screws for the motor plate. Gently hold the motor with pinion against the rack, then tighten the screws on the motor plate *(too much pressure creates uneven motion while too much distance from the rack creates backlash)* It should not be pressed with force against the rack. It happens easily that the pinion gets mounted too hard against the rack.

### Hard endstops for 3d printing
[endstop](https://drive.google.com/file/d/1bGgOnYXn5w3qPKVvl1ZfoLH06Uf3-SXC/view)  
[Design files and readme](\wood-gantry-files\Hard endstops 3d print)

### Fabriaction and assembly gallery
![](img/wood-humphrey-making-of-milling-osb.JPG)
*milling osb*

![](img/wood-humphrey-making-of-milling-valchromat.JPG)
*milling-valchromat*

![](img/wood-humphrey-making-of-gantry-parts.JPG)
*finsihsed gantry parts*

![](img/wood-humphrey-making-of-dry-assembly.JPG)
*dry-assembly*

![](img/wood-humphrey-making-of-milling-rack.JPG)
*milling rack pieces, I used polycarbaonete because we had some left in the lab*

![](img/wood-humphrey-making-of-gluing-gantry.JPG)
*gluing the gantry*

![](img/wood-humphrey-making-of-gluing-torsion-box.JPG)
*gluing the torsion box*

![](img/wood-humphrey-making-of-screwing-torsion-box.JPG)
*Screwing-torsion-box, I reccomend counter sinking the holes*

![](img/wood-humphrey-making-of-mounting-rails.JPG)
*mounting rails*

![](img/wood-humphrey-making-of-adding-rack-pieces-to-gantry.JPG)
*adding rack pieces to gantry*

![](img/wood-humphrey-making-of-joined-rack-detail.JPG)
*joined rack detail. The burr comes from doin a finishing pass with too little material left. Luckily the burr comes of during use.*

![](img/wood-humphrey-making-of-gluing-z-axis.JPG)
*gluing z axis. Note the trapped nut for the spindle and how the dowel pins helps register the rack*

![](img/wood-humphrey-making-of-gantry-and-y-carriages.JPG)
*gantry and y carriages glued and ready to be joined by machine screws*

![](img/wood-humphrey-making-of-inserting-kr16-track-rollers.JPG)
*inserting KR16 and KRE16 track rollers*

![](img/wood-humphrey-making-of-nut-space-too-tigth-for-wrench.JPG)
*These slots are too narrow and needs to be filed/carved larger by hand. Updated design is pending, April 20202*

![](img/wood-humphrey-making-of-adding-gantry-to-bed.JPG)
*adding gantry to bed*

![](img/wood-humphrey-making-of-y-rail-detai.JPG)
*Note how the skirt helps protect the Y rails from dust.*

![](img/wood-humphrey-before-mounting-motors.JPG)
*before mounting motors*

![](img/wood-humphrey-making-of-prepping-motors-with-motor-plates.JPG)
*prepping motors with motor plates*

![](img/wood-humphrey-making-of-mounting-pinions.JPG)
*mounting pinions. Note the use ofcaliper to get a precise position on the motor shaft*

[![Wood_humphrey on bitraf](img/Hello_Wooden_Humphrey.jpg)](https://drive.google.com/drive/folders/1xZQbLe3GOX46Vw-eJBSd3kV14ufqdYzH)
*All valchromat humphrey*

### Machine use gallery

![](img/wood-humphrey-alu-test-cut.JPG)
*alu test cut with 3mm bit. Lots of chatter, but possible. A finishing pass would help alot with precision.*

![](img/wood-humphrey-milled-pcb.JPG)
*FAB isp circuit test. The traces are 0.3mm wide!*

![](img/wood-humphrey-printing-spiral-vase-box.JPG)
*printing-spiral-vase-box*

![](img/wood-humphrey-milling-pmma.JPG)
*milling pmma with a 1mm bit*

![](img/wood-humphrey-milling-pmma-rack-precision-comp-low-and-high-speed.JPG)
*The top rack was done at low feedrate and 10000rpm on the spindle. The bottom rack with agrresive feedrate and acceleration and 60000rpm on the spindle. Note the huge difference in precision. A wooden humphrey can only be precise under low loads.*

![](img/wood-humphrey-with-3dprinthead.JPG)
*humphrey with Moarstruder 3d print head*

![](img/wood-humphrey-printing-prusa-covid19-faceshield.JPG)
*printing prusa covid19 faceshield, RC3. The extrusion is not well calibareted, and there is a little too much warping. But thank to the 1.2mm nozzle extruder, it takes only 40 minutes to print this part.*

![](img/wood-humphrey-milling-printed-saw-attachment.JPG)
*3D printing and finsish milling a saw attachment*

![](img/wood-humphrey-with-printed-and-milled-saw-attachement.JPG)
*humphrey with printed and milled saw attachement*

![](img/wood-humphrey-test-sawing.JPG)
*test sawing*

### Troubleshooting

The follwing picture was captured by Haakon Walseng, who built a wood humphrey in the summer of 2019. He thought first that the damge to the rack was from the forces of repeated homing. But the direction of tooth breakage shows that it was caused by physically crashing the machine in combination with the rack being attached too loosely and shifted away. See numbered notes bellow:

![](img/wood-humphrey-loose-rack-trouble-shooting.png)

1. The direction of force applied to the broken tooth
shows that the damage was caused from
physically crashing the machine.
Not from repeated homing which would have created damage in the opposite direction.
2. The lower part of rack the tooth is only half broken,
indicating that that the clearence between pinion and
rack mounting surface was too high
3. The rack has shifted more than 1mm from
its correct location. The locating wooden dowels should have
been left in the hole. And the screws should
have been tighter.
4. It was only the screw head that kept the rack from shifting even further away from its correct location.

### Potential future work

![render of wood version](https://raw.githubusercontent.com/fellesverkstedet/fabricatable-machines/master/humphrey-large-format-cnc/img/wood-version-render.jpg)

Humphrey needs a weel design enclosure, but it might be that the [Hübel](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hubel-home-friendly-cnc-mill/readme.md) machine in development is better solution for and enclosed machine

### Documetation at external sources
* Wooden Humphrey build by Haakon Walseng: [Media files](https://drive.google.com/drive/folders/1xZQbLe3GOX46Vw-eJBSd3kV14ufqdYzH)
*Unnamed and unsorted as of 21nd November 2019. Todo: Add pictures and commentary to own build readme. Feel free to upload and add pictures to this readme.*

*Shortbed version inside safety enclosure*

[Back to Humphrey overview](README.md)
