// The MakerBot_M8_Extruder_Mount.stl is from 
// http://www.thingiverse.com/thing:2175 © 2010 by msruggles, GNU GPLv2


difference() {
	import_stl("MakerBot_M8_Extruder_Mount.stl");
	
	// Hole for M8 nylock nut, 14.55mm diameter at its widest.
	// 31mm from side corner (-26,-27,0) to center, 7mm from bottom 
	translate(v = [-26 -1.5, -27 + 31, 7]) {
		rotate(a = [0, 90, 0]) {
			cylinder(h = 3, r = 8.5);
		}
	}
	//rounded corners for topleft
	translate(v = [-36.2, 37.22, 0]) {
		rounded_tl_corner(4,23);
	}
	translate(v = [-26, 37.22, 0]) {
		rounded_tr_corner(4,23);
	}

	//rounded corners topright
	translate(v = [26, 37.22, 0]) {
		rounded_tl_corner(4,23);
	}
	translate(v = [36.2, 37.22, 0]) {
		rounded_tr_corner(4,23);
	}

	//rounded corner bottomleft
	translate(v = [-36.2, -37.4, 0]) {
		rounded_bl_corner(4,23);
	}

	//rounded  corner bottomright
	translate(v = [36.2, -37.4, 0]) {
		rounded_br_corner(4,23);
	}
}


module rounded_tl_corner(radius, height) {
	difference() {
		translate(v=[0,-radius,-1]) {
			cube([radius, radius, height], center=false);
		}
		translate(v=[radius, -radius, -1]) {
			cylinder(r=radius, h=height, $fn=48);
		}
	}
}

module rounded_bl_corner(radius, height) {
	difference() {
		translate(v=[0,0,-1]) {
			cube([radius, radius, height], center=false);
		}
		translate(v=[radius, radius, -1]) {
			cylinder(r=radius, h=height, $fn=48);
		}
	}
}

module rounded_tr_corner(radius, height) {
	difference() {
		translate(v=[-radius,-radius,-1]) {
			cube([radius, radius, height], center=false);
		}
		translate(v=[-radius, -radius, -1]) {
			cylinder(r=radius, h=height, $fn=48);
		}
	}
}

module rounded_br_corner(radius, height) {
	difference() {
		translate(v=[-radius,0,-1]) {
			cube([radius, radius, height], center=false);
		}
		translate(v=[-radius, radius, -1]) {
			cylinder(r=radius, h=height, $fn=48);
		}
	}
}
