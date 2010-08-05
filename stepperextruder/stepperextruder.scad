// Mockup of stepperextruder
// (c) 2010 Koen Kooi
// Licensed under the GPLv2

use <../mcad/units.scad>
use <../mcad/math.scad>
use <../mcad/constants.scad>
use <../mcad/motors.scad>
use <../mcad/bearing.scad>

mm = 1;
Bearing608 = [8*mm, 22*mm, 7*mm];
Bearing624 = [4*mm, 13*mm, 5*mm];
Bearing627 = [7*mm, 22*mm, 7*mm];
Bearing688 = [8*mm, 16*mm, 5*mm];
SkateBearing = Bearing608;


bearing(pos = [-6.7,-20,10.8], angle=[0,90,0], model=Bearing608);
bearing(pos = [-28.2,-20,10.8], angle=[0,90,0], model=Bearing608);
bearing(pos = [-18.5,-35,10.8], angle=[0,90,0], model=Bearing608);


translate( v = [-5,18.6,10.8]) {
	rotate(a=[0,90,0]) {
		stepper_motor_mount(17,5);
	}
}

translate([15.5,8.5,0.7]) {
	rotate(a = [0,-90,0]) {
		color([1,0,0]) {
			import_stl("11t17p.stl");
		}
	}
}


translate([1,-19,10.3]) {
	rotate(a = [0,90,0]) {
		color([0,1,0]) {
			import_stl("39t17p.stl");
		}
	}
}


translate([-15,-44,11]) {
	rotate(a = [-90,0,0]) {
		color([0.4,0.4,0.4,1]) {
			import_stl("M8_Extruder_Idler_Block_Beefy.stl");
		}
	}
}

translate([0,0,0]) {
	color([1,1,0,0.8]) {
		rotate(a = [90,0,-90]) {
			import_stl("MakerBot_M8_Extruder_Block_V2.stl");
		}
	}
}

translate([-10,-13.5,6.5]) {
	rotate(a = [90,0,0]) {
		color([0,0,1,0.6]) {
			import_stl("MakerBot_M8_Extruder_Mount-v2.stl");
		}
	}
}

translate([-40,18,11]) {
	rotate(a = [180,-90,0]) {
		color([1,1,1,0.6]) {
			import_stl("nema17-dustcap.stl");
		}
	}
}

translate([-14.5,-23.5,-48]) {
	rotate(a = [0,0,0]) {
		color([0,0,0,1]) {
			import_stl("groovemount.stl");
		}
	}
}