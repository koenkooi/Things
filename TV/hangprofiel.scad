rotate(a=[0,90,0]) 
difference() { 
    union() {
        cube([40,6.5,8.5]);
        translate(v=[0,-2,2.125]) cube([40,2.5,4.5]);
        translate(v=[0,-6.5,-2]) cube([40,5,12.5]);
    }
    translate(v=[20,7,4.5]) rotate(a=[90,0,0]) cylinder(h=15,r=1.5, $fn=64);
}