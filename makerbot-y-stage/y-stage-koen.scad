// Mendel style y carriage
// (c) Koen Kooi 2010
// Inspired by http://www.thingiverse.com/thing:3202
// y-stage_batch7_v2_rotated.stl from thing:3202
// stage.dxf from makerbot SVN

use <../mcad/units.scad>
use <../mcad/math.scad>
use <../mcad/constants.scad>
use <../mcad/materials.scad>
use <../mcad/bearing.scad>

mm = 1;
Bearing624 = [4*mm, 13*mm, 5*mm];


rails();
cartangleclamp();
cart();
cartbearings();

module cartbearings() {
	bearing(pos = [17.5,20,9.5], angle=[0,90,0], model=Bearing624);
	bearing(pos = [17.5,-20,9.5], angle=[0,90,0], model=Bearing624);

	bearing(pos = [14,20,-8], angle=[0,-38,0], model=Bearing624);
	bearing(pos = [14,-20,-8], angle=[0,-38, 0], model=Bearing624);

	bearing(pos = [26,20,-8], angle=[0,38,0], model=Bearing624);
	bearing(pos = [26,-20,-8], angle=[0,38,0], model=Bearing624);

	bearing(pos = [-22.5,20,9.5], angle=[0,90,0], model=Bearing624);
	bearing(pos = [-22.5,-20,9.5], angle=[0,90,0], model=Bearing624);
	bearing(pos = [-22.5,20,-9.5], angle=[0,90,0], model=Bearing624);
	bearing(pos = [-22.5,-20,-9.5], angle=[0,90,0], model=Bearing624);
}


module cart() {
	difference() {	
		union() {
			translate(v = [0,0,20]) {
				ytop(5);
			}
			//vertical bearing holder
			translate(v=[-28,-24,-14.5]) {
				cube([5,48,32.1]);
			}
			translate(v=[11.5,-24,15]) {
				cube([5,48,3]);
			}
		} // end union
	
		translate(v=[-20,25,0]) {
			rotate(a = [90,0,0]) {
				cylinder(h=50, r=5, $fn=48);
			}
		}

		//bearing axles
		#translate(v=[-35,20,9.5]) {rotate(a = [90,0,90]) { cylinder(h=70, r=2, $fn=48); } }
		#translate(v=[-35,-20,9.5]) {rotate(a = [90,0,90]) { cylinder(h=70, r=2, $fn=48); } }
		#translate(v=[-35,20,-9.5]) {rotate(a = [90,0,90]) { cylinder(h=20, r=2, $fn=48); } }
		#translate(v=[-35,-20,-9.5]) {rotate(a = [90,0,90]) { cylinder(h=20, r=2, $fn=48); } }

		#translate(v=[14,20,-8]) {rotate(a = [0,-38,0]) { cylinder(h=13, r=2, $fn=48); } }
		#translate(v=[14,-20,-8]) {rotate(a = [0,-38,0]) { cylinder(h=13, r=2, $fn=48); } }
		#translate(v=[26,20,-8]) {rotate(a = [0,38,0]) { cylinder(h=13, r=2, $fn=48); } }
		#translate(v=[26,-20,-8]) {rotate(a = [0,38,0]) { cylinder(h=13, r=2, $fn=48); } }


	} //end difference

	translate( v= [40,0,0]) {
		rotate(a = [0,0,180]) {
			cartangleclamp();
		}
	}
}

module rails() {
	color([0.8, 0.8, 0.8, 0.4]) {
		translate(v=[-20,150,0]) {
			rotate(a = [90,0,0]) {
				cylinder(h=300, r=3.15, $fn=48);
			}
		}
		translate(v=[20,150,0]) {
			rotate(a = [90,0,0]) {
				cylinder(h=300, r=3.15, $fn=48);
			}
		}
	}
}

module ytop(yheight) {
	linear_extrude(file = "stage.dxf", height = yheight, center = true, convexity = 10);
}

module cartangleclamp() {
	translate([29,24,1]) {
		rotate(a = [90,180,0]) {
			color([0,1,0]) {
				import_stl("y-stage_batch7_v2_rotated.stl");
			}
		}
	}
}