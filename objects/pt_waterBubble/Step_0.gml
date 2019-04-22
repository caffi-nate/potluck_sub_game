/// movement
image_speed = 0.3;

if !instance_place(x,y,obj_water_body){
    //scr_show_message("Y",y,"waterBodyY",waterBodyTop);
    if ((y+bubbleYSpeed) < waterBodyTop) bubbleState = 1;
    else instance_destroy();
}


if bubbleState == 0{
    sprite_index = spr_bubble;
    
    
    y -= bubbleYSpeed;
    
    
    bubbleAngle += bubbleAngleSpeed * RADIAN;
    x += cos(bubbleAngle) * bubbleXSpeed;



}
else {
    // play pop animation and destroy
    sprite_index = spr_bubble//pop;
    if (image_index > (image_number-1)){
        instance_destroy();
    }

}