/*

Custom Post-Processor for GRBL based Openbuilds-style CNC and Laser-Cutting machines
Using Exiting Post Processors as inspiration
For documentation, see GitHub Wiki : https://github.com/Strooom/GRBL-Post-Processor/wiki
This post-Processor should work on GRBL-based machines such as
* Openbuilds - OX, C-Beam
* Inventables - X-Carve
* ShapeOko / Carbide3D
* your spindle is Makita RT0700 or Dewalt 611

22/AUG/2016 - V1 : Kick Off
23/AUG/2016 - V2 : Added Machining Time to Operations overview at file header
24/AUG/2016 - V3 : Added extra user properties - further cleanup of unused variables
07/SEP/2016 - V4 : Added support for INCHES. Added a safe retract at beginning of first section
11/OCT/2016 - V5
30/JAN/2017 - V6 : Modified capabilities to also allow waterjet, laser-cutting..
25/JUL/2018 - V7 : Code review to eliminate a bug causing GRBL Error 33. Compared this postProcessor with the latest grbl.cps
16/NOV/2018 - V8 : Added extra coolant modes : Flood = M8, Mist = M7, Flood+Mist
11/DEC/2018 - V9 [FORK] : Commented out the G53 line to stop it returning to machine home automatically after job is done.

*/

description = "Openbuilds Grbl";
vendor = "Openbuilds";
vendorUrl = "http://openbuilds.com";
model = "OX";
description = "Humphrey";
legal = "Copyright (C) 2012-2018 by Autodesk, Inc.";
certificationLevel = 2;

extension = "nc";										// file extension of the gcode file
setCodePage("ascii");									// character set of the gcode file
//setEOL(CRLF);											// end-of-line type : default for Windows OS is CRLF (so that's why this line is commented out), change to CR, LF, CRLF or LFCR if you are on another OS...

capabilities = CAPABILITY_MILLING | CAPABILITY_JET;		// intended for a CNC, so Milling, or 2D machines, such as lasers..
tolerance = spatial(0.002, MM);							// when linearizing a move, fusion will create linear segments which are within this amount of the actual path... Smaller values will result in more and smaller linear segments. GRBL.cps uses 0.002 mm
minimumChordLength = spatial(0.25, MM);					// minimum lenght of an arc, if Fusion needs a short arc, it will linearize... Problem with very small arcs is that rounding errors resulting from limited number of digits, result in GRBL error 33
minimumCircularRadius = spatial(0.5, MM);				// minimum radius of an arc.. Fusion will linearize if you need a smaller arc. Same problem with rounding errors as above
maximumCircularRadius = spatial(1000, MM);
minimumCircularSweep = toRad(0.1);
maximumCircularSweep = toRad(350);						// maximum angle of an arc. 350 prevents Fusion from outputting full circles.. Although GRBL can do this (with some special GCODE syntax) it is more robust to not do it and stick to standard G2 G3 use.. Fusion will split a longer arc into multiple smaller G2 G3 arcs
allowHelicalMoves = true;
allowedCircularPlanes = (1 << PLANE_XY) | (1 << PLANE_ZX) | (1 << PLANE_YZ);	// This is safer (instead of using 'undefined'), as it enumerates the allowed planes in GRBL

// user-defined properties : defaults are set, but they can be changed from a dialog box in Fusion when doing a post.
properties =
	{
	spindleOnOffDelay: 1.0,				// time (in seconds) the spindle needs to get up to speed or stop
	spindleTwoDirections : false,		// true : spindle can rotate clockwise and counterclockwise, will send M3 and M4. false : spindle can only go clockwise, will only send M3
	hasCoolant : false,					// true : machine uses the coolant output, M8 M9 will be sent. false : coolant output not connected, so no M8 M9 will be sent
	hasSpeedDial : true,				// true : the spindle is of type Makita RT0700, Dewalt 611 with a Dial to set speeds 1-6. false : other spindle
	machineHomeZ : -10,					// absolute machine coordinates where the machine will move to at the end of the job - first retracting Z, then moving home X Y
	machineHomeX : -10,
	machineHomeY : -10
	};

// creation of all kinds of G-code formats - controls the amount of decimals used in the generated G-Code
var gFormat = createFormat({prefix:"G", decimals:0});
var mFormat = createFormat({prefix:"M", decimals:0});

var xyzFormat = createFormat({decimals:(unit == MM ? 4 : 6)});
var feedFormat = createFormat({decimals:(unit == MM ? 1 : 3)});
var rpmFormat = createFormat({decimals:0});
var secFormat = createFormat({decimals:1, forceDecimal:true, trim:false});
var taperFormat = createFormat({decimals:1, scale:DEG});

var xOutput = createVariable({prefix:"X"}, xyzFormat);
var yOutput = createVariable({prefix:"Y"}, xyzFormat);
var zOutput = createVariable({prefix:"Z"}, xyzFormat);
var feedOutput = createVariable({prefix:"F"}, feedFormat);
var sOutput = createVariable({prefix:"S", force:true}, rpmFormat);

var iOutput = createReferenceVariable({prefix:"I"}, xyzFormat);
var jOutput = createReferenceVariable({prefix:"J"}, xyzFormat);
var kOutput = createReferenceVariable({prefix:"K"}, xyzFormat);

var gMotionModal = createModal({}, gFormat); 											// modal group 1 // G0-G3, ...
var gPlaneModal = createModal({onchange:function () {gMotionModal.reset();}}, gFormat); // modal group 2 // G17-19
var gAbsIncModal = createModal({}, gFormat); 											// modal group 3 // G90-91
var gFeedModeModal = createModal({}, gFormat); 											// modal group 5 // G93-94
var gUnitModal = createModal({}, gFormat); 												// modal group 6 // G20-21

function toTitleCase(str)
	{
	// function to reformat a string to 'title case'
	return str.replace(/\w\S*/g, function(txt)
		{
		return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
		});
	}

function rpm2dial(rpm)
	{
	// translates an RPM for the spindle into a dial value, eg. for the Makita RT0700 and Dewalt 611 routers
	// additionally, check that spindle rpm is between minimum and maximum of what our spindle can do

	// array which maps spindle speeds to router dial settings,
	// according to Makita RT0700 Manual : 1=10000, 2=12000, 3=17000, 4=22000, 5=27000, 6=30000
	var speeds = [0, 10000, 12000, 17000, 22000, 27000, 30000];

	if (rpm < speeds[1])
		{
		alert("Warning", rpm + " rpm is below minimum spindle RPM of " + speeds[1] + " rpm");
		return 1;
		}

	if (rpm > speeds[speeds.length - 1])
		{
		alert("Warning", rpm + " rpm is above maximum spindle RPM of " + speeds[speeds.length - 1] + " rpm");
		return (speeds.length - 1);
		}

	var i;
	for (i=1; i < (speeds.length-1); i++)
		{
		if ((rpm >= speeds[i]) && (rpm <= speeds[i+1]))
			{
			return ((rpm - speeds[i]) / (speeds[i+1] - speeds[i])) + i;
			}
		}

	alert("Error", "Error in calculating router speed dial..");
	error("Fatal Error calculating router speed dial");
	return 0;
	}

function writeBlock()
	{
	writeWords(arguments);
	}

function writeComment(text)
	{
	// Remove special characters which could confuse GRBL : $, !, ~, ?, (, )
	// In order to make it simple, I replace everything which is not A-Z, 0-9, space, : , .
	// Finally put everything between () as this is the way GRBL & UGCS expect comments
	writeln("(" + String(text).replace(/[^a-zA-Z\d :=,.]+/g, " ") + ")");
	}

function onOpen()
	{

	// here you set all the properties of your machine, so they can be used later on
	var myMachine = getMachineConfiguration();
	myMachine.setWidth(600);
	myMachine.setDepth(800);
	myMachine.setHeight(130);
	myMachine.setMaximumSpindlePower(700);
	myMachine.setMaximumSpindleSpeed(30000);
	myMachine.setMilling(true);
	myMachine.setTurning(false);
	myMachine.setToolChanger(false);
	myMachine.setNumberOfTools(1);
	myMachine.setNumberOfWorkOffsets(6);
	myMachine.setVendor("OpenBuilds");
	myMachine.setModel("OX CNC 1000 x 750");
	myMachine.setControl("GRBL V0.9j");

	writeln("%");			// open the file with a '%'. GRBL does not really do anything with this, but as this is so part of classic GCODE, I decided to leave it in :-)

	var productName = getProduct();
	writeComment("Made in : " + productName);
	writeComment("G-Code optimized for " + myMachine.getVendor() + " " + myMachine.getModel() + " with " + myMachine.getControl() + " controller");

	writeln("");

	if (programName)
		{
		writeComment("Program Name : " + programName);
		}
	if (programComment)
		{
		writeComment("Program Comments : " + programComment);
		}

	var numberOfSections = getNumberOfSections();
	writeComment(numberOfSections + " Operation" + ((numberOfSections == 1)?"":"s") + " :");

	for (var i = 0; i < numberOfSections; ++i)
		{
		var section = getSection(i);
		var tool = section.getTool();
		var rpm = section.getMaximumSpindleSpeed();

		if (section.hasParameter("operation-comment"))
			{
			writeComment((i+1) + " : " + section.getParameter("operation-comment"));
			}
		else
			{
			writeComment(i+1);
			}
      if (section.workOffset > 0)
         {
		   writeComment("  Work Coordinate System : G" + (section.workOffset + 53));
         }
		writeComment("  Tool : " + toTitleCase(getToolTypeName(tool.type)) + " " + tool.numberOfFlutes + " Flutes, Diam = " + xyzFormat.format(tool.diameter) + "mm, Len = " + tool.fluteLength + "mm");
		if (properties.hasSpeedDial)
			{
			writeComment("  Spindle : RPM = " + rpm + ", set router dial to " + rpm2dial(rpm));
			}
		else
			{
			writeComment("  Spindle : RPM = " + rpm);
			}
		var machineTimeInSeconds = section.getCycleTime();
		var machineTimeHours = Math.floor(machineTimeInSeconds / 3600);
		machineTimeInSeconds  = machineTimeInSeconds % 3600;
		var machineTimeMinutes = Math.floor(machineTimeInSeconds / 60);
		var machineTimeSeconds = Math.floor(machineTimeInSeconds % 60);
		var machineTimeText = "  Machining time : ";
		if (machineTimeHours > 0)
			{
			machineTimeText = machineTimeText + machineTimeHours + " hours " + machineTimeMinutes + " min ";
			}
		else if (machineTimeMinutes > 0)
			{
			machineTimeText = machineTimeText + machineTimeMinutes + " min ";
			}
		machineTimeText = machineTimeText + machineTimeSeconds + " sec";
		writeComment(machineTimeText);
		}
	writeln("");

	writeBlock(gAbsIncModal.format(90), gFeedModeModal.format(94));
	writeBlock(gPlaneModal.format(17));
	switch (unit)
		{
		case IN:
			writeBlock(gUnitModal.format(20));
			break;
		case MM:
			writeBlock(gUnitModal.format(21));
			break;
		}

	writeln("");
	}

function onComment(message)
	{
	writeComment(message);
	}

function forceXYZ()
	{
	xOutput.reset();
	yOutput.reset();
	zOutput.reset();
	}

function forceAny()
	{
	forceXYZ();
	feedOutput.reset();
	}

function onSection()
	{
	var nmbrOfSections = getNumberOfSections();		// how many operations are there in total
	var sectionId = getCurrentSectionId();			// what is the number of this operation (starts from 0)
	var section = getSection(sectionId);			// what is the section-object for this operation

	
	// check RadiusCompensation setting
	var radComp = getRadiusCompensation();
	var sectionId = getCurrentSectionId();
	if (radComp != RADIUS_COMPENSATION_OFF)
		{
		alert("Error", "RadiusCompensation is not supported in GRBL - Change RadiusCompensation in CAD/CAM software to Off/Center/Computer");
		error("Fatal Error in Operation " + (sectionId + 1) + ": RadiusCompensation is found in CAD file but is not supported in GRBL");
		return;
		}
	
	
	// Insert a small comment section to identify the related G-Code in a large multi-operations file
	var comment = "Operation " + (sectionId + 1) + " of " + nmbrOfSections;
	if (hasParameter("operation-comment"))
		{
		comment = comment + " : " + getParameter("operation-comment");
		}
	writeComment(comment);
	writeln("");

	// To be safe (after jogging to whatever position), move the spindle up to a safe home position before going to the initial position
	// At end of a section, spindle is retracted to clearance height, so it is only needed on the first section
	// it is done with G53 - machine coordinates, so I put it in front of anything else
	if(isFirstSection())
		{
		writeBlock(gAbsIncModal.format(90));	// Set to absolute coordinates
		if (isMilling())
			{
			writeBlock(gFormat.format(53), gMotionModal.format(0), "Z" + xyzFormat.format(properties.machineHomeZ));	// Retract spindle to Machine Z Home
			}
		}

	// Write the WCS, ie. G54 or higher.. default to WCS1 / G54 if no or invalid WCS in order to prevent using Machine Coordinates G53
	if ((section.workOffset < 1) || (section.workOffset > 6))
		{
		alert("Warning", "Invalid Work Coordinate System. Select WCS 1..6 in CAM software. In Fusion360, set the WCS in CAM-workspace | Setup-properties | PostProcess-tab. Selecting default WCS1/G54");
        writeBlock(gFormat.format(54));  // output what we want, G54
		}
   else
       {
	   writeBlock(gFormat.format(53 + section.workOffset));  // use the selected WCS
       }

	var tool = section.getTool();

	// Insert the Spindle start command
	if (tool.clockwise)
		{
		writeBlock(sOutput.format(tool.spindleRPM), mFormat.format(3));
		}
	else if (properties.spindleTwoDirections)
		{
		writeBlock(sOutput.format(tool.spindleRPM), mFormat.format(4));
		}
	else
		{
		alert("Error", "Counter-clockwise Spindle Operation found, but your spindle does not support this");
		error("Fatal Error in Operation " + (sectionId + 1) + ": Counter-clockwise Spindle Operation found, but your spindle does not support this");
		return;
		}

	// Wait some time for spindle to speed up - only on first section, as spindle is not powered down in-between sections
	if(isFirstSection())
		{
		onDwell(properties.spindleOnOffDelay);
		}

	// If the machine has coolant, write M8, else write M9
	if (properties.hasCoolant)
		{
		if (tool.coolant == COOLANT_FLOOD)
			{
			writeBlock(mFormat.format(8));
			}
		else if (tool.coolant == COOLANT_MIST)
			{
			writeBlock(mFormat.format(7));
			}
		else if (tool.coolant == COOLANT_FLOOD_MIST)
			{
			writeBlock(mFormat.format(7));
			writeBlock(mFormat.format(8));
			}
		else
			{
			writeBlock(mFormat.format(9));
			}
		}

	var remaining = currentSection.workPlane;
	if (!isSameDirection(remaining.forward, new Vector(0, 0, 1)))
		{
		alert("Error", "Tool-Rotation detected - GRBL only supports 3 Axis");
		error("Fatal Error in Operation " + (sectionId + 1) + ": Tool-Rotation detected but GRBL only supports 3 Axis");
		}
	setRotation(remaining);

	forceAny();		// this ensures all axis and feed are output at the beginning of the section

	// Rapid move to initial position, first XY, then Z
	var initialPosition = getFramePosition(currentSection.getInitialPosition());
	writeBlock(gAbsIncModal.format(90), gMotionModal.format(0), xOutput.format(initialPosition.x), yOutput.format(initialPosition.y));
	writeBlock(gMotionModal.format(0), zOutput.format(initialPosition.z));
	}

function onDwell(seconds)
	{
	writeBlock(gFormat.format(4), "P" + secFormat.format(seconds));
	}

function onSpindleSpeed(spindleSpeed)
	{
	writeBlock(sOutput.format(spindleSpeed));
	}

function onRapid(_x, _y, _z)
	{
	var x = xOutput.format(_x);
	var y = yOutput.format(_y);
	var z = zOutput.format(_z);
	if (x || y || z)
		{
		writeBlock(gMotionModal.format(0), x, y, z);
		feedOutput.reset();								// after a G0, we will always resend the Feedrate... Is this useful ?
		}
	}

function onLinear(_x, _y, _z, feed)
	{
	var x = xOutput.format(_x);
	var y = yOutput.format(_y);
	var z = zOutput.format(_z);
	var f = feedOutput.format(feed);

	if (x || y || z || f)
		{
		writeBlock(gMotionModal.format(1), x, y, z, f);
		}
	}

function onRapid5D(_x, _y, _z, _a, _b, _c)
	{
	alert("Error", "Tool-Rotation detected - GRBL only supports 3 Axis");
	error("Tool-Rotation detected but GRBL only supports 3 Axis");
	}

function onLinear5D(_x, _y, _z, _a, _b, _c, feed)
	{
	alert("Error", "Tool-Rotation detected - GRBL only supports 3 Axis");
	error("Tool-Rotation detected but GRBL only supports 3 Axis");
	}

function onCircular(clockwise, cx, cy, cz, x, y, z, feed)
	{
	var start = getCurrentPosition();

	switch (getCircularPlane())
		{
		case PLANE_XY:
			writeBlock(gPlaneModal.format(17), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), iOutput.format(cx - start.x, 0), jOutput.format(cy - start.y, 0), feedOutput.format(feed));
			break;
		case PLANE_ZX:
			writeBlock(gPlaneModal.format(18), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), iOutput.format(cx - start.x, 0), kOutput.format(cz - start.z, 0), feedOutput.format(feed));
			break;
		case PLANE_YZ:
			writeBlock(gPlaneModal.format(19), gMotionModal.format(clockwise ? 2 : 3), xOutput.format(x), yOutput.format(y), zOutput.format(z), jOutput.format(cy - start.y, 0), kOutput.format(cz - start.z, 0), feedOutput.format(feed));
			break;
		default:
			linearize(tolerance);
		}
	}

function onSectionEnd()
	{
    xOutput.reset();						// resetting, so everything that comes after this section, will get X, Y, Z, F outputted, even if their values did not change..
    yOutput.reset();
    zOutput.reset();
    feedOutput.reset();

	writeln("");							// add a blank line at the end of each section
	}

function onClose()
	{
	writeBlock(gAbsIncModal.format(90));	// Set to absolute coordinates for the following moves
	if (isMilling())						// For CNC we move the Z-axis up, for lasercutter it's not needed
		{
		writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), "Z" + xyzFormat.format(properties.machineHomeZ));	// Retract spindle to Machine Z Home
		}
	writeBlock(mFormat.format(5));																					// Stop Spindle
	if (properties.hasCoolant)
		{
		writeBlock(mFormat.format(9));																				// Stop Coolant
		}
	onDwell(properties.spindleOnOffDelay);																			// Wait for spindle to stop
	// writeBlock(gAbsIncModal.format(90), gFormat.format(53), gMotionModal.format(0), "X" + xyzFormat.format(properties.machineHomeX), "Y" + xyzFormat.format(properties.machineHomeY));	// Return to home position (commented out to not use machine coords)

	writeBlock(mFormat.format(30));																					// Program End
	writeln("%");																									// EndOfFile marker - GRBL doesn't use it / ignores it, but it's so much tradition, so I left it in..
	}



