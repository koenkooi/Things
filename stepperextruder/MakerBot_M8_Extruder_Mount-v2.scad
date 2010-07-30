// The MakerBot_M8_Extruder_Mount.stl is from http://www.thingiverse.com/thing:2175 © 2010 by msruggles, GNU GPLv2


difference() {
	import_stl("MakerBot_M8_Extruder_Mount.stl");
	
	// Hole for M8 nylock nut, 14.55mm diameter at its widest.
	// 32mm from side corner (-26,-27,0) to center, 7mm from bottom 
	translate(v = [-26 -1.5, -27 + 32, 7]) {
		rotate(a = [0, 90, 0]) {
			cylinder(h = 3, r = 8.5);
		}
	}
}

