function scr_input_check_pressed() {
	//input_check_pressed(button)

	var INPUT = argument[0];

	var INPUT_MANAGER = obj_controls_handler;

	// check list of inputs this frame and last frame
	if ( (ds_map_find_value(INPUT_MANAGER.inputsDown, INPUT) > INPUT_MANAGER.analogDownDeadzone)
	    and (ds_map_find_value(INPUT_MANAGER.inputsDownLastFrame, INPUT) < INPUT_MANAGER.analogDownDeadzone)){
	        return true;
	}

	//else 

	return false;




}
