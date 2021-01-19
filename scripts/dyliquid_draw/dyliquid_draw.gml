///dyliquid_draw(col1, col2, alpha1, alpha2);
function dyliquid_draw() {

	/*
	Draws the water with given colors and alpha values.
	*/

	var i, p1, p2, p3, p4;

	// draw main water
	//scr_test_blend_mode(BM1,BM2);




	//scr_test_blend_mode(8,4);
	//draw_primitive_begin(pr_trianglestrip);
	//for(i=0; i<dy_colomns_count; i+=1) {
	//  p1[0] = dy_x[0] + i * dy_column_width       ;//      - dy_x[0];
	//  p1[1] = dy_column[i*3+1]                    ;//      - dy_y[0] + SURFACE_OFFSET_Y;
	//  p2[0] = p1[0]                                              ;
	//  p2[1] = dy_y[1]                             ;//      - dy_y[0] + SURFACE_OFFSET_Y;
	//  draw_vertex_colour(p1[0], p1[1], argument0, argument2);
	//  draw_vertex_colour(p2[0], p2[1], argument1, argument3);
	//}
	//draw_primitive_end();
	//gpu_set_blendmode(bm_normal);

	// draw black line for top of water
	//draw_set_colour(c_black);
	//draw_primitive_begin(pr_trianglestrip);
	//for(i=0; i<dy_colomns_count; i+=1) {
	//  p1[0] = dy_x[0] + i * dy_column_width;
	//  p1[1] = dy_column[i*3+1];
	//  p2[0] = p1[0];
	//  p2[1] = dy_y[1];
	//  draw_vertex(p1[0], p1[1]);
	//  draw_vertex(p2[0], p1[1] + 1);
	//}
	//draw_primitive_end();

	// draw white strip for top of water

	draw_set_colour(c_white);
	draw_set_colour(global.COLOUR6_WHITE);
	draw_primitive_begin(pr_trianglestrip);
	for(i=0; i<dy_colomns_count; i+=1) {
	  p1[0] = dy_x[0] + i * dy_column_width;
	  p1[1] = dy_column[i*3+1];
	  p2[0] = p1[0];
	  p2[1] = dy_y[1];
	  draw_vertex(p1[0], p1[1] + 1);
	  draw_vertex(p2[0], p1[1] + 2);
	}
	draw_primitive_end();



	scr_test_blend_mode(BM1,BM2); // was this one but lets go opaque

	//draw_set_colour(c_white);
	draw_set_colour(global.COLOUR6_WHITE);
	var tex = sprite_get_texture(spr_testWater1,obj_water_body.IMAGE_INDEX);
	//tex = sprite_get_texture(spr_walk2,1);
	draw_primitive_begin_texture(pr_trianglestrip,tex);
	// test:

	/*
	    var X1 = dy_x[0];
	    var X2 = dy_x[0] + dy_colomns_count * dy_column_width;
  
	    var Y1 = dy_column[1];
	    var Y2 = Y1 + 32;
    
    
	    X1 = obj_player.x + obj_player.sprite_xoffset;
	    X2 = X1 + 32;
	    Y1 = obj_player.y + obj_player.sprite_yoffset;
	    Y2 = Y1 + 32;

	draw_vertex_texture(X1,Y1,0,0);
	draw_vertex_texture(X2,Y1,1,0);
	draw_vertex_texture(X1,Y2,0,1);
	draw_vertex_texture(X2,Y2,1,1);
	*/


	//texture_set_repeat(1);
	gpu_set_texrepeat(true);
	for(i=0; i<dy_colomns_count; i+=1) {
	  p1[0] = dy_x[0] + i * dy_column_width;
	  p1[1] = dy_column[i*3+1];
	  p2[0] = p1[0];
	  p2[1] = dy_y[1];
  
  
	  var WTH = (dy_x[0] + dy_colomns_count * dy_column_width) - dy_x[0]; // necessary?
  
	  var XX = ((p1[0] - dy_x[0])/32) mod 32; // where 16 in this case is water width? 
	  //var XX = (((p1[0] - dy_x[0]) mod 32)) / 32; // close but no cigar...
	  //show_message(XX);
  
	  draw_vertex_texture(p1[0], p1[1] + 1,   
	  XX, 0                          ) ;
	  draw_vertex_texture(p2[0], p1[1] + 33,   
	  XX, 1                                      ); // plus height of texture
	}
	draw_primitive_end();
	gpu_set_texrepeat(false);
	//texture_set_repeat(0);
	//for(i = 0; i < sprite_width; i+= 32){
	//    draw_sprite(spr_testWaterSurface,1,dy_x[0] + i,dy_y[0]+1);
	//}


	gpu_set_blendmode(bm_normal);


}
