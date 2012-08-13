// Fancy box for beagleboard, (c) 2010,2011 - Koen Kooi, licensed under CC-BY-SA

// Conventions: width = x, length = y, height = z

// width of PCB
inside_width = 88;

// lenght of PCB
inside_length = 55.3;

// outside wall thickness
edge_thickness = 2;
bottom_thickness = 1;
border_size = edge_thickness + 5;

base_height = 10;

// Number of facets in curves, 32 is a good tradeoff between looks and processing speed
$fn=32;

// helper sizes, disable for final rendering
//color([0,0,1]) helper(inside_width,inside_length,edge_thickness);

translate(v=[0,0,0]) box(inside_width, inside_length, bottom_thickness, base_height, border_size, edge_thickness);


module helper(inside_width,inside_length,edge_thickness) {
	translate(v=[edge_thickness,edge_thickness,-edge_thickness*2]) cube([inside_width,inside_length,edge_thickness], center=false);
	translate(v=[edge_thickness,edge_thickness,20]) cube([edge_thickness,inside_length,edge_thickness], center=false);
}


module box(iw, il, bt, base_height, bs, et ) {
	// mini usb height
	sh=4;
	pcbt= 2;
	extra_height = 0;

	box_length = il + 2*et;
	box_width = iw + 2*et;
	box_height = base_height + extra_height;

	radius=25.4/4;
	radius2=25.4/2;

	difference() {
		// outside part
		union() {
			// the corner radii are different, so we build it in 2 parts using intersection()
			intersection() {
				minkowski(){
					translate(v=[radius, radius, 0]) cube([iw - 2 * radius + 2*et ,il - 2 * radius + 2*et, box_height], center=false);
					cylinder(r=radius,h=1);
				}
				translate(v=[-et/2,-et/2, -box_height* 0.3]) cube([box_width/2 + 2*et, box_length * 1.1, box_height * 1.5]);	
			}
		
			// the corner radii are different, so we build it in 2 parts using intersection()
			intersection() {
				minkowski(){
					translate(v=[radius2, radius2, 0]) cube([iw - 2 * radius2 + 2*et ,il - 2 * radius2 + 2*et, box_height], center=false);
					cylinder(r=radius2,h=1);
				}
				translate(v=[iw/2 ,-et/2, -box_height* 0.3]) cube([box_width/2 + 2*et, box_length * 1.1, box_height * 1.5]);	
			}
		}

		// inside part
		translate(v=[et, et, et]) union() {
			// the corner radii are different, so we build it in 2 parts using intersection()
			intersection() {
				minkowski(){
					translate(v=[radius, radius, 0]) cube([iw - 2 * radius,il - 2 * radius, box_height], center=false);
					cylinder(r=radius,h=1);
				}
				translate(v=[-et/2,-et/2, -box_height* 0.3]) cube([box_width/2 + 2*et, box_length * 1.1, box_height * 1.5]);	
			}
		
			// the corner radii are different, so we build it in 2 parts using intersection()
			intersection() {
				minkowski(){
					translate(v=[radius2, radius2, 0]) cube([iw - 2 * radius2,il - 2 * radius2, box_height], center=false);
					cylinder(r=radius2,h=1);
				}
				translate(v=[iw/2 ,-et/2, -box_height* 0.3]) cube([box_width/2 + 2*et, box_length * 1.1, box_height * 1.5]);	
			}
		}

		// bottom cutout
		translate(v=[et + bs, et + bs, -et]) union() {
			// the corner radii are different, so we build it in 2 parts using intersection()
			intersection() {
				minkowski(){
					translate(v=[radius, radius, 0]) cube([iw - 2 * radius - 2*bs,il - 2 * radius - 2*bs, box_height], center=false);
					cylinder(r=radius,h=1);
				}
				translate(v=[-et/2,-et/2, -box_height* 0.3]) cube([box_width/2 + 2*et, box_length * 1.1, box_height * 1.5]);	
			}
		
			// the corner radii are different, so we build it in 2 parts using intersection()
			intersection() {
				minkowski(){
					translate(v=[radius2, radius2, 0]) cube([iw - 2 * radius2 - 2*bs ,il - 2 * radius2 - 2*bs, box_height], center=false);
					cylinder(r=radius2,h=1);
				}
				translate(v=[iw/2 ,-et/2, -box_height* 0.3]) cube([box_width/2 + 2*et, box_length * 1.1, box_height * 1.5]);	
			}
		}

			
      //ethernet
	
	translate(v=[et,et,et]) {
	     translate(v = [-et -0.01, 22.5, + sh + pcbt]) {
	       cube([et*3, 16, 20], center=false);
	     }
	     //power
	     translate(v = [-et -0.01, 5, sh + pcbt]) {
	       cube([et *2, 9.5, 20], center=false);
	     }
	
	     //mini-USB
	     translate(v = [-et + -0.01, 43, 0 ]) {
	       cube([et *2, 8, 4.5], center=false);
	     }
	
	      //microsd: 15mm long, 27mm corner offset
	     translate(v = [iw  -0.01, 28, sh - 1.5 *pcbt]) {
	        cube([et *2, 15, pcbt * 1.5], center=false);
	     }
	     translate(v = [iw  +2,  28, 1+sh - 1.5 *pcbt]) rotate(a=[0,-50,0]) {
	        cube([et *2, 15, pcbt * 1.5], center=false);
	     }	
	     translate(v = [iw  -2,  28, +sh - 1.4 *pcbt]) rotate(a=[0,50,0]) {
	        cube([et *2, 15, pcbt * 1.5], center=false);
	     }	
	      //USB
	     translate(v = [iw +0.01 - et, 12.5 , sh + pcbt]) {
	        cube([et *3, 14, 20], center=false);
	     }
	}

	}

}