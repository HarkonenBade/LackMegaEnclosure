// M5 CSK fitting 90deg bevel
// h - length of the drill bore including csk
// csk - diameter of the csk
// recess - recess of the csk, added above the csk
module m5csk(h=5, csk=10, recess=0) {
    m5bore(h=h);
    translate([0, 0, -(csk/2 - h)]) cylinder(d2=csk, d1=0, h=(csk/2), $fn=32);
    translate([0, 0, h]) cylinder(h=recess, d=csk);
}

// M5 clearance bore
// h - length of the bore
module m5bore(h=5) {
    cylinder(d=5.5, h=h, $fn=32);
}

module quarter_cylinder(r, h) {
    $fn=128;
    intersection() {
        cylinder(r=r, h=h);
        translate([0, 0, -0.05]) cube([r, r, h+0.1]);
    }
}

module ccube(size, center=false) {
    if(center){
        translate(-(size/2)) cube(size);
    } else {
        translate([-size.x/2, -size.y/2, 0]) cube(size);
    }
}
