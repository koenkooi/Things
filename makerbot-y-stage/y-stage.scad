// Mockup of y-stage
// (c) 2010 Koen Kooi
// Licensed under the CC-BY-SA: http://creativecommons.org/licenses/by-sa/3.0/

// STL files by Will Langford: http://www.thingiverse.com/thing:3202 also CC-BY-SA

//rails();
cart();


module rails() {
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

module cart() {
	difference() {
		union() {
			translate([-1,0,2.5]) {
				rotate(a = [90,0,0]) {
					color([1,0,0]) {
						import_stl("y-stage-2_batch7_v2.stl");
					}
				}
			}
			//vertical bearing holder
			translate(v = [-40,-48,0]) {
				rotate(a = [0,0,180]) {
					difference() {	
						translate([-1,0,2.5]) {
							rotate(a = [90,0,0]) {
								color([0,1,0,0.5]) {
									import_stl("y-stage-2_batch7_v2.stl");
								}
							}
						}
						translate(v = [0,-50,-20]) {
							cube([60,60,50], center=false);
						}
						translate(v = [-60,-60,18.1]) {
							cube([70,70,20], center=false);
						}
					}
				}
			}
			translate(v=[-28,-48,16.25]) {
				cube([5,47.8,2]);
			}
		} /// end union
		translate(v=[-20,-49,-24]) {
			cube([15,50,40]);
		}
		translate(v=[-42.3,-49,5]) {
			cube([15,50,20]);
		}
}	
/*	
	translate([30,0,1]) {
		rotate(a = [90,180,0]) {
			color([0,1,0]) {
				import_stl("y-stage_batch7_v2_rotated.stl");
			}
		}
	}
*/
}