include <shared.scad>;

module base_outer(pillar=0, left=true, right=true) {
    difference() {
        union() {
            cube([55, 55, 30+pillar]);
            if(left){
                translate([SIDE_PANEL_SLOT, 52.5, 0])
                    rotate([0, -90, 0])
                    slot_holder(SIDE_PANEL_THICK); 
            }
            if(right){           
                translate([52.5, SIDE_PANEL_SLOT, 0])
                    rotate([90, 0, 0])
                    slot_holder(SIDE_PANEL_THICK);
            }
        }
        translate([2.25, 2.25, 2.5+pillar]) cube([50.5, 50.5, 27.5]);
        translate([0, 0, 16.25+pillar]) {
            translate([27.5, 52.5, 0]) rotate([-90, 0, 0]) m5csk();
            translate([52.5, 27.5, 0]) rotate([0, 90, 0]) m5csk();
        }
    }
}

module outer_foot(left=true, right=true){ 
    difference() {
        base_outer(left=left, right=right);
        translate([15, 40, 0]) m5csk();
        translate([40, 15, 0]) m5csk();
        translate([27.5, 27.5, 0]) m5csk();
    }
}

module outer_lower_top(left=true, right=true){ 
    difference() {
        rotate([180, 0, 90]) base_outer(left=left, right=right);
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
        translate([27.5, 27.5, 0]) rotate([180, 0, 0]) m5nutbore();
    }
}

outer_foot();