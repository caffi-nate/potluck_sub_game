///dyliquid_draw_texture(col1, col2, alpha1, alpha2, texture, texture width, texture height);

/*
Draws the water with given colour, alpha and texture.
*/

var i, p1, p2, p3, p4, tex, tex_w, tex_h;

tex = argument4;

draw_primitive_begin_texture(pr_trianglestrip, tex);
for(i=0; i<dy_colomns_count; i+=1) {
  p1[0] = dy_x[0] + i * dy_column_width;
  p1[1] = dy_column[i*3+1];
  p2[0] = p1[0];
  p2[1] = dy_y[1];
  draw_vertex_texture_colour(p1[0], p1[1], p1[0]/argument5, 0, argument0, argument2);
  draw_vertex_texture_colour(p2[0], p2[1], p2[0]/argument6, (dy_y[0]-p2[1])/argument6, argument1, argument3);
}
draw_primitive_end();

