
# Rack and Pinion for Fusion360 

## 07.03.2018 Update: Parametric version of the axis
Parametric model of a complete Chmfer rail axis in fusion360 including CAM for all parts, a tool library and joints.
This version introduces a new viper system to protect the glide surfaces from dirt.

Designed for 8 mm thick stock for all parts.

![Overview1](./img/iso_with_axis_plate.JPG)
![Overview1](./img/CAM.JPG)
![Overview1](./img/axis.gif)

(Older gif but you get the idea)

The rack clearance is wide enought so that the pinion clears the rack teeth when adjusting the glide blocks.

All parts are parametric but I have favourited the most used and most stable parameters, shown below:
![](./img/parameters.jpg)

![Overview1](./img/rack_n_pinion.gif)

## Old updates for Fusion360:

![Overview1](./img/rack_n_pinion.gif)
![Overview2](./img/overview_rolled.jpg)

Standard settings:
* "Standard" 45 mm / revolution pinion 
* Needs a 2 mm mill to machine.

It is Fully parametric and jointed. Use the Master Dimensions sketch to change the control dimensions or how they are calculated.
You can also control it from the parameters window.

![Master Dimensions](./img/master_dimensions.jpg)

To be able to mill the rack with a larger diameter milling bit, experiment with increasing the 
tooth_pos_radius parameter. It needs to be smaller than the main "rolling radius" so I have set it up so that the offset can be tuned.


![Tooth position control dimension](./img/tooth_pos_radius.jpg)
