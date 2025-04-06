KERF=1;
difference() {
    color("tan") square([2440, 1220]);

    for(x = [0, 445+KERF, (445+KERF)*2]){
        for(y = [0, 505+KERF]){
            translate([x, y, 0]) square([445, 505]);
        }
    }

    for(x = [2440-445, 2440-(445*2+KERF)]){
        for(y = [0, 405+KERF, (405+KERF)*2]){
            translate([x, y, 0]) square([445, 405]);
        }
    }
}