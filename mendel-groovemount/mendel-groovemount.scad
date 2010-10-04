/*
RepRap Wade Extruder Mount #2

by Tony Buser <tbuser@gmail.com>
http://tonybuser.com
http://replimat.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/*
Improvements:
* mounted horizontally to improve clearance
* prevents motor collision on left side at 0mm X above ~50mm Z
* now only collides frame on right if you go past 160mm X and above 90mm Z
* hot end now centered in carriage
* can now be removed from carriage without having to dissasemble first
* lifts makerbot sized hot end to increase max Z by 5mm
* also supports grooved insulators
*/

// type of insulator barrel
insulator_type = "groove"; // standard, groove

mount_height = 5;

// standard is 16, make it larger for inaccurate printers
insulator_diameter = 17.2;

// standard is 4, make it larger for inaccurate printers
bolt_diameter = 4.7;

// standard is 12, make it larger for inaccurate printers
groove_diameter = 13.1;

module wade_mount_base() {
	translate([0, 0, 0]) {
		union() {
			// horizontal base
			translate([0, 8, 0]) {
				cube([20, 60, mount_height], center=true);
			}

			// vertical base
			translate([8, 0, 0]) {
				cube([75, 20, mount_height], center=true);
			}

			// right side wrap around
			translate([27.5, 24, 0]) {
				cube([36, 10, mount_height], center=true);
			}
			translate([40.5, 15, 0]) {
				cube([10, 10, mount_height], center=true);
			}

			// insulator curve
			translate([0, 8, 0]) {
				cylinder(mount_height, insulator_diameter/2+6, insulator_diameter/2+6, center=true);
			}

			// front tab curve
			translate([0, -8, 0]) {
				cylinder(mount_height, insulator_diameter/2+6, insulator_diameter/2+6, center=true);
			}

			// left wade mounting hole
			translate([-11.5, 8, 0]) {
				cylinder(mount_height, bolt_diameter/2+2, bolt_diameter/2+2, center=true);
			}


			// right wade mounting hole
			translate([30-2, 8, 0]) {
				cylinder(mount_height, bolt_diameter/2+2, bolt_diameter/2+2, center=true);
			}

		}
	}
}

module wade_mount() {
	difference() {
		wade_mount_base();

		// insulator
		if (insulator_type == "groove") {
			// sloped hole
			translate([0, 8, -2]) {
				cylinder(mount_height+1, insulator_diameter/2+1, groove_diameter/2, center=true);

				//translate([groove_diameter/2, 0, 0]) cylinder(mount_height+1, insulator_diameter/2+1, groove_diameter/2, center=true);

				//translate([groove_diameter/2/2, 0, 0]) cylinder(mount_height+1, insulator_diameter/2+1, groove_diameter/2, center=true);

				//translate([groove_diameter/2, 0, 0]) cube([groove_diameter, groove_diameter, mount_height+5], center=true);
			}

			// to create lip
			translate([0, 8, 0]) {
				cylinder(mount_height+2, groove_diameter/2, groove_diameter/2, center=true);
			}

			// cutout to slide into groove and give space for wiring
			translate([groove_diameter-groove_diameter/4, 8, 0]) {
				cylinder(mount_height+2, insulator_diameter/2+1, insulator_diameter/2, center=true);

				//translate([0, insulator_diameter/5, 0]) cylinder(mount_height+2, insulator_diameter/2, insulator_diameter/2, center=true);

				//translate([0, insulator_diameter/4, 0]) cube([insulator_diameter, insulator_diameter/2+5, mount_height+2], center=true);
			}

		} else {
			translate([0, 8, 0]) {
				cylinder(mount_height+2, insulator_diameter/2, insulator_diameter/2, center=true);
			}
		}

		// back mounting hole
		translate([0, 25+8, 0]) {
			cylinder(mount_height+2, bolt_diameter/2, bolt_diameter/2, center=true);
		}

		// front mounting hole
		translate([0, -25+8, 0]) {
			cylinder(mount_height+2, bolt_diameter/2, bolt_diameter/2, center=true);
		}

		// front mounting hole inset
		translate([0, -25+8, mount_height-3.5]) {
			cylinder(mount_height, (bolt_diameter+3)/2, (bolt_diameter+3)/2, center=true);
		}
		
		// left wade mounting hole
		translate([-11.5, 8, 0]) {
			cylinder(mount_height+2, bolt_diameter/2, bolt_diameter/2, center=true);
		}


		// right wade mounting hole
		translate([30-2, 8, 0]) {
			cylinder(mount_height+2, bolt_diameter/2, bolt_diameter/2, center=true);
		}
	}
}

translate([0, 0, mount_height/2]) wade_mount();

translate(v=[20,-4,11]) rotate([90,0,180]) color([1,0,0]) import_stl("brut.stl");//
translate(v=[8,8,0]) rotate([0,180,0]) color([0,1,0]) import_stl("../mendel/generated/x-carriage-upper.stl");

translate(v=[0,8,-30.1]) color([0.1,0.1,0.1]) hybrid_isulator();
translate(v=[0,8,5.01])  color([0,1,0]) mount_plug();

module mount_plug() {
	difference() {
		union() {
			cylinder(r=18,h=5);
			translate(v=[0,-4,0]) cube([30,8,5]);
			// right wade mounting hole support
			translate([30-2, 0, 2.5]) {
				cylinder(mount_height, bolt_diameter/2+2, bolt_diameter/2+2, center=true);
			}
		}
			
	
			translate([30-2, 0, 2.5]) {
				cylinder(mount_height+2, 1.6, 1.6, center=true);
			}
	
			translate(v=[0,0,-1]) cylinder(r=8.5,h=7);
			// left wade mounting hole
			translate([-11.5, 0, 3]) {
				cylinder(h=mount_height+2, r=1.6, center=true);
			}
			// right wade mounting hole
			translate([13.5, 0, 3]) {
				cylinder(h=mount_height+2, r=1.6, center=true);
			}
	}
}

module hybrid_isulator() {
	difference() {
		cylinder(r=8, h=40);
		translate(v=[0,0,-1]) cylinder(r=1.7, h=42, $fn=48);
	
		difference() {
			translate(v=[0,0,30]) cylinder(r=9, h=5);
			translate(v=[0,0,29]) cylinder(r=6, h=7);
		}
	}
}