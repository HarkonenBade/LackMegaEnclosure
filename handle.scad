use <./shared.scad>;

$fn=32;

module handle() {
    rotate([90, 0, 90]) difference() {
        translate([5, 0, 5]) minkowski(){
            difference() {
                translate([0, -10, 0])
                    cube([190, 51, 5]);
                translate([29, -10, 0])
                    linear_extrude(5)
                    offset(r=10)
                    offset(delta=-10)
                    square([132, 45]);
            }
            sphere(r=5);
        }
        translate([0, -15, 0]) cube([200, 15, 25]);
        
        translate([7.5, 0, 7.5]) 
            rotate([-90, 0, 0])
            m4nutbore();
        translate([31.5, 0, 7.5]) 
            rotate([-90, 0, 0])
            m4nutbore();
        translate([200-7.5, 0, 7.5]) 
            rotate([-90, 0, 0])
            m4nutbore();
        translate([200-31.5, 0, 7.5]) 
            rotate([-90, 0, 0])
            m4nutbore();
    }
}

module fix_plate() {
    difference() {
        rrect(15, 39, 3, 5);
        translate([7.5, 0, -0.05]){
            translate([0, 7.5, 0]) {
                cylinder(d=4.5, h=3.1);
                translate([0, 0, -1.5])
                    cylinder(d2=9, d1=0, h=4.6);
            }
            translate([0, 39-7.5, 0]) {
                cylinder(d=4.5, h=3.1);
                translate([0, 0, -1.5])
                    cylinder(d2=9, d1=0, h=4.6);
            }
        }
        translate([7.5, 39/2, 0]) {
            cylinder(d=10.5, h=2.25);
        }
    }
}

handle();