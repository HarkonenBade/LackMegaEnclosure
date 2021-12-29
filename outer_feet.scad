module m5csk() {
    cylinder(d=5, h=5, $fn=32);
    cylinder(d2=10, d1=0, h=5, $fn=32);
}

module quarter_cylinder(r, h) {
    $fn=128;
    intersection() {
        cylinder(r=r, h=h);
        translate([0, 0, -0.05]) cube([r, r, h+0.1]);
    }
}

module outer_foot(){ 
difference() {
    union() {
        cube([52.5, 52.5, 30]);
        translate([52.5, 12.5, 0]) rotate([90, 0, 0]) quarter_cylinder(30, 12.5); 
        translate([12.5, 52.5, 0]) rotate([0, -90, 0]) quarter_cylinder(30, 12.5);
        translate([7.5, 52.5, 0]) cube([57.5-7.5, 5, 60]);
        translate([52.5, 7.5, 0]) cube([5, 57.5-7.5, 60]);  
    }
    translate([2.25, 2.25, 5]) cube([50.5, 50.5, 25]);
    translate([55, 2.5, 2.5]) cube([27.5, 5, 27.5]);
    translate([2.5, 55, 2.5]) cube([5, 27.5, 27.5]);
    translate([15, 40, 0]) m5csk();
    translate([40, 15, 0]) m5csk();
    translate([27.5, 52.5, 20]) rotate([-90, 0, 0]) m5csk();
    translate([27.5, 52.5, 40]) rotate([-90, 0, 0]) m5csk();
    translate([52.5, 27.5, 20]) rotate([0, 90, 0]) m5csk();
    translate([52.5, 27.5, 40]) rotate([0, 90, 0]) m5csk();
}
}

outer_foot();