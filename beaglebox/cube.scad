$fn = 96;


difference() {
	union() {
		cube([40,10,5], center=true);
		intersection() {
			translate(v=[0,15,0]) cube([30,20,5], center=true);
			translate(v=[0,0,-10]) sphere(r=13.5);
		}
	}
	translate(v=[20,5,3]) rotate(a=[0,20,45]) cube([30,20,10], center=true);
	translate(v=[-10,0,-10]) cylinder(r=4,h=20, $fn=8);
}