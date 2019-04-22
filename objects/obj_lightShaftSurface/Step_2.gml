if !surface_exists(lightShaftSurface){
	lightShaftSurface = surface_create(surfaceWidth,surfaceHeight);
}
	surface_set_target(lightShaftSurface);
	draw_clear_alpha(c_black,0);
	
	var VX = view_xview;
	var VY = view_yview;
	
	draw_set_colour(c_white);
	draw_rectangle(0,0,surfaceWidth,surfaceHeight,0);
	//draw_set_colour(c_black);
	//gpu_set_blendmode(bm_subtract);
	
	with obj_lightShaft{
		//draw_circle(x - view_xview,y-view_yview - (4*0.1*smokeRadius),smokeRadius - (3*0.1*smokeRadius),0);	
		draw_primitive_begin(pr_trianglestrip);
			var BOTTOM_WIDTH = lightWidth * 2;
			draw_vertex_colour(x - 0.5*lightWidth - VX,y - VY, c_black, alphaVar);
			draw_vertex_colour(x + 0.5*lightWidth - VX,y - VY, c_black, alphaVar);
			draw_vertex_colour(skewAngle + x - 0.5*BOTTOM_WIDTH - VX, y + lightHeight - VY, c_black, 0.8 * alphaVar);
			draw_vertex_colour(skewAngle + x + 0.5*BOTTOM_WIDTH - VX, y + lightHeight - VY, c_black, 0.8 * alphaVar);
		draw_primitive_end();
	}
	

	//gpu_set_blendmode(bm_subtract);
	gpu_set_blendmode(bm_normal);
	//draw_set_alpha(0.4);
	var TOPY = obj_lightShaft.y;
	//draw_rectangle(0,TOPY - VY,view_wview,TOPY + 16 - VY,false);
		
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	
	
	

	surface_reset_target();

	draw_set_alpha(1);
	draw_set_colour(c_white); // ? fixes title menu logo for some reason uh
