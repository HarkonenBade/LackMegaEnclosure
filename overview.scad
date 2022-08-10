include <./shared.scad>;
use <./outer_feet.scad>;
use <./centre_feet.scad>;
use <./door_assembly.scad>;
use <./foot.scad>;

module lack(top_loft=0, legs=true){
    translate([0, 0, 400+top_loft]) cube([550, 550, 50]);
    if(legs){
        for(x=[2.5, 550-50-2.5]) {
            for(y=[2.5, 550-50-2.5]) {
                translate([x, y, 0]) cube([50, 50, 400]);
            }
        }
    }
}

translate([0, 0, 50]) {
    color("orange") {
        for(z=[0, 455]) {
            for(y=[0, 550]){
                for(x=[0, 1100]){
                    translate([x, y, z])
                        mirror([x, y*2, 0])
                        outer_foot();
                }
            
                translate([550, y, z])
                    mirror([0, y, 0])
                    centre_foot();
            }
        }
        for(y=[0, 550]){
            for(x=[0, 1100]){
                translate([x, y, 405])
                    mirror([x, y*2, 0])
                    outer_lower_top();
                translate([x, y, 965])
                    mirror([x, y*2, 0])
                    outer_upper_top();
            }
            translate([550, y, 405])
                    mirror([0, y, 0])
                    centre_lower_top();
            translate([550, y, 965])
                    mirror([0, y, 0])
                    centre_upper_top();
        }
    }
    color("tan") {
        for(x=[2.5, 1092.5]) {
            translate([x, 52.5, 0])
                cube([SIDE_PANEL_THICK, 445, 405]);
            translate([x, 52.5, 455])
                cube([SIDE_PANEL_THICK, 445, 505]);
        }

        for(x=[52.5, 602.5]) {
            translate([x, 542.5, 0])
                cube([445, SIDE_PANEL_THICK, 405]);
            translate([x, 542.5, 455])
                cube([445, SIDE_PANEL_THICK, 505]);
        }
    
        translate([550-4.5, 52.5, 0])
            cube([CENTRE_PANEL_THICK, 445, 405]);
        translate([550-4.5, 52.5, 455])
            cube([CENTRE_PANEL_THICK, 445, 505]);
    }
    
    color("grey") {
        for(x=[0, 550]) {
            translate([x, 0, 2.5]) lack(top_loft=2.5);
            translate([x, 0, 457.5]) lack(top_loft=102.5);
        }
    }
    
    translate([52.5 + 445, 5.5, 505 + 455])
        rotate([90,180,0])
        doorass();        
    translate([602.5,
               5.5,
               455])
        rotate([90,0,0])
        doorass();
}

color("grey") {
    translate([0, 0, -400]) lack(top_loft=0, legs=false);
    translate([550, 0, -400]) lack(top_loft=0, legs=false);
}

color("orange") {
    for(x=[0, 495, 550, 1045]){
        for(y=[0, 495]){
            translate([x, y, -30]) foot();
        }
    }
}

