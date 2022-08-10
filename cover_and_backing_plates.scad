use <./shared.scad>;

$fn=32;

module hinge_cover_plate() {
    difference() {
        scale([1, 1, 5.5/7.5]) translate([0, 7.5, 0.5]) minkowski(){
            cube([7.5, 24, 0.5]);
            sphere(r=7.5);
        }
        translate([-0.25, 0, -5.5]) cube([15.5, 39, 5.5]);
        translate([-7.5, 0, -8]) cube([7.5, 39, 15.5]);
        for(y=[7.5, 39/2, 39-7.5]){
            translate([7.5, y, 0]) m4nutbore(h=4.5, nuth=1+3.5/2);
        }
    }
}

module hinge_backing_plate() {
    difference() {
        translate([5, 5, 0]) minkowski(){
            cube([5, 29, 0.5]);
            sphere(r=5);
        }
        translate([0, 0, -5]) cube([15, 39, 5]);
        for(y=[7.5, 39/2, 39-7.5]){
            translate([7.5, y, 0]) m4nutbore(h=4.5, nuth=1+3.5/2);
        }
    }
}

module handle_backing_plate() {
    difference() {
        translate([5, 5, 0]) minkowski(){
            cube([5, 29, 0.5]);
            sphere(r=5);
        }
        translate([0, 0, -5]) cube([15, 39, 5]);
        for(y=[7.5, 39-7.5]){
            translate([7.5, y, 0]) m4nutbore(h=4.5, nuth=1+3.5/2);
        }
    }
}


hinge_cover_plate();