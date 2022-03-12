use <shared.scad>;

module outer() {
    difference() {
        ccube([55, 55, 30]);
        translate([0, 0, 2.5]) ccube([50.5, 50.5, 27.5]);
        rotate([-90, 0, 0]) translate([0, -16.25, 25]) m5bore();
        rotate([0, 90, 0]) translate([-16.25, 0, 25]) m5bore();
        translate([-12.5, 12.5, 0]) m5bore();
        translate([12.5, -12.5, 0]) m5bore();
        m5bore();
    }
}

outer();