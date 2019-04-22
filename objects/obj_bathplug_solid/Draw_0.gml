
//if (sel_force) image_blend = c_red;
//draw_self();
draw_sprite_ext(sprite_index,image_index,x,y,SCALE,SCALE,0,c_white,1);

image_blend = c_white;


if (sel_impulse)
	draw_line(x,y,mouse_x,mouse_y);
	
	
	
	if (global.debugMode){
	draw_set_colour(c_orange);
	physics_draw_debug();
}

//draw_text(x,y-50,depth);