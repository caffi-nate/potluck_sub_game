function scr_input_check_released() {
	//input_check_released(input)
	var INPUT = argument[0];
	var INPUT_MANAGER = obj_controls_handler;


	if ( (ds_map_find_value(INPUT_MANAGER.inputsDown, INPUT) < INPUT_MANAGER.analogDownDeadzone)
	    and (ds_map_find_value(INPUT_MANAGER.inputsDownLastFrame, INPUT) > INPUT_MANAGER.analogDownDeadzone)){
	        return true;
	    }
    
	// else

	return false;



}
