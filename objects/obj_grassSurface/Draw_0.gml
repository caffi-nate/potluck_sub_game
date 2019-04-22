var SURFACEHEIGHT = view_hview; // test
var SURFACEWIDTH = view_wview; // test

//grassSurface = surface_setup(grassSurface,SURFACEWIDTH,SURFACEHEIGHT);
if !surface_exists(grassSurface){
	grassSurface = surface_create(SURFACEWIDTH,SURFACEHEIGHT);	
}
surface_set_target(grassSurface);
draw_clear_alpha(c_black,0);


// use a shader to draw outlines around all the grass hopefully


    // TO DO: OPTIMISE
    // Only draw grass if it's within view range

    with obj_grasswavy{
        var sprite = sprite_index;
        var index = image_index;
        var xx = x - view_xview; // usually just x, alter for surface position
        var yy = y - view_yview; // usually just y, alter for surface position
        var xscale = image_xscale;
        var yscale = image_yscale;
        var cosAngle = cos(degtorad(image_angle));
        var sinAngle = sin(degtorad(image_angle));
        var tint = c_white;
        var alpha = 1;
        var hskew = xskew;
        var vskew = 0;
        
        // Calculate common operations
        var sprTex    = sprite_get_texture(sprite, index); 
        var sprWidth  = sprite_get_width(sprite); 
        var sprHeight = sprite_get_height(sprite); 
        var sprXOrig  = sprite_get_xoffset(sprite); 
        var sprYOrig  = sprite_get_yoffset(sprite);
        
        var tempX, tempY, tempDir, tempDist;
        
        // Begin drawing primitive
        draw_primitive_begin_texture(pr_trianglestrip, sprTex);
        
        // Top-left corner
        tempX = (-sprXOrig + (sprYOrig / sprHeight) * hskew) * xscale;
        tempY = (-sprYOrig + (sprXOrig / sprWidth) * -vskew) * yscale;
        draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 0, 0, tint, alpha);
        
        // Top-right corner
        tempX = (sprWidth + (sprYOrig / sprHeight) * hskew - sprXOrig) * xscale;
        tempY = (-sprYOrig + (1 - sprXOrig / sprWidth) * vskew) * yscale;
        draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 1, 0, tint, alpha);
        
        // Bottom-left corner
        tempX = (-sprXOrig + (1 - sprYOrig / sprHeight) * -hskew) * xscale;
        tempY = (sprHeight - sprYOrig + (sprXOrig / sprWidth) * -vskew) * yscale;
        draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 0, 1, tint, alpha);
        
        // Bottom-right corner
        tempX = (sprWidth - sprXOrig + (1 - sprYOrig / sprHeight) * -hskew) * xscale;
        tempY = (sprHeight - sprYOrig + (1 - sprXOrig / sprWidth) * vskew) * yscale;
        draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 1, 1, tint, alpha);
        
        // Finish drawing primitive
        draw_primitive_end();
    }
	
	with obj_shipwreck{
		if (visible) draw_sprite(sprite_index,image_index,x - view_xview, y - view_yview);
	}
	
    
// draw a circle in the middle of the surface to test
//draw_set_colour(c_red);
//draw_circle(SURFACEWIDTH*0.5,SURFACEHEIGHT*0.5,2,0)
    

//if shaderOn{
    //shader_set(shd_outlineNew);
    //shader_set(shd_passthroughtest);
//    shader_set(shd_outline2106);
//}


//draw_
//draw_

    
surface_reset_target();
//
//shader_reset();// not necessary yet but might be later