// Inherit the parent event
event_inherited();


movementTimer ++;

var XDIR = 0;
var YDIR = 0;

UNDERWATER_LAST_FRAME = isUnderWater;

if (y < global.waterLevel){
	isUnderWater = false;	
}
else isUnderWater = true;




newAngle = -4;
//hSpeed = 0;
//vSpeed = 0;


var SLOT = obj_controls_handler.gamepadSlot;
YDIR = gamepad_axis_value(SLOT,gp_axislv);
XDIR = gamepad_axis_value(SLOT,gp_axislh);

// now check for direct input as a fallback
if (abs(XDIR) + abs(YDIR) <= 0){
	if scr_input_check("left"){
		XDIR = -1;
	}
	else if scr_input_check("right"){
		XDIR = 1;
	}
	if scr_input_check("up"){
		YDIR = -1;
	}
	else if scr_input_check("down"){
		YDIR = 1;
	}
}




// hacky override lol
if (global.currentlyTalking){
	XDIR = 0;
	YDIR = 0;
}


switch (state){
	case states.surfacePaddle: player_paddle(XDIR,YDIR); break;
	case states.underwater: player_underwater(XDIR,YDIR); break;
	case states.endgame: player_endgame(); break;
	case states.hurt: player_hurt(XDIR,YDIR); break;
}


// update sound
audio_listener_update();
audio_emitter_position(tailEmitter,x - XSCALE *30,y,0);

var ENGINE_GAIN = audio_sound_get_gain(engineSound);
if (abs(XDIR) + abs(YDIR) > 0){
	audio_sound_gain(engineSound,engineGain* (1-global.endGameGain), 500);
}
else {
	audio_sound_gain(engineSound,0,50);	
}
	audio_sound_pitch(engineSound,ENGINE_GAIN * 2);



if scr_input_check_pressed("face1") && !instance_exists(obj_sonarPulse) && !global.currentlyTalking{
	//scr_play_sound(bubbles01,1,1,false,-4);	
	instance_create_depth(x,y,0,obj_sonarPulse);
	
}


// flip depending on movement direction

if (keyboard_check_pressed(vk_space)){
	state = states.hurt;	
}


if (state != states.hurt && state != states.endgame) {
	if (newAngle != -4){ // only while moving
		if (newAngle > 90 && newAngle < 270) xdir = -1;
		else if (newAngle < 90 || newAngle > 270) xdir = 1;
	}
	var FLIPSPEED = 0.12;
	XSCALE = approach(XSCALE,xdir,FLIPSPEED);
	
	
	var ENEMY_COLLISION = instance_place(x,y,obj_fish);
	if ENEMY_COLLISION && state != states.endgame {
		var HURT_ANGLE = point_direction(x,y,ENEMY_COLLISION.x,ENEMY_COLLISION.y);
		//state = states.hurt;	

		impactDirection = HURT_ANGLE + 180;
		hSpeed = lengthdir_x(3,impactDirection);
		vSpeed = lengthdir_y(3,impactDirection);
		scr_hurt_transition();
	}
	
	
	if (abs(YDIR) + abs(XDIR) > 0){
		sprite_index = spr_playerMove;	
		image_speed = 2; // used for propeller here
		propellerSprite = spr_propeller_move;
	}
	else {
		sprite_index = spr_playerIdle;
		image_speed = 0.6; // used for player sprite
		propellerSprite = spr_propeller_static;	
	}
	
	
}





	// produce bubbles when idle too
	if (movementTimer mod 30 == 0){
		instance_create_depth(x-XSCALE*25, y,0,obj_bubbleTrail);
	}



// update claws


//clawLeft = instance_create_depth(x-32,y+32,0,obj_clawpart);
//clawRight = instance_create_depth(x+32,y+32,0,obj_clawpart);




invincibilityTimer = approach(invincibilityTimer,0,1);

if instance_exists(obj_dialogueManager) global.currentlyTalking = true;



if (holding != -4){
	if !instance_exists(obj_sweaty) instance_create_depth(x,y,0,obj_sweaty);	
}
else {
	if instance_exists(obj_sweaty) with(obj_sweaty) instance_destroy();	
}




exit;
var GRIPPING = false;
if scr_input_check("RT") GRIPPING = true;
var CLAW_OFFSET = 48;
with (clawLeft){
	if (!GRIPPING){
		phy_position_x = approach(phy_position_x,other.x - CLAW_OFFSET,4);
		phy_position_y = approach(phy_position_y,other.y + 32,4);
	} else {
		physics_apply_local_force(x, y, 1, 0)
	}
	
}
with (clawRight){
	if (!GRIPPING){
		phy_position_x = approach(phy_position_x,other.x + CLAW_OFFSET,4);	
		phy_position_y = approach(phy_position_y,other.y + 32,4);
	} else {
		physics_apply_local_force(x, y, 1, 0)
	}	
}



