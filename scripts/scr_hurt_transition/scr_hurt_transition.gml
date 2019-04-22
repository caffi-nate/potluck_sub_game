// screenshake
if (invincibilityTimer <= 0){
	with obj_display_manager {
		trauma += 100;	// big impact
	}

	// play kiki cry sound
	scr_play_sound(sfx_underwaterImpact01,1,1 * (1-global.endGameGain),false,-4);
	// delayed hurt sound until a frame or two into hurt state
	
	state = states.hurt;
}