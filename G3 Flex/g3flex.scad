include <../koenlib.scad>

$fn=200;
wallthickness=1;
g3flexradius=24.4;
zaagdiameter=57.8;
extradia=10;

// 64, 56, 51

g3flexeavemount();
%translate(v=[0,0,-32]) g3flex();



module g3flexeavemount() {
    difference() {
        union() {
            //13mm ply
            translate(v=[0,0,-12]) cylinder(r1=zaagdiameter/2, r2=zaagdiameter/2 + 0.5, h=12.1);
            translate(v=[0,0,-0.5])cylinder(r=zaagdiameter/2 + extradia, h=0.51);
            cylinder(r=zaagdiameter/2 + extradia, r2=g3flexradius, h=6);
            cylinder(r=g3flexradius+wallthickness,h=15);
        }
        //ethernet
        translate(v=[-22/2,g3flexradius-8,-17]) roundedcube(22,10,20,5);
        translate(v=[0,0,-25]) cylinder(r=g3flexradius,h=120);
        
        for(angle = [0:10:360]) {
            translate(v=[sin(angle) * (g3flexradius +6.2),cos(angle)* (g3flexradius +6.2) ,-20.51]) cylinder(r=1.6,h=20);
        }    
        
        for(angle = [-120,0,120]) {
            translate(v=[sin(angle) * (g3flexradius + extradia -1 ),cos(angle)* (g3flexradius + extradia -1) ,-38]) schroef();
        }
    }
}

module g3flex() {
    difference() {
        union() {
            cylinder(r=g3flexradius,h=30);
            translate(v=[0,0,30-0.01]) cylinder(r=g3flexradius-1,h=.72);
            translate(v=[0,0,30.7 - 0.01 ])cylinder(r=g3flexradius,h=107.5-g3flexradius - 30.7);
            translate(v=[0,0,107.5-g3flexradius]) sphere(r=g3flexradius);
        }
        //ethernet
        translate(v=[-19/2,g3flexradius-23,-0.01]) cube([19,30,17]);
        // microsd???
        translate(v=[-8/2,g3flexradius,51]) rotate(a=[90,0,0])roundedcube(8,1,10,0.5);
        translate(v=[-8/2,g3flexradius,51]) rotate(a=[90,0,0])roundedcube(8,1,10,0.5);
        //lens
        translate(v=[-80/2,-g3flexradius-4,68]) cube([80,20,80]);
        translate(v=[-30,-g3flexradius,68])rotate(a=[0,90,0]) cylinder(r=16,h=60);
    }
    translate(v=[0,0,107.5 - g3flexradius]) difference() {
        sphere(r=g3flexradius-2);
        translate(v=[-25,- g3flexradius -6,-25])cube([50,10,50]);
    }
}

module schroef() {
    cylinder(r=2,h=40);
    translate(v=[0,0,38]) cylinder(r2=4.3,r1=2,h=5);
    translate(v=[0,0,43-0.01]) cylinder(r=4.3,h=45);
} 