use <shared.scad>;

module base_centre(pillar=0){ 
    difference() {
        union() {
            translate([-55, 0, 0]) cube([110, 55, 30+pillar]);
            translate([52.75, 8.5, 0]) rotate([90, 0, 0]) quarter_cylinder(30, 8.5);
            translate([-52.75, 8.5, 0]) rotate([90, -90, 0]) quarter_cylinder(30, 8.5); 
            translate([7, 52.5, 0]) rotate([0, -90, 0]) quarter_cylinder(30, 14);
        }
        translate([2.25, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([-52.75, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([55, 2.5, 2.5]) cube([27.5, 3.5, 27.5]);
        translate([-55-27.5, 2.5, 2.5]) cube([27.5, 3.5, 27.5]);
        translate([-4.75, 55, 2.5]) cube([9.5, 27.5, 27.5]);
        translate([0, 0, 16.25+pillar]) {
            translate([27.5, 52.5, 0]) rotate([-90, 0, 0]) m5csk();
            translate([52.5, 27.5, 0]) rotate([0, 90, 0]) m5csk();
            translate([-27.5, 52.5, 0]) rotate([-90, 0, 0]) m5csk();
            translate([-52.5, 27.5, 0]) rotate([0, -90, 0]) m5csk();
        }
    }
}

module centre_foot(){ 
    difference() {
        base_centre();
        translate([15, 40, 0]) m5csk();
        translate([40, 15, 0]) m5csk();
        translate([27.5, 27.5, 0]) m5csk();
        translate([-15, 40, 0]) m5csk();
        translate([-40, 15, 0]) m5csk();
        translate([-27.5, 27.5, 0]) m5csk();
    }
}

module centre_lower_top(){ 
    difference() {
        rotate([0, 180, 0]) base_centre();
        translate([15, 40, -2.5]) m5csk();
        translate([40, 15, -2.5]) m5csk();
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore();
        translate([-15, 40, -2.5])  m5csk();
        translate([-40, 15, -2.5]) m5csk();
        translate([-27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore();
    }
}

module centre_upper_top(){ 
    difference() {
        rotate([0, 180, 0]) base_centre(pillar=100);
        translate([15, 40, -102.5]) m5csk(recess=100);
        translate([40, 15, -102.5]) m5csk(recess=100);
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore(h=105);
        translate([-15, 40, -102.5]) m5csk(recess=100);
        translate([-40, 15, -102.5]) m5csk(recess=100);
        translate([-27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore(h=105);
    }
}

centre_foot();