/// @description Insert description here
// You can write your code in this editor


if !surface_exists(bubbleTrailSurface){
	bubbleTrailSurface = surface_create(surfaceWidth,surfaceHeight);
}
	surface_set_target(bubbleTrailSurface);
	draw_clear_alpha(c_black,0);
	
	
	
	//draw_set_colour(global.COLOUR7); // was 8, let's try a darker purp shadow
	
	
	// smokeRadius: shrinks from 10 to 0
	
	//draw_set_colour(global.COLOUR8); // pure magenta
	//with obj_bubbleTrail{
	//	draw_circle(x - view_xview,y-view_yview,smokeRadius,0);	
	//}
	
	//// draw a lighter shade over the top
	//draw_set_colour(global.COLOUR9);
	//with obj_bubbleTrail{
	//	draw_circle(x - view_xview,y-view_yview - (2*0.1*smokeRadius),smokeRadius - (1*0.1*smokeRadius),0);	
	//}
	
	// draw lightest shade
	draw_set_colour(global.COLOUR5_GREENLIGHTEST);
	//draw_set_colour(c_red);
	with obj_bubbleTrail{
		draw_circle(x - view_xview,y-view_yview - (4*0.1*smokeRadius),smokeRadius - (3*0.1*smokeRadius),0);	
	}
	

	
	
	surface_reset_target();
	
	
	shader_set(shd_outline);
		shader_set_uniform_f(SURFWIDTH,surfaceWidth);
		shader_set_uniform_f(SURFHEIGHT,surfaceHeight);
		shader_set_uniform_color(OUTLINECOLOR, global.COLOUR6_WHITE,1);
		shader_set_uniform_f(STROKEWIDTH,1.0);
		draw_surface(bubbleTrailSurface,view_xview,view_yview);
	shader_reset();
	