
# Rack and Pinion for Fusion360 

![Overview](./img/overview.jpg)
![Overview](./img/overview_rolled.jpg)

Standard settings:
* "Standard" 45 mm / revolution pinion 
* Needs a 2 mm mill to machine.

It is Fully parametric and jointed. Use the Master Dimensions sketch to change the control dimensions or how they are calculated.
You can also control it from the parameters window.

![Master Dimensions](./img/master_dimensions.jpg)

To be able to mill the rack with a larger diameter milling bit, experiment with increasing the 
tooth_pos_radius parameter. It needs to be smaller than the main "rolling radius" so I have set it up so that the offset can be tuned.


![Tooth position control dimension](./img/tooth_pos_radius.jpg)
