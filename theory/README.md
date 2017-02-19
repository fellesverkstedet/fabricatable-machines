*february 2017*

# Motivation and thought

### Why make your your own machines

* for freedom *(enables us to build any kind of machine we dream of)*
* for budget *(DIY can be cheaper than buying, especially if it is a custom machine)*
* for scaling capacity
* for building self confidence *(if I can build it I can fix it, and I know how to use it)*
* for gaining insight into technology
* for sport *(it is more rewarding and less silly than kicking a leather ball)*

We like learning by doing. Replicating a machine is like learning an instrument by playing someone elses music, before you start composing your own. Its totally ok to be a cover band.


### Potential consequences from making your own machines

Bank interests choke creativity. Growing your own equipment is a fantastic alternative to a big bank loan with ticking interests. *(large monthly payments force risk averse usage and business models)*

Server farm metaphor: Many cheap machines outperform one mega fancy machine. Examples: prusa, lulzbot etc.

**DIY enables scaling with sneaky comfort**. Example of developing a business:
* 1 Fun hobby *(I have made a machine)*
* 2 Serious hobby *(I have made a good machine)*
* 3 Part time job *(I use my machine to make things for other people)*
* 4 Full time job *(my job sucked but this is awesome, now I use multiple machines to make lots of things for other people)*
* 5 Running a company with multiple co-workers and large capacity *(DIY is boring, lets Do It Together)*

**It can also enable natural growth of community workshops** *(Fab Labs, makerspaces, hackerspaces etc)*:
* 1 Fun hobby *(I have made machine)*
* 2 Serious hobby *(I have made good machine)*
* 3 Become a part time community fabrication facilitator *(I help other people make things with my machine)*
* 4 Become a full time community fabrication facilitator *(I help lots of people make things with multiple machines)*
* 5 Running a complete Fab Lab *(we help lots of people make things with multiple machines, and take part in a global network of people collaborating and sharing knowledge)*



#  Design considerations

### Guidelines
* Digital means distributable and reproducible
* Design for reproducibility: Don’t make it fancy, make it simple
* Optimize your bill of materials (BOM). Use parts that are cheap and easy to source
* Sticking to standard fab lab inventory machines. Metaphor: Native browser compatibility vs custom plugins
* Design for simple machine use, not fancy techniques. Avoid two-sided milling if possible. Tolerate badly configured machines. Accept runout, overhangs etc.
* Reduce time required to machine/print/cut. If it is easy and fast to do, it will be done often.
* Digital fabrication means cheap complexity in part. Increase part complexity to reduce part count and assembly time.
* Make it simple to assembe. A machine should ideally be easy to build and not require handcraft skills.
* Make it easy to tune and maintain. *(The holy grail is to make a reliable machine that can easily be operated by others. Most DIY machines become dust collectors)*
* How far do you want to go? Buy a kit from china and make the box around it? Or push the boundaries of  DIY level and machine design freedom?


###Choosing a digital fabrication technique

**3D printers**

the good:
* Easy complexity in parts, means low part count
* Easy to operate
* Common practice. Thingiverse and reprap

the bad:
* Slow
* Unreliable
* Inaccurate – (everything warps and parts require heavy post processing: filing, drilling, edge breaking etc.)
* Weak materials (even fiber reinforced filaments suffer from z axis delamination)
* Only suitable for making small parts


**Laser cutters**

the good:
* Super easy to use
* Fast
* Reasonably accurate *(hampered by concave laserbeam and mirror alignment*

the bad:
* Only 2D cut and raster engrave with tricky Z depth
* Weak materials *(Delrin/POM is the only lasercutable material you can't break with your fingers)*
* Designing 2D to become 3D requires more skills and assembly


**CNC mills**

the good:
* Very fast *(a ShopBot alpha cut at the speed of a 700w lasercutter)*
* Very accurate
* Real hardcore materials *(Aluminum, brass, bronze, steel and thick Delrin/POM)*
* High resolution 3D surfaces
* Reasonable geometry complexity
* Can make tiny and precise parts
* Can make really big parts

the bad:
* Twosided milling or mulitpart assembly require more design and operator skill
* Most Fab Labs have shopbots in terrible condition *(unreliable, or low performance)*
* Parts needs fixturing, requires skill and planning
* Big machines are scary
* Current software toolchain sucks


### Axis types
* Tensioned wire - example: Thorbjørns hang printer
* Articulated joints - example: Thor DIY robot arm
* Unsupported linear rail - example: most diy 3D printers, Nadyas MTM stages
* Supported linear rail - example: most standad fab lab machines, the chamfer rail system
![Axis types](./img/axis-types.jpg)
Our chamfer axis design fascilitates both supported and supported linear axis config. For making good CNC milling machines, we bolt the axis to the frame or gantry of the machine at even intervals.


### Drive types
* Simple wire
* Timing belt
* Lead screw
* Rack and pinion
* Linear motor

We have identifed rack and pinion as the easiest system to fabricate from scratch using standard fab lab machines (ShopBot). In order to have as little backlash and as high resolution/torque as possible we have developed [our own](https://github.com/fellesverkstedet/fabricatable-machines/Module development/Roller rack and pinion) geometry generator for CNC mill friendly rack and pinon.


### Motors

Three levels of steppers price and performance
* Wantai
* Oriental open loop
* Oriental closed loop

Closed VS open loop. The simplicity of steppers


### Motor drivers
* Polulo - integrated in ramps
* Toshiba - danieles satsetp
* Oriental motors paired motor and drivers


### Controllers
**Stand alone:**
* Ramps 1.4
* Replicape

**Tethered to a PC:**
* LinuxCNC
* Gestalt nodes
* Stepoko board
* Smoothieboard
* TinyG

### Controll software:
* Windows terror
* Linux terror
* Custom full screen skin dream *(what if you could see only the buttons you need, yet have easy access to advanced settings?)*


### CAM software:
**Browser based**
* Fab modules *(score:6)*
* Mods *(score:7)*
* Makercam *(score:3)*

**Desktop based**
* V-Carve *(score:5)*

**CAM inside CAD program**
* Fusion360 *(score:8)*
* Freecad *(score:6)*
* Bark beetle *(score:10)* *(disclosure: Jens Dyvik has written this guide, made Bark Beetle and determined the score point criteria bellow)*

Different scorepoints:
* Open source
* Free to install
* Do not require other non open source software to run
* Has Profile, Pocket and 3D mill
* Makes precise 3D milling
* Suports ramped plunge *(for milling metals)*
* Supports drill *(for hold down)*
* Supports tabs *(for parts without internal holes)*
* High speed/trochoidal milling *(for milling metals on weak machines)*
* Can be integrated with parametric models *(for smooth worflows and future apllications)*
* Integrated machine controll *(its the future)*
* Has good documentation



### Existing a motion systems you can to build upon
* RepRap. Focus on FDM printing
* Alu extrusion based systems with belt drive. Focus on quick and easy. Openbuilds, Shapoko, X-Carve
* MTM Stages by Nadya. Focus on modular, reconfigurable and expandable machines
* Chamfer rail by Jens and Jon, in Fabricatable machines development. Focus on making a larger degree of your own machine for maxiumum freedom in form, function and scale. 



# The actual doing


### Sourcing part and materials:
* Co-ops – buy together for discounts and efficiency *(if a fab lab stock necessary parts and materials, the threshold for people to start to building their own machines gets much lower)*
* Buy from source - find factory webshops
* Buy locally if the vendors don't suck
* Consider registering your own company – gives purchases almost half price in many countries *(no VAT and reduced tax)*


### CNC mill machine preparation:
* Find sharp/new milling bits
* Clean collets and chuck
* Make sure that the sacrafial layer *(spoil board)* is well secured and freshly surfaced
* Grease rack, clean rails
* Tighten motors on all axis
* Check v-wheels for slop
* Configure ramp values/ acceleration in control software *(shopbot control software corrupts its own config file while when it crashes, keep a backup config file at hand)*
* Make sure you have good screws and washers for hold down


### Fabricating the parts
* Test a small part first
* Test the entire design in a cheap material
* Do it yourself, tell your instructor to level up and let you operate the machine
* Remember to document during the process


### Assembling your machine
* Remember to RTFM *(read the f****** *manual)*


### Tuning / calibrating your machine:
* Be patient like a Zen master. Great machine calibration give great rewards.
* Tweak the pressre of you glide blocks/ v-wheels before with the pinion disengaged from the rack
* Tweak the pinion pressure on the rack with the help of the motor plates once you are done with the glide bloacks / v-wheels
* If you are real fancy you use software to compensate for unenven motion

### Using your machine and sharing back:
* Make spare parts
* Make another machine for a friend
* Improve it *(maybe make a new actuator for a new function)*
* Dont be shy about giving back by sharing improvements *(we use github because it makes it easy and scalable to be multiple contributors to a project)*
* Make tutorials
* Make example files
* Tell authors about what you have made and what it meant to you *(positive feedback fuel further open development)*



# HAPPY MACHINE MAKING!
