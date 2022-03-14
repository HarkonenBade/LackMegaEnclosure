include <shared.scad>;

PANEL_SLOT = SIDE_PANEL_CLEAR + (2.5*2);

module base_outer(pillar=0) {
    difference() {
        union() {
            cube([55, 55, 30+pillar]);
            translate([52.5, PANEL_SLOT, 0])
                rotate([90, 0, 0])
                quarter_cylinder(30, PANEL_SLOT); 
            translate([PANEL_SLOT, 52.5, 0])
                rotate([0, -90, 0])
                quarter_cylinder(30, PANEL_SLOT); 
        }
        translate([2.25, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([55, 2.5, 2.5]) cube([27.5, SIDE_PANEL_CLEAR, 27.5]);
        translate([2.5, 55, 2.5]) cube([SIDE_PANEL_CLEAR, 27.5, 27.5]);
        translate([0, 0, 16.25+pillar]) {
            translate([27.5, 52.5, 0]) rotate([-90, 0, 0]) m5csk();
            translate([52.5, 27.5, 0]) rotate([0, 90, 0]) m5csk();
        }
    }
}

module outer_foot(){ 
    difference() {
        base_outer();
        translate([15, 40, 0]) m5csk();
        translate([40, 15, 0]) m5csk();
        translate([27.5, 27.5, 0]) m5csk();
    }
}

module outer_lower_top(){ 
    difference() {
        rotate([180, 0, 90]) base_outer();
        translate([15, 40, -2.5]) m5csk();
        translate([40, 15, -2.5]) m5csk();
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore();
    }
}

module outer_upper_top(){ 
    difference(){
        rotate([180, 0, 90]) base_outer(pillar=PILLAR_HEIGHT);
        translate([15, 40, -PILLAR_HEIGHT-2.5]) m5csk(recess=PILLAR_HEIGHT);
        translate([40, 15, -PILLAR_HEIGHT-2.5]) m5csk(recess=PILLAR_HEIGHT);
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore(h=PILLAR_HEIGHT+5);
    }
}

outer_foot();