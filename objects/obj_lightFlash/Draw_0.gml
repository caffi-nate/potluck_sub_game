flashTimer = approach(flashTimer,flashDuration,1);

flashAlpha = approach(flashAlpha,0,0.1);

draw_set_colour(c_white);
draw_set_alpha(flashAlpha);

var XX = view_xview;
var YY = view_yview;

draw_rectangle(XX,YY,XX+global.gameWidth,YY+global.gameHeight,0);

draw_set_alpha(1);

if (flashTimer >= flashDuration) instance_destroy();