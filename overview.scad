use <./outer_feet.scad>;
use <./outer_feet_pillar.scad>;
use <./centre_feet.scad>;
use <./centre_feet_pillar.scad>;

module lack(top_loft=0){
    translate([0, 0, 400+top_loft]) cube([550, 550, 50]);
    for(x=[2.5, 550-50-2.5]) {
        for(y=[2.5, 550-50-2.5]) {
            translate([x, y, 0]) cube([50, 50, 400]);
        }
    }
}

translate([0, 0, 18]) {
    for(x=[0, 550]) {
        translate([x, 0, 5]) color("grey") lack(top_loft=5);
        translate([x, 0, 460]) color("grey") lack(top_loft=105);
    }

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
                translate([x, y, 410])
                    mirror([x, y*2, 0])
                    outer_lower_top();
                translate([x, y, 965])
                    mirror([x, y*2, 0])
                    outer_upper_top();
            }
            translate([550, y, 410])
                    mirror([0, y, 0])
                    centre_lower_top();
            translate([550, y, 965])
                    mirror([0, y, 0])
                    centre_upper_top();
        }
    }
    color("tan") {
        for(x=[2.5, 1092.5]) {
            translate([x, 52.5, 0]) cube([5, 445, 410]);
            translate([x, 52.5, 455]) cube([5, 445, 510]);
        }

        for(x=[52.5, 602.5]) {
            translate([x, 542.5, 0]) cube([445, 5, 410]);
            translate([x, 542.5, 455]) cube([445, 5, 510]);
        }
    
        translate([550-9, 52.5, 0]) cube([18, 445, 410]);
        translate([550-9, 52.5, 455]) cube([18, 445, 510]);
    }
}
color("tan") cube([1100, 550, 18]);

