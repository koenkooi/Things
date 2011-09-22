// (c) Koen Kooi 2011

// arduino:

$fn = 10;

module arduinomega() {
	union() {
		color([0.1,0.35,0.5]) translate([0,0,-1.6]) cube([53.3,101.64,1.6]);
		translate([10,-7,0.5]) color([0.8,0.8,0.8]) cube([12,16.5,10]); //usb
		translate([41,-2,0.5]) difference() {
			color([0,0,0]) cube([9,14,11]);
			translate(v=[4.5,5.9,7]) rotate(a=[90,0,0]) cylinder(r=3,h=6); 
		} //power
		translate([1.5,23,0]) color([0,0,0]) cube([2.4,20.7,8.5]); //shield
		translate([1.5,44.4,0]) color([0,0,0]) cube([2.4,20.7,8.5]); //shield
		translate([1.5,67.1,0]) color([0,0,0]) cube([2.4,20.7,8.5]); //shield
		translate([50,50,0]) color([0,0,0]) cube([2.4,20.7,8.5]); //shield
		translate([50,72,0]) color([0,0,0]) cube([2.4,20.7,8.5]); //shield
		translate([1.5,93,0]) color([0,0,0]) cube([46,5,8.5]); //shield
		translate([50,31.5,0]) color([0,0,0]) cube([2.4,16.7,8.5]); //shield
	}
}

module sdramps14() {
	union() {
		color([0,1,0]) cube([60.25,101.42,1.6]);
		translate([11.5,30,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([11.5,51,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([24,30,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([24,51,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([34,30,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([34,51,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([34,72,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([47,30,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([47,51,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu
		translate([47,72,1.6]) color([0,0,0]) cube([2.4,20.7,8.5]); //pololu

		translate([1.5,23,-2.45]) color([0,0,0]) cube([2.4,20.7,2.5]); //shield
		translate([1.5,44.4,-2.45]) color([0,0,0]) cube([2.4,20.7,2.5]); //shield
		translate([1.5,67.1,-2.45]) color([0,0,0]) cube([2.4,20.7,2.5]); //shield
		translate([50,50,-2.45]) color([0,0,0]) cube([2.4,20.7,2.5]); //shield
		translate([50,72,-2.45]) color([0,0,0]) cube([2.4,20.7,2.5]); //shield
		translate([1.5,93,-2.45]) color([0,0,0]) cube([46,5,2.5]); //shield
		translate([50,31.5,-2.45]) color([0,0,0]) cube([2.4,16.7,2.5]); //shield


		translate([6.5,10,1.6]) color([0,0,1]) cube([30,7.6,10]); // output
		translate([38,4,1.6]) color([0,0,1]) cube([20,7.6,10]); // input

		translate([54,32,1.6]) color([0.5,0.5,0.5]) cube([6.5,7.5,6.5]); // resetbuttonhousing
		translate([59,35.5,5]) color([0,0,0]) rotate(a=[0,90,0]) cylinder(r=1.75,h=3); // resetbutton
	}
	translate([55,90,5]) color([0,1,0]) cube([27.3,16.3,1.6]);	
}

module bol() {
	difference() {
		sphere(r=3.4);
		translate(v=[0,0,-1.7]) cube([7,7,3.4], center=true);
	}
}

module doos() {
	union() {
		color([0.3,0.3,0.3,0.95]) difference() { 
			minkowski()
			{
				cube([62,85,48]);
				//cylinder(r=2,h=0.1);
				rotate(a=[90,0,0]) cylinder(r=3, h=0.1);
	
			}
			translate([0,2,0]) cube([62,121,48]);
	
			// slice off a corner to view the inside, disable for final model
			//translate(v=[70,-40,-10])  rotate(a=[0,0,45]) cube([40,40,70]);
	
			// arduino usb
			translate([9.5,-7,5]) cube([13,16.5,11]);
	
			// arduino power
			minkowski() {
				translate([42,-5,5.6]) cube([7.5,14,9.8]);
				rotate(a=[90.0,0]) cylinder(r=1,h=0.1);
			}
	
			// RAMPS power input
			minkowski() {
				translate([41.5,-3,21.5]) cube([14,7.6,0.5]);
				rotate(a=[90.0,0]) cylinder(r=3,h=0.1);
			}
	
			// RAMPS power output
			minkowski() {
				translate([11,-3,21.5]) cube([23,7.6,0.5]);
				rotate(a=[90,0,0]) cylinder(r=3,h=0.1);
			}
	
			// RAMPS reset button
			minkowski() {
				translate([60,34,20]) cube([6.5,5.5,4.5]);
				rotate(a=[0,90,0]) cylinder(r=1,h=0.1);
			}

			// ventilation holes
			for (z = [0:4:56]) {
				minkowski() {	
					translate([3 + z,-1,30]) cube([0.1,4,15]);
					rotate(a=[90,0,0]) cylinder(r=1,h=0.1);
				}
			}			
	
		}
	

		translate(v=[20,60,-0.01]) bol();
		translate(v=[40,60,-0.01]) bol();
	}
}


arduinomega();
translate([0,0,11.1]) sdramps14();
translate([0,-2.1,-5])doos(); 