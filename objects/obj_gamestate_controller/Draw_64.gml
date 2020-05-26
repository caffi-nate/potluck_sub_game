// draw logo
if (!windowFocused){
	// draw a big black box? or a pause surface later, ideally.
	draw_set_colour(c_black);
	draw_rectangle(0,0,view_wview,view_hview,false);
	exit;
} 

if !surface_exists(logoSurface){
	logoSurface = surface_create(surfaceWidth,surfaceHeight);	
}
surface_set_target(logoSurface);
draw_clear_alpha(c_black,0);

	draw_sprite_ext(spr_logoTest,1,view_wview*0.5,view_hview*0.25,LOGOSCALE,LOGOSCALE,0,c_white,logoAlphaVar);

surface_reset_target();


var SINE = global.gameTimer * RADIAN;

var BM1 = 8;
var BM2 = 4;

//gpu_set_blendmode_ext(8,4);
shader_set(shd_enemyDeath);
shader_set_uniform_f(SURFACE_POSITION, surfacePosition);
shader_set_uniform_f(SINE_VALUE,SINE);
	//draw_surface(logoSurface,0,0);
	draw_surface_part(logoSurface,0,0,view_wview,0.6*view_hview,0,0);
	
shader_reset();
//gpu_set_blendmode(bm_normal);



// adjust "alpha" of logo surface

var POS_CHANGE_SPEED = 0.02;
if keyboard_check(ord("N")){
	surfacePosition = approach(surfacePosition,0.0,POS_CHANGE_SPEED);	
}
else if keyboard_check(ord("M")){
	surfacePosition = approach(surfacePosition,5.0,POS_CHANGE_SPEED); // was 1.0
}


if (PLAYER_MOVEMENT){
	//logoAlphaVar = approach(logoAlphaVar,0,0.02);	

	surfacePosition = approach(surfacePosition,5.0,POS_CHANGE_SPEED); // was 1.0
}
else {
	LOGOSCALE = approach(LOGOSCALE,1,0.06);
	surfacePosition = approach(surfacePosition,0.0,POS_CHANGE_SPEED);	
	//logoAlphaVar = approach(logoAlphaVar,1,0.1);
	
	if scr_input_check_anybutton()
		PLAYER_MOVEMENT = true;
}


var SCREEN_WIPE_SPEED = 24;
introTimer += SCREEN_WIPE_SPEED;
if (introTimer < view_wview){
	draw_set_colour(global.COLOUR1_BLACK);
	draw_rectangle(introTimer,0,view_wview,view_hview,false);
}


if outroWipe {
	outroTimer += SCREEN_WIPE_SPEED;
	
	draw_set_colour(global.COLOUR1_BLACK);
	draw_rectangle(0, 0, outroTimer, view_hview, false);
	
	if (outroTimer >= view_wview) room_goto(1); // restart game
	
}
