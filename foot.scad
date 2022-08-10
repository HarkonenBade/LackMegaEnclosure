include <shared.scad>;

module foot() {
    difference() {
        cube([55, 55, 30]);
        rotate([90, 0, 90])
            linear_extrude(55)
            polygon([[-0.1,-0.1], [5,-0.1], [-0.1, 30]]);
        translate([0, 55, 0])
            rotate([90, 0, 0])
            linear_extrude(55)
            polygon([[-0.1,-0.1], [5,-0.1], [-0.1, 30]]);
        translate([55, 0, 0])
            rotate([90, 0, 180])
            linear_extrude(55)
            polygon([[-0.1,-0.1], [5,-0.1], [-0.1, 30]]);
        translate([55, 55, 0]) 
            rotate([90, 0, -90])
            linear_extrude(55)
            polygon([[-0.1,-0.1], [5,-0.1], [-0.1, 30]]);
        translate([0, 0, 30]) mirror([0, 0, 1]) {
            translate([15, 40, 0]) m5bore(h=15);
            translate([40, 15, 0]) m5bore(h=15);
            translate([27.5, 27.5, 0]) m5nutbore();
        }
    }
}

foot();