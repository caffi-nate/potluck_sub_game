movementSpeed = 3//2.5//3;
acceleration = 0.1//0.05; //0.2
var turningSpeed = 8//4;

var XDIR = argument0;
var YDIR = argument1;

if ((abs(XDIR) + abs(YDIR)) > 0){
	newAngle = point_direction(x,y,x + XDIR,y + YDIR);
}



if (newAngle != -4){
	// only turn towards the angle at normal speed if it's reasonable, else change state
	var ANGLEDIFFERENCE = abs(newAngle - facingDirection) 
	
	if (ANGLEDIFFERENCE < 135 || ANGLEDIFFERENCE > 225){
		facingDirection = angle_approach(facingDirection, newAngle, turningSpeed);	
		hSpeed = approach(hSpeed,lengthdir_x(movementSpeed,facingDirection),acceleration);
		vSpeed = approach(vSpeed,lengthdir_y(movementSpeed,facingDirection),acceleration);	
	}
	else { // we need to make a full turn first and apply drag beforehand
		
		
		// create particles
		if (movementTimer mod 6 == 0){		
			var FROTH = instance_create_depth(x-XSCALE*20,y+4,0,obj_underwaterFroth);
			with (FROTH) dir = other.XSCALE;
		}
		
		
		
		skidTimer++;
		var SKID_DURATION = 8//25
		if (skidTimer > SKID_DURATION){
			facingDirection = newAngle;
			skidTimer = 0;
		}
		
		var SPEED_THRESHOLD = 0.01;
		var FRIC_MULTIPLIER = 0.2;//1.5; // might need to be an exponential...
		var ACE_MULTIPLIER = 2.5;
		if (abs(hSpeed) >= SPEED_THRESHOLD || abs(vSpeed) >= SPEED_THRESHOLD){
			// apply friction again to skid while turning
			hSpeed = approach(hSpeed, 0, FRIC_MULTIPLIER*fric);
			vSpeed = approach(vSpeed, 0, FRIC_MULTIPLIER*fric);
		}
		else { // we've slowed down sufficiently so we can take off again
			facingDirection = newAngle;
			
			// starting boost
			hSpeed = approach(hSpeed,lengthdir_x(movementSpeed,facingDirection),ACE_MULTIPLIER * acceleration);
			vSpeed = approach(vSpeed,lengthdir_y(movementSpeed,facingDirection),ACE_MULTIPLIER * acceleration);	
		}
	}
	

	
	
	// update movement particles	
	if (movementTimer mod 4 == 0){
		instance_create_depth(x-XSCALE*20, y,0,obj_bubbleTrail);
	}
}
else { // no input
	hSpeed = approach(hSpeed, 0, fric);
	vSpeed = approach(vSpeed, 0, fric);	
}


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