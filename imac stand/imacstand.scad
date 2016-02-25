$fn=16;

rotate(a=[90,0,0]) union() {
    difference() {
        hull() {
            for (i=[0:3])
                translate([(i % 2) * 50 + 2.5, (i - i % 2) * 8, 0]) {
                    cylinder(r=5, h=1);
                    translate([0, 0, 57.5]) sphere(5);
                }
        }
        translate(v=[5,-6,35]) hull() {
            for (i=[0:3])
                translate([(i % 2) * 18.5 +1, (i - i % 2) * 15.75, 0]) {
                    translate([0, 0, 18.9]) sphere(1);
                    translate([0, 0, 0.5]) sphere(1);
                }
        }
        translate(v=[30,-6,35]) hull() {
            for (i=[0:3])
                translate([(i % 2) * 18.5 +1, (i - i % 2) * 15.75, 0]) {
                    translate([0, 0, 18.9]) sphere(1);
                    translate([0, 0, 0.5]) sphere(1);
                }
        }
    }
    
    translate(v=[12.5,-5,34.4]) cube([5.5,25.95,2]);
    translate(v=[12.5,-5,52.9]) cube([5.5,25.95,2]);
    translate(v=[5,-5,42]) cube([2,25.95,5.5]);
    translate(v=[23.6,-5,42]) cube([2,25.95,5.5]);
    
    
    translate(v=[37.5,-5,34.4]) cube([5.5,25.95,2]);
    translate(v=[37.5,-5,52.9]) cube([5.5,25.95,2]);
    translate(v=[30,-5,42]) cube([2,25.95,5.5]);
    translate(v=[48.6,-5,42]) cube([2,25.95,5.5]);
}