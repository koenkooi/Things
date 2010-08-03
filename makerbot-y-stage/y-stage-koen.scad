// Mendel style y carriage
// (c) Koen Kooi 2010
// stage.dxf from makerbot SVN

rails();
cartangleclamp();

translate(v = [0,0,20]) {
	ytop(5);
}


module rails() {
	color([0.8, 0.8, 0.8, 0.4]) {
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
}

module ytop(yheight) {
	color([0,0,1]) {
		linear_extrude(file = "stage.dxf", height = yheight, center = true, convexity = 10);
	}
}

module cartangleclamp() {
	translate([30,24,1]) {
		rotate(a = [90,180,0]) {
			color([0,1,0]) {
				import_stl("y-stage_batch7_v2_rotated.stl");
			}
		}
	}
}