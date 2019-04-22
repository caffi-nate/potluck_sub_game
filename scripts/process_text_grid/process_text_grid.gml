var FILENAME =  global.currentTextFile;

if file_exists(FILENAME){
	var f = file_text_open_read(FILENAME);
	show_debug_message("opened the file!");	
	var LINE_NUMBER = 0;
	
	// count the lines
	while (!file_text_eof(f)){
		var CURRENT_LINE_STRING = file_text_read_string(f);
		var TABLESS_STRING = string_replace_all(CURRENT_LINE_STRING,chr(09),"    "); // replace horizontal tabs with 4 spaces
		var TABLESS_STRING_2 = string_replace_all(CURRENT_LINE_STRING,chr(09),"");
		var SPACELESS_STRING = string_replace_all(TABLESS_STRING," ",""); // get rid of invisible empty spaces
		// only increment if it's not a blank line or a comment
		if (SPACELESS_STRING != ""){
			var CHARACTER_INDEX = 1; // strings start at 1, not 0 !
			
			// check what the first non-space character contains
			var CURRENT_CHARACTER = string_char_at(TABLESS_STRING,CHARACTER_INDEX);
			while (CURRENT_CHARACTER == " "){
				CHARACTER_INDEX++;
				CURRENT_CHARACTER = string_char_at(TABLESS_STRING,CHARACTER_INDEX);
			}
			
			if (CURRENT_CHARACTER != "/"){ // not a comment	
				if (CURRENT_CHARACTER == "\""){ // we're  parsing dialogue
				}
				else {
					var FIRSTWORD = "";
					var LINE_LENGTH = string_length(TABLESS_STRING);
					
					while (CURRENT_CHARACTER != " ") && (CHARACTER_INDEX <= LINE_LENGTH){	// check for both spaces and end of line
						CURRENT_CHARACTER = string_char_at(TABLESS_STRING,CHARACTER_INDEX);
						if (CURRENT_CHARACTER == " ") break;
						FIRSTWORD += CURRENT_CHARACTER;
						CHARACTER_INDEX++;
					}
					//show_debug_message("First Word: " +FIRSTWORD);
					ds_grid_set(global.textGrid,0,LINE_NUMBER,FIRSTWORD);
				}
				
				//var COMMAND = "";
				//show_debug_message("Line "+ string(LINE_NUMBER) + " First character: " + CURRENT_CHARACTER);
				//show_debug_message("Line "+ string(LINE_NUMBER) + " First Word: " + FIRSTWORD + " | " + CURRENT_LINE_STRING);

				ds_grid_set(global.textGrid,2,LINE_NUMBER,TABLESS_STRING_2);
				//ds_grid_set(global.textGrid,2,LINE_NUMBER,CURRENT_LINE_STRING);
				LINE_NUMBER++;	
			}
		}
		file_text_readln(f); // skip to the next line of the file	
	}
		
	file_text_close(f);
}
else {
	show_message("script file " + string(FILENAME) +" does not exist! Game will now exit.");
	game_end();
}