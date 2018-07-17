module roundedcube(x,y,z, radius=5, center=false){

    if(center==true) {
        tx = -x/2 + radius;
        ty = -y/2 + radius;
        tz = -z/2;
        cubehelper(x,y,z,tx,ty,tz, radius);
    } else {
        tx = radius;
        ty = radius;
        tz = 0;
        cubehelper(x,y,z,tx,ty,tz, radius);
    }
}

module cubehelper(x,y,z,tx,ty,tz, radius=5) {
    translate(v=[tx,ty,tz]) hull()
    {
        translate(v=[0,0,0]) cylinder(r=radius,h=z);
        translate(v=[x - radius*2,0,0]) cylinder(r=radius,h=z);
        translate(v=[x - radius*2,y - radius*2,0]) cylinder(r=radius,h=z);
        translate(v=[0,y - radius*2,0]) cylinder(r=radius,h=z);
    }
}    

module m3nut(support=true, hole=false) {
    m=3;
    nutheight=2.6;
    nutwidth=6.7;
    difference() {
        cylinder(h=nutheight,r=nutwidth/2, $fn=6);
        if(hole==true) {
            translate(v=[0,0,-0.5])cylinder(r=m/2,h=nutheight+1);
        }          
    }
    if(support==true) {
        translate(v=[-(nutwidth+0.3)/2,-m/2,nutheight- 0.001]) cube([nutwidth+0.3,m,0.15]);
        translate(v=[-m/2,-(nutwidth+0.3)/2,nutheight+0.15 - 0.001]) cube([m,nutwidth+0.3,0.15]);
    }    
}

module m6nut(support=true, hole=false) {
    m=6;
    nutheight=5.2;
    nutwidth=11.7;
    difference() {
        cylinder(h=nutheight,r=nutwidth/2, $fn=6);
        if(hole==true) {
            translate(v=[0,0,-0.5])cylinder(r=m/2,h=nutheight+1);
        }    
    }
    if(support==true) {
        translate(v=[-(nutwidth+0.3)/2,-m/2,nutheight]) cube([nutwidth+0.3,m,0.15]);
        translate(v=[-m/2,-(nutwidth+0.3)/2,nutheight+0.15]) cube([m,nutwidth+0.3,0.15]);
    } 
}

module m6bolt(height=40) {
    m=6;
    headwidth=12;
    cylinder(h=height+3,r=m/2);
    cylinder(h=3,r=headwidth/2,$fn=6);
}    