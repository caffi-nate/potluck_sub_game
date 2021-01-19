if (global.debugMode){
	draw_set_colour(c_yellow);
	draw_text(20,200,y);
	draw_text(20,220,noInputTimer);
}


//draw_text(20,100,audio_is_playing(sfx_subEngineLoop01));
//draw_text(20,80,y);
//draw_text(20,60,global.sun_y);


if (scr_input_check_anybutton()){
	noInputTimer = 0;
}


// only count up after player starts moving
if (obj_gamestate_controller.PLAYER_MOVEMENT){
	if (global.kioskMode) noInputTimer++;
}

draw_set_alpha(0.75 + sin(global.gameTimer * RADIAN * 5) * 0.25);

if (noInputTimer > 0.75 *noInputThreshold){
	
	draw_set_colour(global.COLOUR1_BLACK);
	draw_text(20,21,"No input detected, resetting soon...");
	
	draw_set_colour(global.COLOUR6_WHITE);
	draw_text(20,20,"No input detected, resetting soon...");
	
}
draw_set_alpha(1);
if (noInputTimer >= noInputThreshold) room_goto(1);