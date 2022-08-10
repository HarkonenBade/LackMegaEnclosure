include <./shared.scad>;

$fn=32;

module hinge_drill() {
    for(y=[0:2]){
        translate([7.5, 7.5 + 12*y, -0.05]) {
            cylinder(d=4.5, h=3.1);
        }
    }
}

module door() {
    width = 295 + 2*(10+15);
    height = 355 + 2*(10+15);
    difference() {
        rrect(width, height, 3, 25 + 10 + 15);
        //translate([27,27,0]) rrect(295, 355, 3, 25);
        translate([width - 15,
                   25 + 15 + 10,
                   0])
            hinge_drill();
        translate([width - 15,
                   height - (25 + 15 + 10) - 39,
                   0])
            hinge_drill();
        translate([width - 15,
                   (height - 39)/2,
                   0])
            hinge_drill();
        translate([0,
                   height/2 - 100,
                   0])
            hinge_drill();
        translate([0,
                   height/2 + 100 - 39,
                   0])
            hinge_drill();
    }
}

projection() door();