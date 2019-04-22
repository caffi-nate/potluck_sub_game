if !destroy
	SCALE = approach(SCALE,1,0.1);
else {
	SCALE = approach(SCALE,0,0.1);
	if (SCALE <= 0) instance_destroy();
}

var WAVY_X = sin(global.gameTimer * RADIAN * 3) * 2;
// draw speech bubble thing


//draw_circle(x,y,48 * SCALE,false);
draw_sprite_ext(spr_thoughtBubble,1,x,y,SCALE,SCALE,WAVY_X,c_white,1);


// draw desired object
var HOVERY = sin(global.gameTimer * RADIAN * 3) * 2;
draw_sprite_ext(desiredSprite,0,x,y + HOVERY,SCALE,SCALE,0,c_white,1);




draw_set_colour(global.COLOUR7_PEACH);
draw_circle(x + WAVY_X*0.5, y + 32, 5 * SCALE, false);


draw_set_colour(global.COLOUR6_WHITE);
draw_circle(x + WAVY_X*0.5,y + 31, 4 * SCALE, false);