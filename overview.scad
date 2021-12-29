use <./outer_feet.scad>;
use <./centre_feet.scad>;

module lack(){
    translate([0, 0, 400]) cube([550, 550, 50]);
    for(x=[2.5, 550-50-2.5]) {
        for(y=[2.5, 550-50-2.5]) {
            translate([x, y, 0]) cube([50, 50, 400]);
        }
    }
}

translate([0, 0, 18]) {
    for(x=[0, 550]) {
        for(z=[5, 460]) {
            translate([x, 0, z]) color("grey") lack();
        }
    }

    for(z=[0, 455]) {
        for(y=[0, 550]){
            for(x=[0, 1100]){
                translate([x, y, z]) mirror([x, y*2, 0]) color("orange") outer_foot();
            }
        
            translate([550, y, z]) mirror([0, y, 0]) color("orange") centre_foot();
        }

        for(x=[2.5, 1092.5]) {
            translate([x, 52.5, z]) color("tan") cube([5, 445, 405]);
        }

        for(x=[52.5, 602.5]) {
            translate([x, 542.5, z]) color("tan") cube([445, 5, 405]);
        }
    
        translate([550-9, 52.5, z]) color("tan") cube([18, 445, 405]);
    }
}
color("tan") cube([1100, 550, 18]);

