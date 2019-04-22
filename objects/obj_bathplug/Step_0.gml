/// @description Insert description here
// You can write your code in this editor

var SEL_FORCE_LAST_FRAME = sel_force

event_inherited();
if (sel_force  > SEL_FORCE_LAST_FRAME){
	physics_apply_impulse(x,y,x, y + 1000);
	sel_force = false;
	//physics_apply_impulse(x,y,(x-mouse_x)*0.5, (y-mouse_y)*0.5);
	global.plugPulled = true;	
	
	
	with (obj_cloud) instance_destroy();
	
	// get rid of all deep sea fish
	with (obj_fish) instance_destroy();


	for (i = 0; i < 10; i++){
		instance_create_depth(irandom(room_width),240 - irandom(100),global.instance_depth,obj_fishOrange);	
	}
	
	for (i = 0; i < 10; i++){
		instance_create_depth(irandom(room_width),240 - irandom(100),global.instance_depth,obj_anglerfish);	
	}
	

	obj_player.holding = -4;
	
}	


var SPLASH_DURATION = 600;
if (global.plugPulled){
	if !audio_is_playing(sfx_waterfall){
		waterfallSound = scr_play_sound(sfx_waterfall,1,0,true,-4);	
	}
	
	plugPulledTimer++;
	
	if (plugPulledTimer == 60){
		instance_create_depth(x,y,100,obj_dustCloud);
		hidePlug = true;
	}
	
	
	
	
	if (global.gameTimer mod 12 == 0) {
		var SPLASHSCALE = clamp((SPLASH_DURATION - plugPulledTimer) / SPLASH_DURATION, 0, 1);
		instance_create_depth(xstart,ystart,100,obj_splash);
		with (obj_splash){
			image_xscale = SPLASHSCALE;
			image_yscale = SPLASHSCALE;	
		}
		audio_sound_gain(waterfallSound,0.5*SPLASHSCALE*SPLASHSCALE,0);
		
	}
}

if (plugPulledTimer >= SPLASH_DURATION){
	audio_stop_sound(waterfallSound);
	//show_message("hello");
	instance_destroy();
}
