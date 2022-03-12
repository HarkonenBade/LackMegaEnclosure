use <shared.scad>;

module base_outer(pillar=0) {
    difference() {
        union() {
            cube([55, 55, 30+pillar]);
            translate([52.5, 8.5, 0])
                rotate([90, 0, 0])
                quarter_cylinder(30, 8.5); 
            translate([8.5, 52.5, 0])
                rotate([0, -90, 0])
                quarter_cylinder(30, 8.5); 
        }
        translate([2.25, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([55, 2.5, 2.5]) cube([27.5, 3.5, 27.5]);
        translate([2.5, 55, 2.5]) cube([3.5, 27.5, 27.5]);
        translate([27.5, 50, 16.25+pillar])
            rotate([-90, 0, 0])
            m5csk();
        translate([50, 27.5, 16.25+pillar])
            rotate([0, 90, 0])
            m5csk();
    }
}

module outer_foot(){ 
    difference() {
        base_outer();
        translate([15, 40, -2.5]) m5csk();
        translate([40, 15, -2.5]) m5csk();
        translate([27.5, 27.5, -2.5]) m5csk();
    }
}

module outer_lower_top(){ 
    difference() {
        rotate([180, 0, 90]) base_outer();
        translate([15, 40, -5]) m5csk();
        translate([40, 15, -5]) m5csk();
        translate([27.5, 27.5, -5]) m5bore();
    }
}

module outer_upper_top(){ 
    difference(){
        rotate([180, 0, 90]) base_outer(pillar=100);
        translate([15, 40, -105]) m5csk(recess=100);
        translate([40, 15, -105]) m5csk(recess=100);
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore(h=105);
    }
}


outer_lower_top();