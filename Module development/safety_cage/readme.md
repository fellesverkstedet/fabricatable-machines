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
* [Safety relay with reset](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safety-relays/ue23-3mf/ue23-3mf2a3/p/p79479) / [safety command](https://www.sick.com/no/en/senscontrol-safe-control-solutions/safety-relays/ue44-3sl/c/g186171)
