include <./shared.scad>;

$fn=32;

use <./door_panel.scad>;
use <./parametric_hinge/parametric_hinges.scad>;
use <./door.scad>;
use <./handle.scad>;
use <./cover_and_backing_plates.scad>;

cutout_w = 295;
cutout_h = 355;
cutout_r = 25;
cutout_x = 75;
cutout_y = 75;

seal_w = 10;

module hinge_r(){
    translate([18, 39, 0])
    rotate([0, 0, 180])
        hinge("fold");
}

module doorass() {
    color("tan") door_panel();
    
    color("gray") 
    translate([cutout_x - seal_w,
               cutout_y - seal_w,
               3])
    difference() {
        rrect(cutout_w + 2*seal_w,
              cutout_h + 2*seal_w,
              6,
              cutout_r + seal_w);
        translate([seal_w, seal_w, -0.25])
            rrect(cutout_w,
                  cutout_h,
                  6.5,
                  cutout_r);
    }
    
    color("orange"){
        for(y=[cutout_r,
               cutout_h - cutout_r - 39,
               cutout_h/2 - 39/2]) {
            translate([cutout_x + cutout_w + seal_w,
                       cutout_y + y,
                       0]){
                translate([0, 0, 3])
                    hinge_r();
                translate([15, 39, 12])
                    rotate([0, 0, 180])
                    hinge_cover_plate();
                mirror([0, 0, 1])
                    hinge_backing_plate();
            }               
        }
        translate([cutout_x - seal_w - 15,
                   cutout_y + cutout_h/2 - 100,
                   0]) {
            translate([0, 0, 12]) handle();
            for(y=[0, 200-39]){
                translate([0, y, 0]){
                    translate([0, 0, 3])
                        fix_plate();
                    translate([0, 0, 9]) 
                        mirror([0, 0, 1])
                        fix_plate();
                    mirror([0, 0, 1])
                        handle_backing_plate();
                }
            }
        }
    }
    color("white", 0.5)
        translate([cutout_x - seal_w - 15,
                   cutout_y - seal_w - 15,
                   9])
            door();

}

doorass();