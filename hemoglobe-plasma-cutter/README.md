# Hemoglobe - 2x1m Plasma cutter

![Drawer principle](./img/plasma-cutter-drawer-principle.jpg)
*Early sketch showing the drawer principle. For convenient loading/unloading in combination with high level safety*

A plasma cutter with a 2m x 1m work area. Based on the gantry design from on [Humphrey](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrey-large-format-cnc/README.md) and [Humphrito](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/humphrito-medium-format-cnc/README.md), using the [chamfer rail]() axis system.

### Status

*Currently researching, not yet designed or tested*

### BOM

* Hyperherm Powermax45 - seems to be the most suiabtle device for a low cost plasma cutter in a public workshop
* Machine torch, short type - for convenient mounting on the Z axis
* Machine control interface cable - for automatic tart stop
* Machine advance interface cable - for autatc adjustment of amp output
* Proma comapct THC SD - a torch height controller that overides the Z axis with step and direction commands (brilliant low cost solution)
* Ihss57 closed loop stepper motor - great value for money motors with integrated drivers
* Aluminium 8mm - for milling all the axes, glideblocks, axis plates, gantry and machine frame
* PTFE tape - to apply onto the surface of the gliblocks
* POM plastic - for milling the pinions
* Control board - Arduino UNO with GRBL or Replicape
* Extraction and filter - vey important for health and safety
* Ducting
* Air filter
* Air compressor with sufficient capacity
* Tubing for compressed air
* Safety helmet/mask needed?

### Safety

Glasses, helmet or film on safety window needed
Good extraction is needed

* Good info on eye safety for cnc plasma http://www.esabna.com/us/en/education/blog/what-eye-protection-is-required-for-cnc-plasma-cutting.cfm


### Research links and thoughts

Good guide to building a plasma and running it with LinuxCNC
http://wiki.linuxcnc.org/cgi-bin/wiki.pl?GantryPlasmaMachine

Guide to upgrading torch height controller
https://www.rs-online.com/designspark/upgrading-a-cnc-plasma-cutting-machine-part-4

Good info on the challenges of a THC
http://www.cnczone.com/forums/torchmate/143250-cnc-software-2.html
Copied and pasted repsonse on THC:
1. Accurately sense the surface of the plate with varying conditions such as; thin, flexible sheets; dirty rusty painted or submerged materials, etc, for determining a zero (plate surface) point.
2. Ability to quickly retract to proper pierce height before firing the torch.
3. Ability to index down to proper cut height after the pierce is complete...while still on the lead in kerf.
4. Ability to be switched to arc voltage feedback control after x and y motion accelerates to proper speed.
5. Ability to freeze in x-y slowdown situations (holes, fine features, sharp corners, etc.)
6. Ability to sense kerf crossings and end of cut slowdowns to prevent torch diving.
7. Ability to auto compensate for electrode wear (arc voltage increase) over the life of a set of consumables)
8. Ability to be automated (all settings for different power and different materials automated.....so THC is almost transparent to operator)
9. Collision avoidance (THC knows when to retract between cuts...and when it is not necessary to save time).


About toolpaths and CAM
Plasma toolpaths should be in "climb" direction
https://www.youtube.com/watch?v=LvIpgBNyXBs	


Off the shelf polish THC:
http://proma-elektronika.com/index.php/en/products/thc-torch-height-control/compact-thc-sd

Disucussion about Powermax 45 vs 65. Duty cycle on powermax 45 seems to be no problem
http://www.plasmaspider.com/viewtopic.php?f=60&t=23560&p=145508&hilit=duty+cycle#p145508

Remenber short machine torch.
Power use single phase vs threephase?
Which consumables? Shielded 40, shielded 30, fine cut?

