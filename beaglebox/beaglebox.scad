// Box for beagleboard, (c) 2010 - Koen Kooi, licensed under CC-BY-SA

/* gcode start.txt
G1 X-25.0 Y20.0 Z0.44 F1500
M101
G1 X-25.0 Y-20.0 Z0.4 F945
G1 X25.0 Y-20.0 Z0.4 F945
G1 X25.0 Y20.0 Z0.4 F945
G1 X-25.0 Y20.0 Z0.4 F945
*/


inside_l = 77.8;
inside_w = 79.8;
edge_thickness = 2.6;

// stud is inside the wall but aligned to the bottom, 
// so its stud_size x stud_size x (stud_height - edge_thickness) big
stud_size = 4;
stud_height = 5;
pcb_thickness = 2;
// Set this to zero have a 'coaster' instead of a box
extra_height = 5;

box_length = inside_l + (edge_thickness * 2);
box_width = inside_w + (edge_thickness * 2); 
box_height = stud_height + pcb_thickness + extra_height;

// Put knobs on studs
use_knobs = 0;
knob_height = 1;

//rounded corners
use_rounded_corners = 1;
inside_corner_radius = edge_thickness*2;
corner_radius = edge_thickness*2;

translate(v = [ -box_width / 2, -box_length / 2, 0]) { 	
	difference() {
		union() {
			// hollowed out box
			difference() {					
				//outside
				cube([box_width, box_length, box_height], center = false);	
				//inside
				translate(v = [edge_thickness, edge_thickness, edge_thickness]) {	
					cube([inside_w, inside_l, box_height], center = false);
				}
				//hole
				translate(v = [stud_size + edge_thickness, 
				               stud_size + edge_thickness, 
				               -edge_thickness]) {	
					cube([inside_w - stud_size * 2, inside_l - stud_size * 2, box_height], center = false);
				}
				 
			}

			if(use_rounded_corners == 1) {
				//rounded corner topleft
				translate(v = [edge_thickness + stud_size, box_length - edge_thickness - stud_size, 0]) {
					difference() {
						translate(v=[0,-inside_corner_radius,0]) {
							cube([inside_corner_radius,inside_corner_radius,edge_thickness], center=false);
						}
						translate(v=[inside_corner_radius, -inside_corner_radius, 0]) {
							cylinder(r=inside_corner_radius, h=edge_thickness);
						}
					}
				}
				//rounded corner topright
				translate(v = [box_width - edge_thickness - stud_size, box_length - edge_thickness - stud_size, 0]) {
					difference() {
						translate(v=[-inside_corner_radius,-inside_corner_radius,0]) {
							cube([inside_corner_radius,inside_corner_radius,edge_thickness], center=false);
						}
						translate(v=[-inside_corner_radius, -inside_corner_radius, 0]) {
							cylinder(r=inside_corner_radius, h=edge_thickness);
						}
					}
				}
				//rounded corner bottomright
				translate(v = [box_width - edge_thickness - stud_size, edge_thickness + stud_size, 0]) {
					difference() {
						translate(v=[-inside_corner_radius,0,0]) {
							cube([inside_corner_radius,inside_corner_radius,edge_thickness], center=false);
						}
						translate(v=[-inside_corner_radius, inside_corner_radius, 0]) {
							cylinder(r=inside_corner_radius, h=edge_thickness);
						}
					}
				}
				//rounded corner bottomleft
				translate(v = [edge_thickness + stud_size, edge_thickness + stud_size, 0]) {
					difference() {
						translate(v=[0,0,0]) {
							cube([inside_corner_radius,inside_corner_radius,edge_thickness], center=false);
						}
						translate(v=[inside_corner_radius, inside_corner_radius, 0]) {
							cylinder(r=inside_corner_radius, h=edge_thickness);
						}
					}
				}
			} // end if rounded corners

			//support studs
			translate(v = [edge_thickness, edge_thickness, 0]) {
				cube([stud_size, stud_size, stud_height], center = false);
			}
			translate(v = [box_width - stud_size - edge_thickness, edge_thickness, 0]) {
				cube([stud_size, stud_size, stud_height], center = false);
			}
			translate(v = [box_width - stud_size - edge_thickness, box_length - stud_size - edge_thickness, 0]) {
				cube([stud_size, stud_size, stud_height], center = false);
			}
			translate(v = [edge_thickness, box_length - stud_size - edge_thickness, 0]) {
				cube([stud_size, stud_size, stud_height], center = false);
			}
			if(use_knobs == 1)
				{	
				// bolt studs
				translate(v = [edge_thickness + stud_size / 2 + 0.7,
				               edge_thickness + stud_size / 2 + 0.7,
				               stud_height]) {
					cylinder(h = knob_height, r = 1.3);
				}
				// bolt studs
				translate(v = [box_width - edge_thickness - stud_size / 2 -0.7,
				               edge_thickness + stud_size / 2 + 0.7,
				               stud_height]) {
					cylinder(h = knob_height, r = 1.3);
				}
				// bolt studs
				translate(v = [box_width - edge_thickness - stud_size / 2 -0.7,
				               box_length - edge_thickness - stud_size / 2 -0.7,
				               stud_height]) {
					cylinder(h = knob_height, r = 1.3);
				}
				// bolt studs
				translate(v = [edge_thickness + stud_size / 2 + 0.7,
				               box_length - edge_thickness - stud_size / 2 -0.7,
				               stud_height]) {
					cylinder(h = knob_height, r = 1.3);
				}
			}
		} // end union
		//audio: 62mm long, 10mm corner offset
		translate(v = [10 + edge_thickness, 0, stud_height + pcb_thickness]) {
			cube([62, edge_thickness, extra_height], center=false);
		}
		//sd: 45mm long, 9mm corner offset
		translate(v = [9 + edge_thickness, box_length - edge_thickness, stud_height + pcb_thickness]) {
			cube([45, edge_thickness, extra_height], center=false);
		}
		//power: 23mm long, 21mm corner offset
		translate(v = [0,21 + edge_thickness, stud_height + pcb_thickness]) {
			cube([edge_thickness, 23, extra_height], center=false);
		}

		if(use_rounded_corners == 1) {
			//rounded corner topleft
			translate(v = [0, box_length, 0]) {
				difference() {
					translate(v=[0,-corner_radius,0]) {
						cube([corner_radius,corner_radius,box_height], center=false);
					}
					translate(v=[corner_radius, -corner_radius, 0]) {
						cylinder(r=corner_radius, h=box_height);
					}
				}
			}
			//rounded corner topright
			translate(v = [box_width, box_length, 0]) {
				difference() {
					translate(v=[-corner_radius,-corner_radius,0]) {
						cube([corner_radius,corner_radius,box_height], center=false);
					}
					translate(v=[-corner_radius, -corner_radius, 0]) {
						cylinder(r=corner_radius, h=box_height);
					}
				}
			}
			//rounded corner bottomright
			translate(v = [box_width, 0, 0]) {
				difference() {
					translate(v=[-corner_radius,0,0]) {
						cube([corner_radius,corner_radius,box_height], center=false);
					}
					translate(v=[-corner_radius, corner_radius, 0]) {
						cylinder(r=corner_radius, h=box_height);
					}
				}
			}
			//rounded corner bottomleft
			translate(v = [0, 0, 0]) {
				difference() {
					translate(v=[0,0,0]) {
						cube([corner_radius,corner_radius,box_height], center=false);
					}
					translate(v=[corner_radius, corner_radius, 0]) {
						cylinder(r=corner_radius, h=box_height);
					}
				}
			}
		} // end if rounded corners


	} // end difference
} // end translate

