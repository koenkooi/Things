// cpu keepout = 38 x 38 mm
// Holes are 3mm
// CPU = 25 x 25 mm
// Fan holes 32mm apart, center to center, M3.5

difference() {
    union() {
        cube([38,38,10]);
        translate(v=[1, -3,0]) rotate(a=[0,0,45]) cube ([5,6,10]);
        translate(v=[37, 32.75,0]) rotate(a=[0,0,45]) cube ([5,6,10]);
        
        translate(v=[33, 0,10]) cube([5,5,2]);
        translate(v=[0,33,10]) cube([5,5,2]);
        
        translate(v=[-2.25, -2.25,10]) cylinder(r=3.5,h=2, $fn=32);
        translate(v=[38 + 2.25, 38 + 2.25,10])cylinder(r=3.5,h=2, $fn=32);  
        
        translate(v=[-2.25, -2.25,0]) cylinder(r=5.5,h=10, $fn=64);
        translate(v=[38 + 2.25, 38 + 2.25,0])cylinder(r=5.5,h=10, $fn=64);
    }
    translate(v=[(38-28)/2, (38-28)/2,-1]) cube([28,28,15]);
    translate(v=[-2.25, -2.25,-1]) cylinder(r=1.5,h=18, $fn=32);
    translate(v=[38 + 2.25, 38 + 2.25,-1])cylinder(r=1.5,h=18, $fn=32);

    translate(v=[-10,19,18])rotate(a=[0,90,0]) cylinder(r=16.5,h=50, $fn=128);
    translate(v=[19,40,18])rotate(a=[90,0,0]) cylinder(r=16.5,h=50, $fn=128);

    translate(v=[3,3,-1]) {
        translate(v=[0,0,0])   cylinder(r=1.5,h=9, $fn=32);
        translate(v=[0,32,0])  cylinder(r=1.5,h=9, $fn=32);
        translate(v=[32,32,0]) cylinder(r=1.5,h=9, $fn=32);
        translate(v=[32,0,0])  cylinder(r=1.5,h=9, $fn=32);
    }

}