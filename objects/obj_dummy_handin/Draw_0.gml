ROTATION_SPEED = 4;
myTimer++;

XSCALE = sin(myTimer * RADIAN * ROTATION_SPEED);


draw_sprite_ext(sprite_index,image_index,x,y,XSCALE * SCALE,1,0,c_white,1);


if (destroy){
	SCALE = approach(SCALE,0,0.1);
	if (SCALE <= 0){
		instance_create_depth(x,y,100,obj_dustCloud);
		instance_destroy();
	}
}