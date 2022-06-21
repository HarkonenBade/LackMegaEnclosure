use <shared.scad>;
$fn=32;

module outer() {
    difference() {
        union(){
            translate([0, 0, -10]) ccube([55, 55, 40]);
            translate([0, -5, -10]) cube([37.5, 10, 26.25]);
            translate([-5, 0, -10]) cube([10, 37.5, 26.25]);
            rotate([-90, 0, 0]) translate([0, -16.25, 25]) cylinder(d=10, h=12.5);
            rotate([0, 90, 0]) translate([-16.25, 0, 25]) cylinder(d=10, h=12.5);
        }
        translate([0, 0, 2.5]) ccube([51, 51, 27.5]);
        rotate([-90, 0, 0]) translate([0, -16.25, 25]) cylinder(d=2.5, h=12.5);
        rotate([0, 90, 0]) translate([-16.25, 0, 25]) cylinder(d=2.5, h=12.5);
        translate([-12.5, 12.5, -10]) cylinder(d=2.5, h=15);
        translate([12.5, -12.5, -10]) cylinder(d=2.5, h=15);
        translate([0, 0, -10]) cylinder(d=8, h=15);;
    }
}

module corner() {
    difference() {
        union() {
            intersection(){
                cylinder(r=50, h=3);
                cube([50, 50, 3]);
            }
            translate([30, -3, 0]) cube([20, 3, 13]);
            translate([-3, 30, 0]) cube([3, 20, 13]);
        }
        translate([15, 40, 0]) cylinder(d=2.5, h=10);
        translate([40, 15, 0]) cylinder(d=2.5, h=10);
        translate([27.5, 27.5, 0]) cylinder(d=5, h=10);
        cube([30, 3, 3]);
        cube([3, 30, 3]);
    }
}

corner();