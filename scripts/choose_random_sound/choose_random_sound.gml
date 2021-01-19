///choose_random_sound(previous_sound_ID, sound1, sound2, sound3 etc)
function choose_random_sound() {


	// use -4 for argument0 if not keeping track of last played sound.
	// maximum 15 sounds.

	var PREVIOUSSOUND = argument[0];
	var DEFAULTSOUND = argument[1]; // return this on first try

	var NEWSOUND = DEFAULTSOUND;
	var NUM_SOUNDS = argument_count-1;

	// loop through for subsequent tries
	while (NEWSOUND == PREVIOUSSOUND){
	    var RANDOM_NUM = floor(random(NUM_SOUNDS)) + 1;
	    NEWSOUND = argument[RANDOM_NUM];
	}


	return NEWSOUND;

	/*
	var SOUNDLIST = ds_list_create();

	for (i = 1; i < argument_count; i++){
	    ds_list_insert(SOUNDSLIST,i-1,argument[i];
	}




	// destroy when we're done.
	if ds_exists(SOUNDSLIST,ds_type_list) ds_list_destroy(SOUNDSLIST);
	*/



}
