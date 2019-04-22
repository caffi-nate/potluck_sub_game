movementSpeed = 3;

var XDIR = argument0;
var YDIR = argument1;

if ((abs(XDIR) + abs(YDIR)) > 0){
	//newAngle = point_direction(x,y,x + XDIR,y + YDIR);
	var TEMPANGLE = point_direction(x,y,x + XDIR,y + YDIR);
	
	if (TEMPANGLE > 90 && TEMPANGLE < 220){
		newAngle = 180; // go left	
	}
	else if (TEMPANGLE > 320 || TEMPANGLE < 90){
		newAngle = 0; // go right	
	}
	else {// hold down to dive
		if (global.canDive)
			newAngle = TEMPANGLE;
	}
}

var turningSpeed = 4;

// apply friction slowdown
//var xFriction = lengthdir_x(fric, newAngle);
hSpeed = approach(hSpeed, 0, fric);
vSpeed = approach(vSpeed, 0, 1);


if (newAngle != -4){
	// only turn towards the angle at normal speed if it's reasonable, else change state
	facingDirection = newAngle;

	var TARGET_XSPEED = lengthdir_x(movementSpeed,facingDirection);
	
	if (sign(hSpeed) != sign(TARGET_XSPEED) && hSpeed != 0){
		
		//skidTimer++;
		//if (skidTimer > 25){
		//	hSpeed = 0;
		//	skidTimer = 0;
		//}
		// apply friction again to skid while turning
		var FRIC_MULTIPLIER = 1//0.2;
		hSpeed = approach(hSpeed, 0, FRIC_MULTIPLIER * fric);
	}
	else { 
		hSpeed = approach(hSpeed,TARGET_XSPEED,acceleration);
	}
	
	
	// create particles
	if (movementTimer mod 6 == 0){		
		if !audio_is_playing(sfx_surfaceSpray){
			scr_play_sound(sfx_surfaceSpray,1,1 * (1-global.endGameGain),true,tailEmitter); //-4);	
		}
		var FROTH = instance_create_depth(x-XSCALE*20,y+4,0,obj_surfaceFroth);
		with (FROTH) dir = other.XSCALE;
		
		
		if (movementTimer mod 12 == 0){
			scr_splash_create(object_index, x - XSCALE *30, y, -abs(0.5*obj_player.hSpeed * 0.25), 16, 4, 4, 0.25, global.COLOUR6_WHITE, 1, bm_normal);
		}
	}
}
else { // no input
	if audio_is_playing(sfx_surfaceSpray){
		audio_stop_sound(sfx_surfaceSpray);
	}
}

// bob along with the waves
	with obj_water_body{
		var col_y = dyliquid_get_y(other.x)
		other.y = approach(other.y,col_y,1);
	}

if (newAngle > 180 && newAngle < 320){// && vSpeed > 0){
	state = states.underwater;	
}

if (global.plugPulled){
	state = states.endgame;	
}