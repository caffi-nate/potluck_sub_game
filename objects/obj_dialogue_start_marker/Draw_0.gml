draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1);



switch(global.controlMode){
	case controlModes.controller: sprite_index = spr_Button_A; break;
	case controlModes.mouseKeyboard: sprite_index = spr_keyboard_X; break;
}

// bob up and down
// and maybe spin too
//y = ystart - sin(RADIAN * global.gameTimer * 5) * 8;

if (!destroy){
	scale = approach(scale,1,0.1);	
}
if instance_exists(obj_dialogueManager){
	destroy = true;
}
	
if (destroy){
	scale = approach(scale, 0, 0.1);
	if (scale <= 0) instance_destroy();
}

image_speed = 2;