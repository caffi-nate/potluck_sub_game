update_audio_component();


if keyboard_check_pressed(vk_space){
	//show_debug_message("hello!");
	//scr_play_sound(sfx_bubbles01,1 + soundPitchOffset + random_range(-0.05,0.05),1,false,myAudioEmitter);
}	




bubbleTimer++;
if (bubbleTimer > bubbleThreshold && !bubbling){
	bubbling = true;
	scr_play_sound(sfx_bubbles01,1 + soundPitchOffset + random_range(-0.05,0.05),1 * (1-global.endGameGain),false,myAudioEmitter);
}

if (bubbling && bubbleTimer mod 16 == 0){
	scr_create_bubble(x,y);
	
	//instance_create_depth(x,y,200,obj_bubbleTrail);
	var STOP_BUBBLES = irandom(10);
	
	if (STOP_BUBBLES > 6){
		bubbling = false;
		bubbleThreshold = 300 + irandom(300);
		bubbleTimer = 0;
	}
}