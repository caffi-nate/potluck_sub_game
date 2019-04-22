if !surface_exists(sonarSurface){
	sonarSurface = surface_create(surfaceWidth,surfaceHeight);	
}

surface_set_target(sonarSurface);
draw_clear_alpha(c_black,0);


	draw_set_colour(c_white);
	draw_rectangle(0,0,surfaceWidth,surfaceHeight,0);

	// try using a colour transition.
	// also a thicker line
	
	//var LINE_COLOUR = output_colour_ramp(alphaValue,global.COLOUR1_BLACK, global.COLOUR1_BLACK,global.COLOUR3_GREEN,global.COLOUR2_DARKGREEN,global.COLOUR8_RED);
	var LINE_COLOUR = global.COLOUR8_RED;
	
	
	var LINE_THICKNESS = (alphaValue * 5);
	
	//draw_set_colour(LINE_COLOUR);

	draw_set_colour(c_black);

	draw_set_circle_precision(8);
	draw_set_alpha(LINE_THICKNESS);
	draw_circle(x - view_xview,y - view_yview,sonarTimer,false);
	
	
	draw_set_colour(c_white);
	draw_set_alpha(1);
	//gpu_set_blendmode(bm_subtract);
	draw_circle(x-view_xview,y-view_yview,sonarTimer - LINE_THICKNESS, false);
	gpu_set_blendmode(bm_normal);
	
	
	
	draw_set_circle_precision(24);

surface_reset_target();
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
draw_set_colour(c_white); // ? fixes title menu logo for some reason uh



shader_set(shd_dither);
	// change colour depending on world position
	var SHADER_COLOUR = global.COLOUR8_RED;
	with(obj_paletteManager){
		if (current_pal < darknessThreshold) SHADER_COLOUR = global.COLOUR5_GREENLIGHTEST;	
	}
	
	shader_set_uniform_f(u_size, surfaceWidth, surfaceHeight);
	// new uniform for passing a colour, maybe size of the texture too?
	shader_set_uniform_color(shaderColour,SHADER_COLOUR,1.0);
	shader_set_uniform_f(shaderTimer,global.gameTimer mod global.gameWidth);
	
	texture_set_stage(u_dither_tex, dither_tex);
	draw_surface(sonarSurface,0,0);
shader_reset();