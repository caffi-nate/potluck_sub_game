//shader_set(shd_pal_swapper);

if (view_wview != 0){ // if we've initialised the game properly already
	
	if !surface_exists(appSurfaceCopy){
		appSurfaceCopy = surface_create(view_wview,view_hview); // needs to be resized when view resizes
	}
	else {
	//surface_set_target(aSurfaceCopy);
		surface_copy(appSurfaceCopy,0,0,application_surface); 

		drawingPalette = true;
				
		

		//pal_swap_set(my_pal_sprite,current_pal ,false);
		
		
		// use either spotlight or godray palette depending on how deep we are
		var PALETTE = surface_light_palette;
		if (DEEPSEA) PALETTE = spotlight_palette_index;
		
		
		pal_swap_set(my_pal_sprite,PALETTE,false); // try drawing red underneath the current colour.
		//draw_surface(application_surface,view_xview,view_yview);
		draw_surface(appSurfaceCopy,view_xview,view_yview);
		
		//shader_reset();
		pal_swap_reset();
	}
	
#region // spotlightSurface
	// draw lights on a separate surface above
	if !surface_exists(lightingSurface){
		lightingSurface = surface_create(view_wview,view_hview);	
	}
	surface_set_target(lightingSurface);
	draw_clear_alpha(c_black,0);
	
	pal_swap_set(my_pal_sprite,current_pal ,false);
	draw_surface(appSurfaceCopy,0,0);
	pal_swap_reset();
	
	gpu_set_blendmode(bm_subtract);
	draw_set_alpha(1);
	draw_set_colour(c_black);
	var XVIEW = view_xview;
	var YVIEW = view_yview;
	
	with obj_lightShaftSurface{
		//draw_rectangle(x - XVIEW,y - YVIEW,x+50 - XVIEW,y+200 -YVIEW,0);
		if surface_exists(lightShaftSurface){
			var SHADER_COLOUR = c_black;//global.COLOUR5_GREENLIGHTEST;
	
			shader_set(shd_dither);
				shader_set_uniform_f(u_size, surfaceWidth, surfaceHeight);
				// new uniform for passing a colour, maybe size of the texture too?
				shader_set_uniform_color(shaderColour,SHADER_COLOUR,1.0);
				shader_set_uniform_f(shaderTimer,global.gameTimer mod global.gameWidth);
	
				texture_set_stage(u_dither_tex, dither_tex);
				draw_surface(lightShaftSurface,0,0);
			shader_reset();
		}
	}
	
	

	
	if (current_pal >= darknessThreshold){ // ie it's dark
		with obj_lightingRectangle{
			//if rectangle_in_rectangle(x-0.5*image_xscale,y-0.5*image_yscale,x+0.5*image_xscale,y+0.5*image_yscale
			var XS = 0.5 * sprite_width//image_xscale;
			var YS = 0.5 * sprite_height//image_yscale;
		
			// draw a cone from the light source
			draw_primitive_begin(pr_trianglestrip);
				draw_vertex(x - 0.2*XS - XVIEW,y - YS - YVIEW); // top left
				draw_vertex(x + 0.2*XS - XVIEW,y - YS - YVIEW); // top right
				draw_vertex(x - XS - XVIEW,y + YS - YVIEW); // bottom left
				draw_vertex(x + XS - XVIEW,y + YS - YVIEW); // bottom right
			draw_primitive_end();
		
			//draw_rectangle(x - XS - XVIEW ,y - YS - YVIEW,x + XS - XVIEW,y + YS - YVIEW,0);
		}
		
		
		
		
		with (obj_player){
			// gradual sight reduction
			if (y <= 1600){
				//sonarTransitionRadius = approach(sonarTransitionRadius,0,0.5);
				
				sonarSightRadius = approach(sonarSightRadius, 0, 0.5);
				
			}
			else {
				//sonarTransitionRadius = approach(sonarTransitionRadius,0,0.5);
				
				
				// gradually scale back
				sonarSightRadius = approach(sonarSightRadius, sonarInitialRadius, 0.1);
			}	
		}
		
		
		if (DEEPSEA){
			with (obj_player){
				//draw_set_alpha(0.2);
				draw_set_circle_precision(8);
			
				// TODO: if shrinking/growing, dont apply jitter?
				var CIRCLE_JITTER = sin(global.gameTimer * RADIAN * 40) * 0.5 + round(random(0.52));
			
				draw_circle(x - XVIEW,y - YVIEW,sonarSightRadius + CIRCLE_JITTER,false);	
				draw_set_circle_precision(24);
				draw_set_alpha(1);
			}
		
		
			with (obj_anglerfish){
				draw_set_circle_precision(16);
				var JITTER = sin(global.gameTimer * RADIAN * 40) * 0.5 + round(random(0.52));
				draw_circle(x + swimmingDirection * 22 - XVIEW, y - YVIEW - 7, 3 + JITTER, false);
				draw_set_circle_precision(24);
			}
		}
		
		
	}
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	//shader_set(shd_dither);
	//	shader_set_uniform_f(u_size, surfaceWidth, surfaceHeight);
	//	// new uniform for passing a colour, maybe size of the texture too?
	//	shader_set_uniform_color(shaderColour,c_white,1.0);
	//	shader_set_uniform_f(shaderTimer,global.gameTimer mod global.gameWidth);
	
	//	texture_set_stage(u_dither_tex, dither_tex);	
	draw_surface_ext(lightingSurface,view_xview,view_yview,1,1,0,c_white,1);
	//shader_reset();
#endregion


#region // godraySurface
#endregion 


}

