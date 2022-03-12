use <./outer_feet.scad>;
use <./centre_feet.scad>;

RENDER="outer_foot";
if(RENDER=="outer_foot"){
    outer_foot();
} else if(RENDER=="outer_lower_top"){
    outer_lower_top();
} else if(RENDER=="outer_upper_top"){
    outer_upper_top();
} else if(RENDER=="centre_foot"){
    centre_foot();
} else if(RENDER=="centre_lower_top"){
    centre_lower_top();
} else if(RENDER=="centre_upper_top"){
    centre_upper_top();
}