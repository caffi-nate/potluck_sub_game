// keep us glued to the top of the water
with obj_water_body{
    var col_y = dyliquid_get_y(other.x)
    other.y = col_y;
}

if (image_index > image_number-1)
    instance_destroy();