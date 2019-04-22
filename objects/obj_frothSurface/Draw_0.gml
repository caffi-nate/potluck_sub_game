/// @description Insert description here
// You can write your code in this editor


if !surface_exists(frothSurface){
	frothSurface = surface_create(surfaceWidth,surfaceHeight);
}
	surface_set_target(frothSurface);
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
	draw_set_colour(global.COLOUR7_PEACH);
	//draw_set_colour(c_red);
	with obj_surfaceFroth{
		//draw_circle(x - view_xview,y-view_yview - (4*0.1*smokeRadius),smokeRadius - (3*0.1*smokeRadius),0);	
		var SCALE = smokeRadius * 0.1;
		draw_sprite_ext(spr_sprayParticle,1, x - view_xview, y - view_yview, dir * SCALE, SCALE, 0, c_white, 1);
	}
	
	with obj_underwaterFroth{
		//draw_circle(x - view_xview,y-view_yview - (4*0.1*smokeRadius),smokeRadius - (3*0.1*smokeRadius),0);	
		var SCALE = smokeRadius * 0.1;
		draw_sprite_ext(spr_sprayParticle,1, x - view_xview, y - view_yview, dir * SCALE, SCALE, 0, c_white, 1);
	}
	

	
	
	surface_reset_target();
	
	
	//shader_set(shd_outline);
	//	shader_set_uniform_f(SURFWIDTH,surfaceWidth);
	//	shader_set_uniform_f(SURFHEIGHT,surfaceHeight);
	//	shader_set_uniform_color(OUTLINECOLOR, global.COLOUR7_PEACH,1);
	//	draw_surface(frothSurface,view_xview,view_yview);
	//shader_reset();
	
	
	draw_surface(frothSurface,view_xview,view_yview);
	