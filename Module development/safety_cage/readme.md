# Safety cage for CNC mill

## Cutting main power with emergency stops

Disabling the main power line is an easy way to ensure that the machine can not move when an emergency stop has been triggered. But we need to be very careful that the machine can not start on its own when the emergency stop buttons are reset. This is also an explicit requirement in section [1.2.3.   Starting](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32006L0042#d1e32-35-1) of the machine directive ESSENTIAL HEALTH AND SAFETY REQUIREMENTS annex.
```
It must be possible to start machinery only by voluntary actuation of a control device provided for the purpose.

The same requirement applies:
— when restarting the machinery after a stoppage, whatever the cause,
```
Cutting main power does not stop the streaming of code to the machine, meaning that there is a risk that the machine might start moving the moment power is returned. We have several electronics features that probably will detect that power is cut but they are "home-cooked" and not safety-system approved. This means we should opt for a *RESET* or *UNLOCK* button that keeps the machine turned off even AFTER all emergency stops are reset. 

#### SICK Reference guides
* [SICK guide to safe machinery](https://cdn.sick.com/media/docs/8/78/678/Special_information_Guide_for_Safe_Machinery_en_IM0014678.PDF)
* [Safe series connection](https://cdn.sick.com/media/docs/8/68/468/Special_information_Safe_series_connection_en_IM0059468.PDF)

This would give us a approved safety circuit with a reset button.

#### Safety equipment
* [i16-SA205 SICK door switch](https://www.sick.com/no/en/safety-switches/electro-mechanical-safety-switches/i16s/i16-sa205/p/p338053) 1 required
* [ES11-SC4D8 Emergency STOP and RESET button](https://www.sick.com/no/en/safety-switches/safety-command-devices/es11/es11-sc4d8/p/p339946) 1 required
* [ES11-SA1A4 Emergency stop button](https://www.sick.com/no/en/safety-switches/safety-command-devices/es11/es11-sa1a4/p/p339944) as many as needed
* [1061712 For dual-channel equivalent electro-mechanical safety switches M12 8pin](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safe-series-connection/flexi-loop/fln-emss1100108/p/p342547) 1 per switch
* [1061716 Module to terminate series connection](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safe-series-connection/flexi-loop/flt-term00001/p/p346064)

Series with flexi loop and The Flexi Classic safety controller looks like it fulfills our requirements. No software required, supports all parts.

#### Cheaper alternative?

Can we use a cheap but safe contactor and make a simple old school latching circuit for the reset button or use a [relay with a reset function](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safety-relays/ue23-3mf/ue23-3mf2a3/p/p79479) or a simpler [safety command module](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safety-relays/ue44-3sl/c/g186171)

* [ES11-SC4D8 Emergency STOP and RESET button](https://www.sick.com/no/en/safety-switches/safety-command-devices/es11/es11-sc4d8/p/p339946) 1 required
* [ES21-SA10E1 Emergency stop button](https://www.sick.com/no/en/safety-switches/safety-command-devices/es21/es21-sa10e1/p/p79960) as many as needed (need to check if compatible)
* [i16-SA205 SICK door switch](https://www.sick.com/no/en/safety-switches/electro-mechanical-safety-switches/i16s/i16-sa205/p/p338053) 1 required
* [Safety relay with reset](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safety-relays/ue23-3mf/ue23-3mf2a3/p/p79479) (looks really promising!) / [safety command](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safety-relays/ue44-3sl/c/g186171)


## Safety system functions and use cases
* One CNC machine behind a safety screen
* One door in the safety screen
* One fixed operator station outside the safety screen
* Emergency stop button accessable from operator station
* Emergency stop button accessable from inside the safety screen

### Use case: Normal use by normal user
* The user can only operate the machine from outside the safety screen
* The user can easily see the entire area inside the safety screen
* A RESET button must be pressed to turn on power to the machine
* The user is forbidden to power the machine with anyone else behind the safety screen
* Opening the safety screen door cuts power to the machine
* The door stays open automatically
* The user is not allowed to close the door while inside the safety screen (no inside handle)
* Several emergency buttons can cut all power to the machine 

### Risk cases
1. A user activates the machine with someone else inside the safety screen
2. The machine is randomly activated while someone is changing bits
3. The user is unable to stop the machine
4. Something catches fire 
5. While unattended the machine starts on its own

### Possible bad consequences
1. Permanent damage to hand
2. Permanent damage to hand
3. Damage to machine or material
4. Fire, death
5. Fire, death

### What, at least, needs to happen for the bad consequence to happen
1. Several options
    1. Two users agree to break the safe use rules and the user inside the screen puts their hand in the work area and the machine runs into it
    2. The view is blocked and the user does not notice them inside the safety screen
    3. Malicious act, stealthily sealing the user inside the safety screen, resetting the power and activating the machine as the trapped user touches the milling bit.
2. The door safety switch malfunctions and does not detect the door being opened and the machine controller malfunctions and activates the machine
3. The machine controller malfunctions and the emergency stop malfunctions
4. Several options
    1. The user is absent while the machine is running
    2. The user is unable to put out the fire
5. The machine was left unattended while powered and the machine controller malfunctions

### Concequences of safety system failing
There is no immiate risk from **only** the safety system failing, the machine controller must also malfunction at the same time as a user has their hands in a dangerous position. However we prefer to build a safety system that allows for an intermittently malfunctioning machine controller just to be sure. This is why we want a feature that locks the machine if the safety system is experiencing issues before they can cause an accident. In other words, we want to avoid a "silent" failure of the safety system.
