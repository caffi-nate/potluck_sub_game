if !surface_exists(physicsSurface){
	physicsSurface = surface_create(surfaceWidth,surfaceHeight);
}
surface_set_target(physicsSurface);
draw_clear_alpha(c_black,0);

	with (obj_physics_parent){
		//draw_self();
		if (outlined)
			draw_sprite_ext(sprite_index,image_index,x - view_xview,y - view_yview,1,1,image_angle,c_white,1);
			//draw_sprite_ext(sprite_index,image_index,x - view_xview,y - view_yview,1,1,phy_rotation,c_white,1);
	}
	
	
	// change to "blockade" later
	with (obj_bathplug_solid){
		if (outlined)
			draw_sprite_ext(sprite_index,image_index,x - view_xview,y - view_yview,SCALE,SCALE,image_angle,c_white,1);
	}
	
surface_reset_target();



shader_set(shd_outline);
	shader_set_uniform_f(SURFWIDTH,surfaceWidth);
	shader_set_uniform_f(SURFHEIGHT,surfaceHeight);
	shader_set_uniform_color(OUTLINECOLOR, global.COLOUR6_WHITE,1);
	shader_set_uniform_f(STROKEWIDTH,2);
	draw_surface(physicsSurface,view_xview,view_yview);
shader_reset();