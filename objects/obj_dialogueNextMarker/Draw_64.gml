if (!destroy){
	scaleVar = approach(scaleVar,1,0.1);
	angle -= angleSpeed;
}	
else {
	if (!playedSound){
		scr_play_sound(sfx_confirm,1,0.2,0,-4);
		playedSound = true;
	}
	var AWAYSPEED = 4;
	y -= AWAYSPEED;
	scaleVar = approach(scaleVar,0,0.1);
	angle -= 10*angleSpeed;
	if (scaleVar <= 0) instance_destroy();
}
draw_sprite_ext(sprite_index,image_index,x,y,scaleVar,scaleVar,angle,c_white,1);

