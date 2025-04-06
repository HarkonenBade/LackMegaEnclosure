include <./shared.scad>;

module hinge_drill() {
    for(y=[0:2]){
        translate([7.5, 7.5 + 12*y, -0.05]) {
            cylinder(d=4.5, h=3.1);
        }
    }
}

seal_w = 10;

module door_panel(panel_w, panel_h, cutout_x, cutout_y, cutout_w, cutout_h, cutout_r){
    difference() {
        cube([panel_w, panel_h, 3]);
        
        translate([0, 0, -0.05])
            rotate([0, 0, 0]){
                cube([30, 2.5, 3.1]);
                cube([2.5, 30, 3.1]);
        }
        translate([panel_w, 0, -0.05])
            rotate([0, 0, 90]){
                cube([30, 2.5, 3.1]);
                cube([2.5, 30, 3.1]);
        }
        translate([panel_w, panel_h, -0.05])
            rotate([0, 0, 180]){
                cube([30, 2.5, 3.1]);
                cube([2.5, 30, 3.1]);
        }
        translate([0, panel_h, -0.05])
            rotate([0, 0, 270]){
                cube([30, 2.5, 3.1]);
                cube([2.5, 30, 3.1]);
        }
        translate([cutout_x, 75, -0.05])
            rrect(cutout_w, cutout_h, 3.1, cutout_r);
        
        translate([cutout_x + cutout_w + seal_w,
                   cutout_y + cutout_r,
                   0])
            hinge_drill();
        translate([cutout_x + cutout_w + seal_w,
                   cutout_y + cutout_h - cutout_r - 39,
                   0])
            hinge_drill();
        translate([cutout_x + cutout_w + seal_w,
                   cutout_y + cutout_h/2 - (39/2),
                   0])
            hinge_drill();
        translate([cutout_x - seal_w - 15,
                   cutout_y + cutout_h/2 - 100,
                   0])
            hinge_drill();
        translate([cutout_x - seal_w - 15,
                   cutout_y + cutout_h/2 + 100 - 39,
                   0])
            hinge_drill();
    }
}

tall = false;
if(tall){
    projection() door_panel(
        cutout_w = 295,
        cutout_h = 355,
        cutout_r = 25,
        cutout_x = 75,
        cutout_y = 75,
        panel_w = 445,
        panel_h = 505);
} else {
    projection() door_panel(
        cutout_w = 295,
        cutout_h = 255,
        cutout_r = 25,
        cutout_x = 75,
        cutout_y = 75,
        panel_w = 445,
        panel_h = 405);
}