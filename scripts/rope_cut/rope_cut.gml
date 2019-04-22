/// @description rope_draw(id, texture, color, alpha)
/// @param id
/// @param  texture
/// @param  color
/// @param  alpha

var _id, _texture, _color, _alpha, _smooth, _segments, _cuts, _w_half, _h_half, i, j, a, b, angle, _inst, _x1, _y1, _x2, _y2;

_id = argument0;
_texture = argument1;
_color = argument2;
_alpha = argument3;
_segments = array_length_2d(rp_segment, _id);
_cuts = ds_list_size(rp_cuts[@ _id]);
_w_half = rp_width[@ _id]/2;
_h_half = rp_height[@ _id]/2;

for (i=0; i<_cuts-1; i++) {
  a = ds_list_find_value(rp_cuts[@ _id], i);
  b = ds_list_find_value(rp_cuts[@ _id], i+1);
  for (j=a; j<b; j++) {
    _inst = rp_segment[@ _id, j];
    rp_x[_id, j] = _inst.phy_position_x-lengthdir_x(_w_half, _inst.image_angle);
    rp_y[_id, j] = _inst.phy_position_y-lengthdir_y(_w_half, _inst.image_angle);
    if (j = b-1) {
      rp_x[_id, b] = _inst.phy_position_x+lengthdir_x(_w_half, _inst.image_angle);
      rp_y[_id, b] = _inst.phy_position_y+lengthdir_y(_w_half, _inst.image_angle);
    }
	
	
	  // test: get the center of the rope
	  if (j == (a + floor(0.5*b)))//(_cuts-2)*0.5){
	  {
		  //show_debug_message("halfway");
		  //rope_middle_x = 0;
		  //rope_middle_y = 0;
		  rope_middle_x = rp_x[_id,j];
		  rope_middle_y = rp_y[_id,j];
	  }
  }
  

  
  
  draw_primitive_begin_texture(pr_trianglestrip, _texture);
  for (j=a; j<b+1; j++) {
    if (j < b) or (j = 0) {
      _inst = rp_segment[@ _id, j];
    }
    angle = round(-_inst.phy_rotation);
    _x1 = rp_x[@ _id, j]+lengthdir_x(_h_half, angle-90);
    _y1 = rp_y[@ _id, j]+lengthdir_y(_h_half, angle-90);
    _x2 = rp_x[@ _id, j]+lengthdir_x(_h_half, angle+90);
    _y2 = rp_y[@ _id, j]+lengthdir_y(_h_half, angle+90);
    draw_vertex_texture_colour(_x1, _y1, j, 0, _color, _alpha);
    draw_vertex_texture_colour(_x2, _y2, j, 1, _color, _alpha);
  }
  texture_set_repeat(1);
  draw_primitive_end();
  texture_set_repeat(0);
}
