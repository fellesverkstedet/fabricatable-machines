# Hulti - first take on large-format 3D printing 
## This is work in progress. I´ll add stuff as I go along. Currently finishing up CAD. 

Hulti is a prototype of a 3D printer that does parallel processing of layers, meaning instead of having one nozzle extruding plastic we have many. The theory goes something like many workers can do the job quicker 
than one. While most of the research I am conducting is focused on the software and algorithms controlling the system, I wanted to have a physical platform where I can my test my theories. 

First, full disclaimer. You have now stepped into a document that functions both as a way for you to copy and make use of my work,  but also as my own research notes as I build
and prototype the machine. I am no expert when it comes to CAD and CAM, but I figured that if I am researching and diving into the world of fabrication machines, I might as well 
build one. The chamfer rail system seemed as the perfect place to start, mostly because of its simplicity, shareability and cost.  

NOTE: I am building a slicer and control software for the machine in a separate git. You can find it [here](https://github.com/frikkfossdal/fluffy-octo-potato).

## The Plan

The process goes something like this: 

1. Design 
2. CAD 
3. CAM 
4. Assembly
5. Electronics and Control 

Let´s go! 

## Design

I explored several diferent options here. 

[SCARA robost](https://en.wikipedia.org/wiki/SCARA)
An interesting concept, but in terms of DIY, expensive and complex. 
[Industrial robots, 6-DOF](http://new.abb.com/products/robotics/industrial-robots/irb-6700)
These are nice, and can in many ways do what I require, but the thing about industrial robots is that they are expensive!  HVL has a really nice robotics lab 
with several robots available, but we seak out to create a tool for people.  
[3-axis gantry](https://www.youtube.com/watch?v=SuOIWfGuqVk)
Here you can se a paralell processing system. The work area of each extruder is divided into sections. 

Ideely we want to create a system where the indevidual extruders can move as freely as possible. A big issue here is crossing. Traditional gantry systems 
are not able to cross each other, and I strongly believe that this is a limiting factor in a parallel processing scheme.  Industrial robots could be a way to solve this problem, but as stated above, they are expensive! 
Trough discussions with Jens we came up with this really nice concept using the chamfer rail system. Instead of the traditional gantry setup, supported on both sides, we went for a "single-side-supported" system alá the RepRap
[Ormerod](https://www.3dhubs.com/3d-printers/ormerod). 3D printing does not require as much stiffness and strength as a CNC, so hopefully this will suffice for our system. The nice thing about this design is that the extruders are able to cross each other. 
This allows for much more finesse when we start optimizing our tool paths.  I let the drawings do the explaining here. 

So, now that we´ve established the design parameters it´s time to start blocking out the design in CAD. 

## Material 

Aah materials. 

## CAD 

I do realize that much of the CAD-work would probably be easier and faster in Rhino, but in the spirit of keeping everything open-source I wanted to do everything in Autodesk´s Fusion360, which is free for all hobbyists and makers. A really nice thing about Fusion is that the CAM-module is included, so you can move really fast from your CAD-design to excecution.

###  Layout 

I like to start out with blocking everything out and getting a feel for the design, before I turn to details. I am aiming for a footprint about 1600 x 700 mm.  As for the height of the machine, I´ve decided to start of with 600mm axes. This should allow print sizes around 1400 x 400 x 300. Fairly big. I also want to fabricate a solid surface as a fundament for the printer.  I´m thinking to link everything using good old fasion joinery techniques. More about this later. 

![blocking it out](img/CAD/cad1_blocking.png)

Now that we´ve sorted that out it´s time to put things together.  To generate the rack&pinion setup, we will be using Jakob Nilssons parameterized [generator](https://github.com/fellesverkstedet/fabricatable-machines/tree/master/chamferrail).  I have to admit that I´m initially quite sceptical about the glide block situation. 3D printing requires fine precision, but the inital testing done by Fellesverkstedet and friends shows promising results so I guess it´s worth a try. Glide blocks without bearings is used in many applications in industry and after some examination of a old lathe at the local makerspace, my scepticism has been put to ease. I guess it´s just a matter of the correct amount of oil! Anyhow, let´s keep on going. 


I use the generator to make 3 rails, one 1600mm and two 600mm. 


![racks](img/CAD/cad2_racks.png)


Next up I´ve decided to redraw my own glideblocks. It really just comes down to that I want to have full control of the parameters of the glideblock. I´ll be adding my own joints and mounting holes. This might be a small waste of time, but to keep the model clean, I feel it´s worth the hazzle.  


![glide_blocks](img/CAD/cad3_glideBlocks.png)

Now it´s time to talk about joinery. An important aspect to consider in all machine building applications is To stiffen up and flatten all the axes of the machine I´m using torsion boxes. Torsion boxes is a old but goodie trick that is used alot by both carpenters and machinist that needs a leveled and sturdie structure. 

TODO: Finish up CAD and mill this beast! 

## CAM

## Electronics and Control 

## Assemble 

*Frikk H Fossdal - april 2018*


