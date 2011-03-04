// Cover for beagleboardbox, (c) 2010 - Koen Kooi, licensed under CC-BY-SA

// Box for beagleboard, (c) 2010 - Koen Kooi, licensed under CC-BY-SA

// lenght of PCB
inside_length = 87.5;

// width of PCB
inside_w = 86;

// outside wall thickness
edge_thickness = 3;
stud_height = edge_thickness;

// Set this to zero have a 'coaster' instead of a box
// The '7' value is chosen to stick just above the hdmi, musb and audio connectors
extra_height = 10;

// stud is inside the wall but aligned to the bottom, 
// so its stud_size x stud_size x (stud_height - edge_thickness) big
stud_size = 20;
pcb_thickness = 2;

// Round the inside and outside corners
use_rounded_corners = 1; // 0,1

inside_corner_radius = 8;
corner_radius = 8;

box_width = inside_w + (edge_thickness * 2); 
box_length = inside_length + (edge_thickness * 2);
box_height = stud_height + pcb_thickness + extra_height;

mirror([0,0,1]) translate(v = [ -box_width / 2, -box_length / 2, 0]) {   
  if(use_rounded_corners == 1) {
    roundedbox(box_width, box_length, box_height, edge_thickness, stud_size);
  } else {
    plainbox(box_width, box_length, box_height, edge_thickness, stud_size);
  }
}

module plainbox(box_width, box_length, box_height, edge_thickness, stud_size) {
  union() {
    difference() {
      //outside
      cube([box_width, box_length, box_height]);
      //inside
      translate(v = [edge_thickness, edge_thickness, edge_thickness]) {  
        cube([inside_w, inside_length, box_height]);
      }
      translate(v = [stud_size + edge_thickness, stud_size + edge_thickness, -edge_thickness]) {  
        cube([inside_w - 2 * stud_size, inside_length - 2 * stud_size, box_height]);
      }
      //S-video 16mm, 41mm corner offset
      translate(v = [41 + edge_thickness, -0.01, stud_height + pcb_thickness + 2]) {
        cube([16, edge_thickness + 0.02, extra_height + 0.01], center=false);
      }
      //eth + usb: 63mm long, 15mm corner offset
      translate(v = [15 + edge_thickness, box_length - edge_thickness - 0.01, stud_height + pcb_thickness -1 ]) {
        cube([63, edge_thickness + 0.02, extra_height + 0.01 + 1], center=false);
      }
      //power + otg: 38mm long, 41mm corner offset
      translate(v = [-0.01, 41 + edge_thickness, stud_height + pcb_thickness + 3.5]) {
        cube([edge_thickness + 0.02, 38, extra_height + 0.01], center=false);
      }
    } // end difference
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
      // lower stud due to serial header
      cube([stud_size, stud_size, stud_height -2], center = false);
    }
  } // end union
}

module roundedbox(box_width, box_length, box_height, edge_thickness, stud_size) {
  difference() {
    union() {
      plainbox(box_width, box_length, box_height, edge_thickness, stud_size);
  
        //rounded corner topleft
        translate(v = [edge_thickness + stud_size, box_length - edge_thickness - stud_size, 0]) {
          difference() {
            translate(v=[0,-inside_corner_radius,0]) {
              cube([inside_corner_radius,inside_corner_radius,edge_thickness]);
            }
            translate(v=[inside_corner_radius, -inside_corner_radius, -edge_thickness]) {
              cylinder(r=inside_corner_radius, h=3*edge_thickness, $fn=64);
            }
          }
        }
        //rounded corner topright
        translate(v = [box_width - edge_thickness - stud_size, box_length - edge_thickness - stud_size, 0]) {
          difference() {
            translate(v=[-inside_corner_radius,-inside_corner_radius,0]) {
              cube([inside_corner_radius,inside_corner_radius,edge_thickness]);
            }
            translate(v=[-inside_corner_radius, -inside_corner_radius, -edge_thickness]) {
              cylinder(r=inside_corner_radius, h=3*edge_thickness, $fn=64);
            }
          }
        }
        //rounded corner bottomright
        translate(v = [box_width - edge_thickness - stud_size, edge_thickness + stud_size, 0]) {
          difference() {
            translate(v=[-inside_corner_radius,0,0]) {
              cube([inside_corner_radius,inside_corner_radius,edge_thickness]);
            }
            translate(v=[-inside_corner_radius, inside_corner_radius, -edge_thickness]) {
              cylinder(r=inside_corner_radius, h=3*edge_thickness, $fn=64);
            }
          }
        }
        //rounded corner bottomleft
        translate(v = [edge_thickness + stud_size, edge_thickness + stud_size, 0]) {
          difference() {
            translate(v=[0,0,0]) {
              cube([inside_corner_radius,inside_corner_radius,edge_thickness]);
            }
            translate(v=[inside_corner_radius, inside_corner_radius, -edge_thickness]) {
              cylinder(r=inside_corner_radius, h=3*edge_thickness, $fn=64);
            }
          }
        }
    } //end union

    //rounded corner topleft
    translate(v = [0, box_length, 0]) {
      difference() {
        translate(v=[0 - 0.01,-corner_radius + 0.01, -0.5 * box_height]) {
          cube([corner_radius,corner_radius,2*box_height]);
        }
        translate(v=[corner_radius, -corner_radius, -0.5 * box_height]) {
          cylinder(r=corner_radius, h=2*box_height, $fn=64);
        }
      }
    }
    //rounded corner topright
    translate(v = [box_width, box_length, 0]) {
      difference() {
        translate(v=[-corner_radius + 0.01,-corner_radius + 0.01, -0.5 * box_height]) {
          cube([corner_radius,corner_radius,2*box_height]);
        }
        translate(v=[-corner_radius, -corner_radius, -0.5 * box_height]) {
          cylinder(r=corner_radius, h=2*box_height, $fn=64);
        }
      }
    }
    //rounded corner bottomright
    translate(v = [box_width, 0, 0]) {
      difference() {
        translate(v=[-corner_radius + 0.01,0 - 0.01, -0.5 * box_height]) {
          cube([corner_radius,corner_radius,2*box_height]);
        }
        translate(v=[-corner_radius, corner_radius, -0.5 * box_height]) {
          cylinder(r=corner_radius, h=2*box_height, $fn=64);
        }
      }
    }
    //rounded corner bottomleft
    translate(v = [0, 0, 0]) {
      difference() {
        translate(v=[0-0.01, -0.01, -0.5 * box_height]) {
          cube([corner_radius ,corner_radius,2*box_height]);
        }
        translate(v=[corner_radius, corner_radius, -0.5 * box_height]) {
          cylinder(r=corner_radius, h=2*box_height, $fn=64);
        }
      }
    }
  } //end difference
}