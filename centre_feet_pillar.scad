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

module pillar_centre(){ 
    difference() {
        union() {
            translate([-52.75, 0, 0]) cube([105.5, 52.75, 130]);
            translate([52.75, 12.5, 0]) rotate([90, 0, 0]) quarter_cylinder(30, 12.5);
            translate([-52.75, 12.5, 0]) rotate([90, -90, 0]) quarter_cylinder(30, 12.5); 
            translate([14, 52.5, 0]) rotate([0, -90, 0]) quarter_cylinder(30, 28);
            translate([9, 52.75, 0]) cube([57.75-9, 5, 160]);
            translate([-14-(57.75-14), 52.75, 0]) cube([57.75-9, 5, 160]);
            translate([52.75, 7.5, 0]) cube([5, 57.75-7.5, 160]);
            translate([-52.75-5, 7.5, 0]) cube([5, 57.75-7.5, 160]);  
            translate([-9, 52.5, 0]) cube([18, 2.5, 130]);
            translate([52.5, 0, 0]) cube([2.5, 7.5, 130]);
            translate([-52.5-2.5, 0, 0]) cube([2.5, 7.5, 130]);
        }
        translate([2.25, 2.25, 105]) cube([50.5, 50.5, 25]);
        translate([-55+2.25, 2.25, 105]) cube([50.5, 50.5, 25]);
        translate([55, 2.5, 2.5]) cube([27.5, 5, 27.5]);
        translate([-55-27.5, 2.5, 2.5]) cube([27.5, 5, 27.5]);
        translate([-9, 55, 2.5]) cube([18, 27.5, 27.5]);
        translate([27.5, 52.75, 120]) rotate([-90, 0, 0]) m5csk();
        translate([27.5, 52.75, 140]) rotate([-90, 0, 0]) m5csk();
        translate([52.75, 27.5, 120]) rotate([0, 90, 0]) m5csk();
        translate([52.75, 27.5, 140]) rotate([0, 90, 0]) m5csk();
        translate([-27.5, 52.75, 120]) rotate([-90, 0, 0]) m5csk();
        translate([-27.5, 52.75, 140]) rotate([-90, 0, 0]) m5csk();
        translate([-52.75, 27.5, 120]) rotate([0, -90, 0]) m5csk();
        translate([-52.75, 27.5, 140]) rotate([0, -90, 0]) m5csk();
    }
}

module centre_upper_top(){ 
    difference() {
        rotate([0, 180, 0]) pillar_centre();
        translate([15, 40, -105]) m5csk();
        translate([40, 15, -105]) m5csk();
        translate([15, 40, -100]) cylinder(d=10, h=100, $fn=32);
        translate([40, 15, -100]) cylinder(d=10, h=100, $fn=32);
        translate([27.5, 27.5, -105]) cylinder(d=5, h=105, $fn=32);
        translate([-15, 40, -105]) m5csk();
        translate([-40, 15, -105]) m5csk();
        translate([-15, 40, -100]) cylinder(d=10, h=100, $fn=32);
        translate([-40, 15, -100]) cylinder(d=10, h=100, $fn=32);
        translate([-27.5, 27.5, -105]) cylinder(d=5, h=105, $fn=32);
    }
}

centre_upper_top();