var HUE = argument0;
var SATURATION = argument1;
var VALUE = argument2;


HUE = ceil(HUE / 360 * 255);
SATURATION *= 2.55;
VALUE = round( VALUE * 2.55 );

var NEWCOLOR = make_color_hsv(HUE,SATURATION,VALUE);

return NEWCOLOR;