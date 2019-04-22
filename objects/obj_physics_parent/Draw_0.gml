
//if (sel_force) image_blend = c_red;
draw_self();

image_blend = c_white;


if (sel_impulse)
	draw_line(x,y,mouse_x,mouse_y);
	
	
	
	if (global.debugMode){
	draw_set_colour(c_orange);
	physics_draw_debug();
}

//draw_text(x,y-50,depth);


if (outlined && !sel_force){
	with (obj_player){
		draw_sprite_ext(RT_Button,image_index,x,y - 32, 1, 1, 0, c_white, 1);	
	}
}