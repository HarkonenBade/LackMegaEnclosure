use <./outer_feet.scad>;
use <./centre_feet.scad>;
use <./handle.scad>;
use <./cover_and_backing_plates.scad>;
use <./foot.scad>;

RENDER="outer_foot";
if(RENDER=="outer_foot"){
    outer_foot();
} else if(RENDER=="outer_foot_l"){
    outer_foot(right=false);
} else if(RENDER=="outer_foot_r"){
    outer_foot(left=false);
} else if(RENDER=="outer_lower_top_l"){
    outer_lower_top(right=false);
} else if(RENDER=="outer_lower_top_r"){
    outer_lower_top(left=false);
} else if(RENDER=="outer_lower_top"){
    outer_lower_top();
} else if(RENDER=="outer_upper_top"){
    outer_upper_top();
} else if(RENDER=="centre_foot"){
    centre_foot();
} else if(RENDER=="centre_foot_n"){
    centre_foot(tabs=false);
} else if(RENDER=="centre_lower_top"){
    centre_lower_top();
} else if(RENDER=="centre_lower_top_n"){
    centre_lower_top(tabs=false);
} else if(RENDER=="centre_upper_top"){
    centre_upper_top();
} else if(RENDER=="handle"){
    handle();
} else if(RENDER=="foot"){
    foot(wide=false);
} else if(RENDER=="foot_wide"){
    foot(wide=true);
} else if(RENDER=="fix_plate"){
    fix_plate();
} else if(RENDER=="hinge_cover_plate"){
    hinge_cover_plate();
} else if(RENDER=="hinge_backing_plate"){
    hinge_backing_plate();
} else if(RENDER=="handle_backing_plate"){
    handle_backing_plate();
}