// MultiStepper.pde
// -*- mode: C++ -*-
//
// Shows how to multiple simultaneous steppers
// Runs one stepper forwards and backwards, accelerating and decelerating
// at the limits. Runs other steppers at the same time
//
// Copyright (C) 2009 Mike McCauley
// $Id: HRFMessage.h,v 1.1 2009/08/15 05:32:58 mikem Exp mikem $

#include <AccelStepper.h>

#define DIR_PIN_A 2              //Set Direction Pin for Stepper A to Digital Pin 2
#define STEP_PIN_A 3             //Set Step Pin for Stepper A to Digital Pin 3

// Define some steppers and the pins the will use
AccelStepper stepper1(1, STEP_PIN_A, DIR_PIN_A);

void setup()
{  
    stepper1.setMaxSpeed(200.0);
    stepper1.setAcceleration(100.0);
    stepper1.moveTo(1000);
}

void loop()
{
    // Change direction at the limits
    if (stepper1.distanceToGo() == 0)
	stepper1.moveTo(-stepper1.currentPosition());
    stepper1.run();
}
