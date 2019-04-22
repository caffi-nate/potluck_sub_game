var AA_LEVEL = argument0;
var VSYNC = argument1;

var WINDOW_X = window_get_x();
var WINDOW_Y = window_get_y();

var OLD_ZOOM = global.zoom;

display_reset(AA_LEVEL,VSYNC);

var NEW_ZOOM = global.zoom;

window_set_position(WINDOW_X, WINDOW_Y);