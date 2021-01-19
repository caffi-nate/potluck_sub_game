function parse_dialogue_choices(argument0) {
	var CURRENT_GRIDLINE = argument0;
	var TEMP_GRIDLINE = CURRENT_GRIDLINE;
	var CHOICE_TEXT = "";
	var CURRENT_TEXT = ds_grid_get(global.textGrid,2,CURRENT_GRIDLINE);
	var FIRSTWORD = ds_grid_get(global.textGrid,0,CURRENT_GRIDLINE);

	while (ds_grid_get(global.textGrid,0,TEMP_GRIDLINE) != "endchoice"){
		// update after incrementing
		CURRENT_TEXT = ds_grid_get(global.textGrid,2,TEMP_GRIDLINE);
		FIRSTWORD = ds_grid_get(global.textGrid,0,TEMP_GRIDLINE);
		var FIRST_CHARACTER = string_char_at(CURRENT_TEXT,1);
	
		// if we have some dialogue on our hands, add it to the choice text and choice array
		if (FIRST_CHARACTER == "\""){
			if (CHOICE_TEXT == "") CHOICE_TEXT = CURRENT_TEXT;
			else {			
				// set a gridline too so that we know where to pick up from
				ds_grid_set(choice_grid, 0, numChoices, CURRENT_TEXT);
				ds_grid_set(choice_grid, 1, numChoices, TEMP_GRIDLINE);
				numChoices++;
			}	
		}
		TEMP_GRIDLINE++;
	}

	choiceText = CHOICE_TEXT;



}
