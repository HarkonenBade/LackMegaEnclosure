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

module base_outer() {
    difference() {
        union() {
            cube([52.5, 52.5, 130]);
            translate([52.5, 12.5, 0])
                rotate([90, 0, 0])
                quarter_cylinder(30, 12.5); 
            translate([12.5, 52.5, 0])
                rotate([0, -90, 0])
                quarter_cylinder(30, 12.5);
            translate([7.5, 52.5, 0])
                cube([57.5-7.5, 5, 160]);
            translate([52.5, 7.5, 0])
                cube([5, 57.5-7.5, 160]);
            translate([0, 52.5, 0])
                cube([7.5, 2.5, 130]);
            translate([52.5, 0, 0])
                cube([2.5, 7.5, 130]);
        }
        translate([2.25, 2.25, 105]) cube([50.5, 50.5, 25]);
        translate([55, 2.5, 2.5]) cube([27.5, 5, 27.5]);
        translate([2.5, 55, 2.5]) cube([5, 27.5, 27.5]);
        translate([27.5, 52.5, 120])
            rotate([-90, 0, 0])
            m5csk();
        translate([27.5, 52.5, 140])
            rotate([-90, 0, 0])
            m5csk();
        translate([52.5, 27.5, 120])
            rotate([0, 90, 0])
            m5csk();
        translate([52.5, 27.5, 140])
            rotate([0, 90, 0])
            m5csk();

    }
}

module outer_upper_top(){ 
    difference(){
        rotate([180, 0, 90]) base_outer();
        translate([15, 40, -105]) m5csk();
        translate([15, 40, 0]) rotate([180, 0, 0]) cylinder(d=10, h=100, $fn=32);
        translate([40, 15, -105]) m5csk();
        translate([40, 15, 0]) rotate([180, 0, 0]) cylinder(d=10, h=100, $fn=32);
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) cylinder(d=5, h=105, $fn=32);
    }
}

outer_upper_top();