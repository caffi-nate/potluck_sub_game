
var AMPLITUDE = 2;
var FREQUENCY = 0.5;

// all the convoluted magic numbers basically just give a float between 0 and 1
alphaVar = sin((global.gameTimer + (id mod 20) * 100) * RADIAN * FREQUENCY) * AMPLITUDE + 2.2;

alphaVar = clamp(alphaVar, 0, 1);

//draw_set_color(c_yellow);
//draw_text(x,y-20,alphaVar);

exit;

draw_primitive_begin(pr_trianglestrip);
	draw_vertex_colour(x - 0.5*lightWidth,y, lightColour, 1);
	draw_vertex_colour(x + 0.5*lightWidth,y, lightColour, 1);
	draw_vertex_colour(skewAngle + x - 0.5*lightWidth, y + lightHeight, lightColour, 0);
	draw_vertex_colour(skewAngle + x + 0.5*lightWidth, y + lightHeight, lightColour, 0);
draw_primitive_end();


