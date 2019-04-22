var FILENAME = global.currentTextFile;

if file_exists(FILENAME){
	var f = file_text_open_read(FILENAME);
	show_debug_message("opened the file!");	
	
	var LINE_NUMBER = 0;
	
	// count the lines
	while (!file_text_eof(f)){
		var CURRENT_LINE_STRING = file_text_read_string(f);
		// replace horizontal tabs with 4 spaces
		CURRENT_LINE_STRING = string_replace_all(CURRENT_LINE_STRING,chr(09),"    "); 
		// get rid of invisible empty spaces
		CURRENT_LINE_STRING = string_replace_all(CURRENT_LINE_STRING," ","");
		
		// only increment if it's not a blank line or a comment
		if (CURRENT_LINE_STRING != ""){
			var FIRSTCHAR = string_char_at(CURRENT_LINE_STRING,0);
			if (FIRSTCHAR != "/") LINE_NUMBER++;	
		}
		
		file_text_readln(f); // skip to the next line of the file	
	}
	
	// resize before we add anything to the grid. Clearing it is important too!!!
	ds_grid_resize(global.textGrid,3,LINE_NUMBER);
	ds_grid_clear(global.textGrid,0);
	show_debug_message("resized text grid");	
	
	file_text_close(f);
}
else {
	show_message("script file " + string(FILENAME) +" does not exist! Game will now exit.");
	game_end();
}