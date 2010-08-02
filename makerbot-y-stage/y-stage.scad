// Mockup of y-stage
// (c) 2010 Koen Kooi
// Licensed under the CC-BY-SA: http://creativecommons.org/licenses/by-sa/3.0/

// STL files by Will Langford: http://www.thingiverse.com/thing:3202 also CC-BY-SA

translate([-1,0,3]) {
	rotate(a = [90,0,0]) {
		color([1,0,0]) {
			import_stl("y-stage-2_batch7_v2.stl");
		}
	}
}


translate([30,0,1]) {
	rotate(a = [90,180,0]) {
		color([0,1,0]) {
			import_stl("y-stage_batch7_v2_rotated.stl");
		}
	}
}



// rails

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

