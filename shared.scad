SIDE_PANEL_THICK=3;
CENTRE_PANEL_THICK=9;
PILLAR_HEIGHT=100;
CLEAR = 0.5;
SLOT_WALL = 2.5;

SIDE_PANEL_SLOT=SIDE_PANEL_THICK+CLEAR+SLOT_WALL*2;
CENTRE_PANEL_SLOT=CENTRE_PANEL_THICK+CLEAR+SLOT_WALL*2;

// M5 CSK fitting 90deg bevel
// h - length of the drill bore including csk
// csk - diameter of the csk
// recess - recess of the csk, added above the csk
module m5csk(h=2.5, csk=10, recess=0) {
    m5bore(h=h);
    translate([0, 0, -(csk/2 - h)]) cylinder(d2=csk, d1=0, h=(csk/2), $fn=32);
    if(recess != 0) {
        translate([0, 0, h]) cylinder(h=recess, d=csk);
    }
}

// M5 clearance bore
// h - length of the bore
module m5bore(h=2.5) {
    cylinder(d=5.5, h=h, $fn=32);
}

// M5 clearance bore with retaining nut
// h - length of the bore
module m5nutbore(h=20, nuth=5) {
    cylinder(d=5.5, h=h, $fn=32);
    translate([0, 0, nuth]) union() {
        cylinder(d=9.2, h=4.4, $fn=6, center=true);
        difference() {
            translate([0, 0, -0.2]) cylinder(d=9.2, h=4.6, $fn=6, center=true);
            translate([0, 0, -0.4]) cube([9.2, 5.5, 4.8], center=true);    
        }
        translate([0, 0, -0.4]) cube([5.5, 5.5, 4.8], center=true);
    }
}

// M4 clearance bore with retaining nut
// h - length of the bore
module m4nutbore(h=20, nuth=5) {
    cylinder(d=4.5, h=h, $fn=32);
    translate([0, 0, nuth]) cylinder(d=8.5, h=3.5, $fn=6, center=true);
}

module rrect(x, y, z, r) {
    linear_extrude(z)
    offset(r=r)
    offset(delta=-r)
    square([x, y]);
}

module slot_holder(panel, hole=true) {
    difference() {
        quarter_cylinder(r=30, h=(panel+CLEAR+SLOT_WALL*2));
        translate([2.5, 2.5, SLOT_WALL]) cube([30, 30, panel+CLEAR]);
        if(hole){
            translate([12.5, 12.5, 0]) cylinder(d=2.5, h=SLOT_WALL, $fn=32);
        }
    }
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