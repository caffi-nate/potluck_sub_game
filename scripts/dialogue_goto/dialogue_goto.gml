function dialogue_goto(argument0) {
	var CURRENT_LINE = argument0;

	//show_debug_message("GOTO:");
	// use 2 for the whole line!
	var GOTO_TAG = ds_grid_get(global.textGrid,2,CURRENT_LINE);
	//show_message("GOTO TAG: " + GOTO_TAG);

	var LABEL_TAG = string_replace(GOTO_TAG,"goto","label");

	LABEL_TAG = LABEL_TAG + ":";
	show_debug_message("LABEL TAG: " + LABEL_TAG);




	var GRID_HEIGHT = ds_grid_height(global.textGrid);

	for (i = 0; i < GRID_HEIGHT; i++){
		var CURRENT = ds_grid_get(global.textGrid,2,i);
	
		//show_message(string(CURRENT) + " | " + string(LABEL_TAG));
	
		if (CURRENT == LABEL_TAG){
			//show_message("found a matching tag!");
			currentGridLine = i + 1; // skip over the label tag
		
			break;
		}
	}


	//show_message("goto script failure");

	// failure
	return 0;




}
