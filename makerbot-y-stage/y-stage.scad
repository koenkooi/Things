// Mockup of y-stage
// (c) 2010 Koen Kooi
// Licensed under the CC-BY-SA: http://creativecommons.org/licenses/by-sa/3.0/

// STL files by Will Langford: http://www.thingiverse.com/thing:3202 also CC-BY-SA

translate([0,0,0]) {
	rotate(a = [90,0,0]) {
		color([1,0,0]) {
			import_stl("y-stage-2_batch7_v2.stl");
		}
	}
}


translate([31,0,-2]) {
	rotate(a = [90,180,0]) {
		color([0,1,0]) {
			import_stl("y-stage_batch7_v2_rotated.stl");
		}
	}
}