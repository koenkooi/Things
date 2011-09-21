// Fancy box for beagleboard, (c) 2010,2011 - Koen Kooi, licensed under CC-BY-SA

// Conventions: width = x, length = y, height = z

// width of PCB
inside_width = 86.36;

// lenght of PCB
inside_length = 53.34;

// outside wall thickness
edge_thickness = 1;
bottom_thickness = 1;
border_size = 8;

base_height = 10;

// Number of facets in curves, 32 is a good tradeoff between looks and processing speed
$fn=16;

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

	difference() {
		minkowski()
		{
		 cube([iw - 4 * et ,il - 4 * et,base_height], center=true);
		 cylinder(r=et*3.01,h=1);
		}
		minkowski()
		{
		 translate(v=[0,0, -bt]) cube([iw - 2 * bs - 2 * et, il - 2 * bs - 2 * et, base_height], center=true);
		 cylinder(r=et*3,h=1);		
		}
		//The beaglebone has 2 radii, one 1/4" and one 1/2", we pick the smallest one
		translate(v=[0,0,bt]) minkowski()
		{
			cube([iw - 25.4/2,il - 25.4/2,base_height], center=true);
			cylinder(r=25.4/4,h=0.1);
		}


      // cape
      #translate(v = [-iw/2 + 18, -il/2,-base_height/2 -0.01]) {
        //cube([60, 10, bottom_thickness * 1.1], center=false);
      }    
      #translate(v = [-iw/2 + 18, il/2 - 10 ,-base_height/2 -0.01]) {
        //cube([60, 10, bottom_thickness * 1.1], center=false);
      }   			

      //ethernet
      #translate(v = [-iw/2 -et*1.5 + -0.01, 22.5 + -il/2, sh + pcbt]) {
        cube([et *2, 17, 20], center=false);
      }
      //power
      #translate(v = [-iw/2 -et*1.5 + -0.01, 5.5 +-il/2 -et, sh + pcbt]) {
        cube([et *2, 10, 20], center=false);
      }


      //microsd: 15mm long, 12.5mm corner offset
      #translate(v = [iw/2  -0.01, 10.5 +-il/2 -et, sh - pcbt]) {
        cube([et *2, 15, pcbt * 1.5], center=false);
      }

	}
}
