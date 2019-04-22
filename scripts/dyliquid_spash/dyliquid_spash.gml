///dyliquid_spash(x, force)

/*
Splashes water at x with given force.  
A negative force is accepted (looks as if something is coming out of water).
*/

if (argument0 > dy_x[1] || argument0 < dy_x[0] || argument1 == 0) {
  exit;
}

var index = round(clamp(dy_colomns_count, 0, (argument0 - dy_x[0])/dy_column_width));
for (var i=index; i<min(dy_colomns_count, index+1); i++) {
  dy_column[i*3+2] = argument1;
}
