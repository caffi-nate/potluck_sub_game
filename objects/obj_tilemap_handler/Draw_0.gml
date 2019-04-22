if keyboard_check(vk_numpad4){
    waveSize += 0.001;
}
else if keyboard_check(vk_numpad5){
    waveSize -= 0.001;
    if (waveSize < 0) waveSize = 0; // clamp bottom boundary
}

//////////////////////////////////////////////////////////////////////

if keyboard_check(vk_numpad1){
    widthVar += 0.001;
}
else if keyboard_check(vk_numpad2){
    widthVar -= 0.001;
    //if (waveSize < 0) waveSize = 0; // clamp bottom boundary
}



sineVar += 80*RADIAN; // test, was 40.



// hide bg layers after a certain depth
if (!surface_exists(tileMapSurface)){
	tileMapSurface = surface_create(view_wview,view_hview);	
}
	surface_set_target(tileMapSurface);
	draw_clear_alpha(c_black,0);
	
	draw_tilemap(TILEMAP2, -view_xview,-view_yview); // background tiles
	
	
	// big doors
	with (obj_door) draw_sprite(sprite_index,image_index,x -view_xview, y - view_yview);
	
	draw_tilemap(TILEMAP,-view_xview,-view_yview); // near wall and collision tiles
	draw_tilemap(TILEMAP3,-view_xview,-view_yview); // bones tile layer 2
	
	
	
	with (obj_grassSurface){
		if (surface_exists(grassSurface))
			draw_surface_ext(grassSurface,0,0,1,1,0,c_white,1);	
	}
	

	surface_reset_target();
	
	shader_set(shd_water);
		shader_set_uniform_f(WATERX,0);
	    shader_set_uniform_f(WATERY,global.waterLevel); // was global.waterLevel
	    shader_set_uniform_f(WATERWIDTH,view_wview);
	    shader_set_uniform_f(WATERHEIGHT,view_hview);
		
	    shader_set_uniform_f(VIEW_WVIEW,view_wview);
	    shader_set_uniform_f(VIEW_HVIEW,view_hview);
	    shader_set_uniform_f(VIEW_XVIEW,view_xview);
	    shader_set_uniform_f(VIEW_YVIEW,view_yview);
        
	    shader_set_uniform_f(SINEVAR,sineVar);
	    shader_set_uniform_f(RADIAN,RAD);
	    shader_set_uniform_f(WAVESIZE,waveSize);
	    shader_set_uniform_f(WIDTHVAR,widthVar);
	
		draw_surface(tileMapSurface,view_xview,view_yview);
	
	shader_reset();