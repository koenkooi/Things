// Fancy box for beagleboard, (c) 2010,2011 - Koen Kooi, licensed under CC-BY-SA

// Conventions: width = x, length = y, height = z

// width of PCB
inside_width = 87;

// lenght of PCB
inside_length = 54.3;

// outside wall thickness
edge_thickness = 0.8;
bottom_thickness = 1;
border_size = 8;

base_height = 10;

// Number of facets in curves, 32 is a good tradeoff between looks and processing speed
$fn=64;

// helper sizes, disable for final rendering
//helper(inside_width,inside_length,edge_thickness);
translate(v=[0,0,base_height/2]) box(inside_width, inside_length, bottom_thickness, base_height, border_size, edge_thickness);


module helper(inside_width,inside_length,edge_thickness) {
	translate(v=[0,0,-20]) cube([inside_width,inside_length,edge_thickness], center=true);
	translate(v=[-inside_width/2,0,20]) cube([edge_thickness,inside_length,edge_thickness], center=true);
}


module box(iw, il, bt, base_height, bs, et ) {

sh=0;
pcbt= 2;
box_length = inside_length + 2*et;
extra_height = 0;
radius=25.4/4;
radius2=25.4/2;
	union() {
		difference() {
			intersection() {
				minkowski()
					{
					 cube([iw - 2 * radius + 2*et ,il - 2 * radius + 2*et, base_height], center=true);
					 cylinder(r=radius,h=1);
					}	
				union() {
					minkowski()
						{
					 	cube([iw - 2 * radius2 + 2*et ,il - 2 * radius2 + 2*et, base_height], center=true);
					 	cylinder(r=radius2,h=1);
						}
					translate(v=[-iw/4,0,0]) cube([iw/2 + 2*et ,il + 2*et, base_height*1.2], center=true);
				}
			}
			minkowski(){
			 translate(v=[0,0, -bt]) cube([iw - 2 * bs - 2 * et, il - 2 * bs - 2 * et, base_height], center=true);
			 cylinder(r=et*3,h=1);		
			}
			translate(v=[0,0,bt]) intersection() {
				minkowski()
					{
					 cube([iw - 2 * radius ,il - 2 * radius, base_height], center=true);
					 cylinder(r=radius,h=1);
					}	
				union() {
					minkowski()
						{
					 	cube([iw - 2 * radius2 ,il - 2 * radius2, base_height], center=true);
					 	cylinder(r=radius2,h=1);
						}
					translate(v=[-iw/4,0,0]) cube([iw/2 ,il, base_height*1.2], center=true);
				}
			}
	
	
	      // cape
	      translate(v = [-iw/2 + 18, -il/2,-base_height/2 -0.01]) {
	        //cube([60, 10, bottom_thickness * 1.1], center=false);
	      }    
	      translate(v = [-iw/2 + 18, il/2 - 10 ,-base_height/2 -0.01]) {
	        //cube([60, 10, bottom_thickness * 1.1], center=false);
	      }   			
	
	      //ethernet
	      translate(v = [-iw/2 -et*1.5 + -0.01, 21.5 + -il/2, sh + pcbt]) {
	        cube([et *2, 16, 20], center=false);
	      }
	      //power
	      translate(v = [-iw/2 -et*1.5 + -0.01, 5.5 +-il/2 -et, sh + pcbt]) {
	        cube([et *2, 9.5, 20], center=false);
	      }
	
	      //mini-USB
	      translate(v = [-iw/2 -et*1.5 + -0.01, 41 +-il/2 -et, sh - 4 ]) {
	        cube([et *2, 8, 4.5], center=false);
	      }
	
	      //microsd: 15mm long, 27mm corner offset
	      translate(v = [iw/2  -0.01, 27 +-il/2 -et, sh - 1.5 *pcbt]) {
	        cube([et *2, 15, pcbt * 1.5], center=false);
	      }
	
	      //USB
	      translate(v = [iw/2  -0.01, 10.5 +-il/2 -et, sh + pcbt]) {
	        cube([et *2, 14, 20], center=false);
	      }
	
		}
	
		translate(v = [-iw/2 +14.5, il/2 -3,-base_height/2 -0.01]) cylinder(r=2.5,h=5);
		translate(v = [-iw/2 +14.5, -il/2 +3,-base_height/2 -0.01]) cylinder(r=2.5,h=5);
		translate(v = [iw/2 -5, il/2 -4,-base_height/2 -0.01]) cylinder(r=2,h=5);
		translate(v = [iw/2 -5, -il/2 +4,-base_height/2 -0.01]) cylinder(r=2,h=5);
	}
}
