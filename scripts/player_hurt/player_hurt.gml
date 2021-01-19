function player_hurt(argument0, argument1) {
	sprite_index = spr_playerHurt;

	hurtTimer ++;

	var HURT_DURATION = 60;
	invincibilityTimer ++;
	if (hurtTimer >= HURT_DURATION){
		state = states.underwater;
		hurtTimer = 0;
		hurtSpinSpeed = 15; // reset
	}

	movementSpeed = 3;

	var XDIR = argument0;
	 var YDIR = argument1;

	if ((abs(XDIR) + abs(YDIR)) > 0){
		newAngle = point_direction(x,y,x + XDIR,y + YDIR);
	}

	var turningSpeed = 4;


	
	// update movement particles	
	if (movementTimer mod 4 == 0){
		instance_create_depth(x-XSCALE*20, y,0,obj_bubbleTrail);
	}
	// no input
	hSpeed = approach(hSpeed, 0, fric);
	vSpeed = approach(vSpeed, 0, fric);	


	// check later: that vSpeed not too high, else we'll jump out of the water instead
	if (instance_place(x,y,obj_water_body)){
	
		// apply slight magnetism until we hit the surface
		if (y < (global.waterLevel + 32)){
			vSpeed -= 0.025;	
		}

		if (y < (global.waterLevel + 8) && vSpeed < 0){
			state = states.surfacePaddle;
		}
	}



	/// sounds


	// process dive sounds
	if (isUnderWater > UNDERWATER_LAST_FRAME){
		scr_play_sound(sfx_dive01,1,1 * (1-global.endGameGain),false, -4);
		scr_play_sound(sfx_splashBig02,1,1 * (1-global.endGameGain),false,-4);
		//show_debug_message("diving!");
	}

	if audio_is_playing(sfx_surfaceSpray){
		//scr_play_sound(sfx_surfaceSpray,1,0.5,true,-4);
		audio_stop_sound(sfx_surfaceSpray);
	}




	// spin on hurt
	// starts at 15
	hurtSpinSpeed = approach(hurtSpinSpeed, 1, 0.005 * hurtSpinSpeed);
	show_debug_message(hurtSpinSpeed);
	XSCALE = sin(RADIAN * (hurtTimer * hurtSpinSpeed));



}
