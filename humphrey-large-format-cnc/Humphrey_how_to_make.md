# How to make a Humphrey

![Make your own](img/humphrey_being_upgraded_to_rollers.JPG)

*Humphrey v2 being worked on at Newtone AS in Oslo*

This is a guide on how to make the Humphrey CNC millling machine.

Jump to:

* [Buying what can't be made](Humphrey_how_to_make.md#buying-what-can-t-be-made)
* [Parts that can me made](Humphrey_how_to_make.md#parts-that-can-be-made)
* [Putting it together](Humphrey_how_to_make.md#putting-it-together)

## Files

* [Fusion360 assembly](https://a360.co/2AF6yjp)
* [STEP assembly](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/humphrey-large-format-cnc/humphrey_v3/Assembly_h3%20v5_step.zip)

## Buying what can't be made

These are all the raw materials like aluminum bars, all hardware like the motors and spindle and small things like glue, safety googles and all fasteners. This include everything needed to make and operate the machine, except the machines to make the parts on. All prices include shipping (to Oslo). 

### Costs of all raw materials and components

![cost_distribution_humphrey_v4](img/graphs/cost_distribution_humphrey_v4.svg)

*(January 2019, based on Humphery v4 costs in Norway):*

| Total costs of materials                        | NOK       | USD    |
|-------------------------------------------------|-----------|--------|
| **Parts, raw materials and equipment:** | **29 281 kr** | **$3 404** |
| Spare / Left in stock after delivery            | 3 265 kr  | $380   |


| Cost by category                                | NOK       | USD    |
|-------------------------------------------------|-----------|--------|
| Consumables                                     | 1 540 kr  | $179   |
| Electronics                                     | 1 268 kr  | $147   |
| Fasteners                                       | 2 018 kr  | $235   |
| Hardware                                        | 8 962 kr  | $1 042 |
| Raw material                                    | 13 590 kr | $1 580 |
| Tools and Equipment                             | 1 903 kr  | $221   |

[See further breakdown of costs here](Humphrey_costs.md) or in the spreadsheets below.

#### Spreadsheet with all costs and supplier links

Copy this spreadsheet and use it purchase all the parts and raw materials listed. We have included links to online stores and product numbers for most parts.

* [BOM - Google sheet](https://docs.google.com/spreadsheets/d/1O0V0Yyn-vt2MoGoZ2DiTqdFMecpRSYYsnOq32u6BHwU/edit?usp=sharing)
* [BOM in ODS](img/graphs/BOM.ods)
* [BOM in PDF](img/graphs/BOM.pdf)

## Parts that can be made

To make these parts you need the raw materials listed in the spreadsheets above.

The machining of the parts has been broken down into sub sections:

* [Milling the valchromat parts](Making_the_parts_for_the_table.md)
* [Milling the aluminium parts](alu_parts.md) 
* [Making the plastic parts](plastic_parts.md)
* [Leather skirt DXF file](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/humphrey-large-format-cnc/humphrey_v3/laser_leather_skirt.dxf) for lasercutting

### Production times for a solo experienced person
* Milling the aluminium parts took 5 regular workdays, CAM in Fusion360 and milled on a Shopbot
* Milling the valchromat parts took 1 regular workday, CAM in Rhino using [Bark Beetle](https://github.com/fellesverkstedet/Bark-beetle-parametric-toolpaths) on a Shopbot
* (Estimated from Cura) 20 h to print the 3D prints using one Ultimaker 

## Putting it together

These are instructions for how to assemble Humphrey v3 from a kit of parts, in the recommended order of assembly:

* [Table assembly](Table_assembly.md)
* [Gantry assembly](Gantry_assembly.md)
* [Carriage assemby](Carriage_assembly.md)
* [Tuning the motion system](tuning.md)
* [Electronics](electronics.md)

### Assembly times

For a five person group of inexperienced people plus one experienced and using the online manuals the Table assembly, Gantry assembly and Carriage assembly was completed in 6-7 hours of workshops spread over two days, without stressing.

Drilling and threading takes much of the time.

### Assembly Pictures

![All parts to build the machine](img/all_parts_before_assembly.jpg)

*All parts of Humphrey v4 before assembly*

![making_humphrey_group.jpg](./img/installation/making_humphrey_group.jpg)

*Hupmhrey v3 being assembled at [Dalamakers](https://dalamakers.no) the [Makerspace in Brumunddal (facebook)](https://www.facebook.com/pages/category/Nonprofit-Organization/Makerspace-i-Brumunddal-199245720667673/)*

![posing_with_motion_system](https://github.com/fellesverkstedet/fabricatable-machines/raw/master/humphrey-large-format-cnc/humphrey_v3/img/installation/posing_with_motion_system.JPG)

*Makers from Dalamakers posing during the assembly of Humphrey v3*

[Back to Humphrey overview](README.md)





