difference() {
    union() {
        translate(v=[0,5,0]) cube([9,15,9]);
        translate(v=[4.5,5,0]) cylinder(h=9,r=4.5, $fn=64);
        translate(v=[9,9,0]) cube([8,11,3]);
        translate(v=[17,14.5,0]) cylinder(h=3,r=5.5, $fn=64);
    }
    // Standoff bolt
    translate(v=[4.5,5,-0.5]) cylinder(h=10,r=1.7, $fn=32);
    // PCB
    translate(v=[-0.005,-0.005,8]) cube([10.01,9.01,1.01]);
    // Antenna
    translate(v=[17,14.5,-0.5]) cylinder(h=10,r=3.4, $fn=32);
    // Antenna nut
    translate(v=[17,14.5,2.21]) cylinder(h=1,r=4.2, $fn=6);
    
    translate(v=[-5,20,3]) rotate(a=[60,0,0]) cube([20,10,20]);
}