/// @description Insert description here
// You can write your code in this editor

exit;
if surface_exists(lightShaftSurface){
	var SHADER_COLOUR = global.COLOUR5_GREENLIGHTEST;
	
	shader_set(shd_dither);
		shader_set_uniform_f(u_size, surfaceWidth, surfaceHeight);
		// new uniform for passing a colour, maybe size of the texture too?
		shader_set_uniform_color(shaderColour,SHADER_COLOUR,1.0);
		shader_set_uniform_f(shaderTimer,global.gameTimer mod global.gameWidth);
	
		texture_set_stage(u_dither_tex, dither_tex);
	
		//shader_set_uniform_f(SURFWIDTH,surfaceWidth);
		//shader_set_uniform_f(SURFHEIGHT,surfaceHeight);
		//shader_set_uniform_color(OUTLINECOLOR, global.COLOUR6_WHITE,1);
		draw_surface(lightShaftSurface,view_xview,view_yview);
	shader_reset();
}