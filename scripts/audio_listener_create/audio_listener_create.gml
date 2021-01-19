/// audio listener set up
function audio_listener_create() {

	// set which way our fake head/ears are looking and tilted
	//audio_listener_orientation(0,1,0,  0,0,1);


	// old
	//audio_listener_orientation(0,1000,0,  0, 0, 1);
	audio_listener_orientation(0,0,-1000, 0, 1, 0);

	//emitter for playing sounds that are played right at player's position
	global.mainEmitter = audio_emitter_create();

	// makk the game's audio listener (ears!) follow the player position
	//audio_listener_position(view_wview*0.5,view_hview*0.5,0);



}
