// Fancy box for beagleboard, (c) 2010,2011 - Koen Kooi, licensed under CC-BY-SA

// Conventions: width = x, length = y, height = z


// width of PCB
inside_width = 86;

// lenght of PCB
inside_length = 87.5;

// outside wall thickness
edge_thickness = 2.4;
bottom_thickness = 1.5;
border_size = 10;

base_height = 13.5;

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

sh=2.5;
pcbt= 2;
box_length = inside_length + 2*et;
extra_height = 5;

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
		translate(v=[0,0,bt]) cube([iw,il,base_height], center=true);



      //audio + hdmi: 63mm long, 15mm corner offset
      #translate(v = [-iw/2 + 15, -il/2 -et * 1.5, sh + pcbt]) {
        cube([63, et * 2, extra_height + 0.01], center=false);
      }
      //eth + usb: 63mm long, 15mm corner offset
      #translate(v = [-iw/2 + 15, il/2  - et/2, sh + pcbt -1 ]) {
        cube([63, et * 2, extra_height + 0.01 + 1], center=false);
      }
      //power + otg + serial: 51mm long, 28mm corner offset
      #translate(v = [-iw/2 -et*1.5 + -0.01, 28 + -il/2, sh + pcbt]) {
        cube([et *2, 51, extra_height + 0.01], center=false);
      }
      //microsd: 15mm long, 12.5mm corner offset
      translate(v = [-iw/2 -et*1.5 + -0.01, 12.5 +-il/2 -et, sh - pcbt]) {
        cube([et *2, 15, pcbt * 1.5], center=false);
      }


	}
}
