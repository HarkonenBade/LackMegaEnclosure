include <./shared.scad>;

PANEL_SLOT = SIDE_PANEL_CLEAR + (2.5*2);
CENTRE_SLOT = CENTRE_PANEL_CLEAR + (2.5*2);

module base_centre(pillar=0){ 
    difference() {
        union() {
            translate([-55, 0, 0]) cube([110, 55, 30+pillar]);
            translate([52.75, PANEL_SLOT, 0]) rotate([90, 0, 0]) quarter_cylinder(30, PANEL_SLOT);
            translate([-52.75, PANEL_SLOT, 0]) rotate([90, -90, 0]) quarter_cylinder(30, PANEL_SLOT); 
            translate([CENTRE_SLOT/2, 52.5, 0]) rotate([0, -90, 0]) quarter_cylinder(30, CENTRE_SLOT);
        }
        translate([2.25, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([-52.75, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([55, 2.5, 2.5]) cube([27.5, SIDE_PANEL_CLEAR, 27.5]);
        translate([-55-27.5, 2.5, 2.5]) cube([27.5, SIDE_PANEL_CLEAR, 27.5]);
        translate([-(CENTRE_PANEL_CLEAR/2), 55, 2.5]) cube([CENTRE_PANEL_CLEAR, 27.5, 27.5]);
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
        rotate([0, 180, 0]) base_centre(pillar=PILLAR_HEIGHT);
        translate([15, 40, -PILLAR_HEIGHT-2.5]) m5csk(recess=PILLAR_HEIGHT);
        translate([40, 15, -PILLAR_HEIGHT-2.5]) m5csk(recess=PILLAR_HEIGHT);
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore(h=PILLAR_HEIGHT+5);
        translate([-15, 40, -PILLAR_HEIGHT-2.5]) m5csk(recess=PILLAR_HEIGHT);
        translate([-40, 15, -PILLAR_HEIGHT-2.5]) m5csk(recess=PILLAR_HEIGHT);
        translate([-27.5, 27.5, 0]) rotate([180, 0, 0]) m5bore(h=PILLAR_HEIGHT+5);
    }
}

centre_foot();