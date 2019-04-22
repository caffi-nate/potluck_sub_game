///dyliquid_set_quality(columns, smoothing)

/*
Sets the quality of the water.

argument0: The amount of columns to be used. Ideally, the bigger the area of the water the more columns
you want to have (If area is small, it won't make a difference but it will slow down the game).
argument1: The bigger the value, the smoother the transition of force between waves.

Of course, with a higher quality it's going to be slower. You need to adjust this according to your needs.
*/

argument0 = max(2, argument0);

if (argument0 > dy_colomns_count) {
  for(var i=dy_colomns_count; i<argument0; i+=1) {
    dy_column[i*3] = dy_y[0]; // target height
    dy_column[i*3+1] = dy_y[0]; // height
    dy_column[i*3+2] = 0; // speed
  }
}

dy_colomns_count = argument0;
dy_column_width = (dy_x[1] - dy_x[0]) / (dy_colomns_count - 1); // width of each spring
dy_smoothing = argument1; // amount of water passes, used in dyliquid_update
