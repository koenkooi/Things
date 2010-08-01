
translate([15.5,8.5,0.7]) {
	rotate(a = [0,-90,0]) {
		color([1,0,0]) {
			import_stl("11t17p.stl");
		}
	}
}

translate([1,-19,10.3]) {
	rotate(a = [0,90,0]) {
		color([0,1,0]) {
			import_stl("39t17p.stl");
		}
	}
}

translate([-15,-44,11]) {
	rotate(a = [-90,0,0]) {
		color([0.4,0.4,0.4]) {
			import_stl("M8_Extruder_Idler_Block_Beefy.stl");
		}
	}
}

translate([0,0,0]) {
	color([1,1,0,0.8]) {
		rotate(a = [90,0,-90]) {
			import_stl("MakerBot_M8_Extruder_Block_V2.stl");
		}
	}
}

translate([-10,-13.5,6.5]) {
	rotate(a = [90,0,0]) {
		color([0,0,1,0.6]) {
			import_stl("MakerBot_M8_Extruder_Mount-v2.stl");
		}
	}
}