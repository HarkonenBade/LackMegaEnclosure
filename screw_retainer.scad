$fn=32;

module single() {
    difference() {
        cylinder(d1=15, d2=12, h=3);
        translate([0, 0, -0.05]) cylinder(d=5.5, h=3.1);
        translate([0, 0, -2]) cylinder(d2=10, d1=0, h=5);
    }
}

module double() {
    difference() {
        hull() {
            translate([27.5, 0, 0])
                cylinder(d1=15, d2=12, h=3);
            translate([-27.5, 0, 0])
                cylinder(d1=15, d2=12, h=3);
        }
        for(x=[27.5, -27.5]) {
            translate([x, 0, 0]) {
                cylinder(d=5.5, h=3.1);
                translate([0, 0, -2])
                    cylinder(d2=10, d1=0, h=5);
            }
        }
    }
}

single();