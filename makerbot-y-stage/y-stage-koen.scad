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

color([0,0,1]) { cart(); }

drawstuff = 0;

if(drawstuff == 1) {
	rails();
	color([0,1,0]) { cartangleclamp(); }
	cartbearings();
}

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
			translate(v=[-28,-24,-14.5]) { cube([5,48,32.1]);}
			translate(v=[11.5,-24,15]) { cube([5,48,3]);}

			//clamp support
			translate(v = [1,6,-16.5]) { cube([4.3,8,14.5]);}
			translate(v = [1,-14,-16.5]) { cube([4.3,8,14.5]);}
			translate(v = [2.15,-24,-16.5]) { cube([3.2,48,3.5]);}
			translate(v = [1,-14,-2]) { rotate(a=[0,35,0]){ cube([6,8,18]);}}
			translate(v = [1,6,-2]) { rotate(a=[0,35,0]){ cube([6,8,18]);}}


			//fill in some holes
			translate(v = [-28,-23,17.5]) {
				cube([26,6,5]);
			}
			translate(v = [-28,17,17.5]) {
				cube([26,6,5]);
			}
			translate(v = [14,-23,17.5]) {
				cube([10,6,5]);
			}
			translate(v = [14,17,17.5]) {
				cube([10,6,5]);
			}

			translate(v = [-7,-14,17.5]) {
				cube([6,10,5]);
			}
			translate(v = [-7,4,17.5]) {
				cube([6,10,5]);
			}

			translate( v= [40,0,0]) {
				rotate(a = [0,0,180]) {
					cartangleclamp();
				}
			}

		} // end union

		// rail clearance
		translate(v=[-20,25,0]) {
			rotate(a = [90,0,0]) {
				cylinder(h=50, r=5, $fn=48);
			}
		}


		//bearing axles
		translate(v=[-35,20,9.5]) {rotate(a = [90,0,90]) { cylinder(h=70, r=2, $fn=48); } }
		translate(v=[-35,-20,9.5]) {rotate(a = [90,0,90]) { cylinder(h=70, r=2, $fn=48); } }
		translate(v=[-35,20,-9.5]) {rotate(a = [90,0,90]) { cylinder(h=20, r=2, $fn=48); } }
		translate(v=[-35,-20,-9.5]) {rotate(a = [90,0,90]) { cylinder(h=20, r=2, $fn=48); } }

		translate(v=[14,20,-8]) {rotate(a = [0,-38,0]) { cylinder(h=13, r=2, $fn=48); } }
		translate(v=[14,-20,-8]) {rotate(a = [0,-38,0]) { cylinder(h=13, r=2, $fn=48); } }
		translate(v=[26,20,-8]) {rotate(a = [0,38,0]) { cylinder(h=13, r=2, $fn=48); } }
		translate(v=[26,-20,-8]) {rotate(a = [0,38,0]) { cylinder(h=13, r=2, $fn=48); } }


		//countersink M4 bolthole to make room for beltclamp
		translate(v = [1.9,0,-9]) { rotate(a = [0,90,0]) { cylinder(r1=3.8, r2=1.9, h=2.5, $fn=24); }}
		translate(v = [-29,0,-9]) { rotate(a = [0,90,0]) { cylinder(r=6,h=7, $fn=24); }}
		translate(v = [-26,0,-16]) {  cube([7,12,15], center=true); }

	
		//clampholes
		translate(v = [0,10,-4.5]) { rotate(a = [0,90,0]) { cylinder(r=1.5,h=13, $fn=24); }}
		translate(v = [0,-10,-4.5]) { rotate(a = [0,90,0]) { cylinder(r=1.5,h=13, $fn=24); }}
		translate(v = [7,10,-4.5]) { rotate(a = [0,90,0]) { cylinder(r=2.6,h=8, $fn=24); }}
		translate(v = [7,-10,-4.5]) { rotate(a = [0,90,0]) { cylinder(r=2.6,h=8, $fn=24); }}


		translate(v = [0,10,-13.5]) { rotate(a = [0,90,0]) { cylinder(r=1.5,h=6, $fn=24); }}
		translate(v = [0,-10,-13.5]) { rotate(a = [0,90,0]) { cylinder(r=1.5,h=6, $fn=24); }}

		//overhangs
		translate(v = [1.1,-7.8,-16.5]) { rotate(a=[0,0,60]){ cube([2,2,16]); }}
		translate(v = [0.3,-15,-16.5]) { rotate(a=[0,0,30]){ cube([2,2,16]); }}
		translate(v = [1.1,12.2,-16.5]) { rotate(a=[0,0,60]){ cube([2,2,16]); }}
		translate(v = [0.3,5,-16.5]) { rotate(a=[0,0,30]){ cube([2,2,16]); }}

		} //end difference
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
	linear_extrude(file = "stage.dxf", height = yheight, center = true, convexity = 20);
}

module cartangleclamp() {
	translate([29,24,1]) {
		rotate(a = [90,180,0]) {
			import_stl("y-stage_batch7_v2_rotated.stl");
		}
	}
}