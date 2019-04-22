///dyliquid_set_bounds(x1, y1, x2, y2)

/*
Sets location and size of water (arguments as draw_rectangle)
*/

dy_x[0] = argument0;
dy_x[1] = argument2;
dy_y[0] = argument1;
dy_y[1] = argument3;

dy_column_width = (dy_x[1] - dy_x[0]) / (dy_colomns_count - 1); // width of each spring