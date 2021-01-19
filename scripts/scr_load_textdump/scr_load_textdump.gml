function scr_load_textdump(argument0) {
	var TEXTFILE = string(argument0);

	//if !file_exists("test.txt"){
	if file_exists(TEXTFILE){
	    //show_message("FILE OPENED");
	    var f = file_text_open_read(TEXTFILE);
    
	    var LINENUM = 0;
	    var MAPLINE = 0;    
    
	    while (!file_text_eof(f)){
    
	        // if the line is not empty, read the data into an array/grid
	        if !file_text_eoln(f){
	            var CURRENTLINE = file_text_read_string(f);
            
	            // read the first character of the line to determine what we do with the rest
	            var FIRSTCHAR = string_char_at(CURRENTLINE,0); 
            
	            // only parse the line if it isn't prefaced with comment symbol // 
	            if !(string_char_at(CURRENTLINE,0) == "/" && string_char_at(CURRENTLINE,1) == "/"){
	                var LINETYPE = "REGULAR";
            
	                if FIRSTCHAR == "$" { // we're parsing a simple key/word combo
	                    LINETYPE = "KEYWORD";
	                }
	                else if FIRSTCHAR == "#"{ // we're parsing a set of choices
	                    LINETYPE = "CHOICESET";
                
	                }
	                else if FIRSTCHAR == "@"{ // we're parsing a choice itself
	                    LINETYPE = "CHOICELINE";
	                }
	                else if FIRSTCHAR == ""{ // empty line
	                    LINETYPE = "SKIP";
	                }
	                //else { // parsing a regular dialogue sentence
	                //}
            
	                var LINEPOSITION = 1;
	                var SPLIT = 0; // where to split the string into the key and data
	                var LENGTH = string_length(CURRENTLINE);
                
	                var KEY = "";
	                var TEXT = "";
                
                
	                // first, let's read for the first key on the line
	                while string_char_at(CURRENTLINE,LINEPOSITION) != " "{
	                    KEY = KEY + string_char_at(CURRENTLINE,LINEPOSITION);
                    
	                    //string_insert(string_char_at(CURRENTLINE,LINEPOSITION),KEY,string_length(KEY));
	                    LINEPOSITION += 1;
                    
	                } 
                
	                // add a set of values to the map so that we can look them up in the grid
	                ds_map_add(global.dialogueKeyMap,KEY,MAPLINE);
	                //show_message(ds_map_size(global.dialogueKeyMap)); // check
	                //show_message(ds_map_find_value(global.dialogueKeyMap,KEY));
	                //show_message(KEY);
                
	                // depending on the line type, we parse the rest of the line accordingly
	                switch(LINETYPE){
	                    case "REGULAR":
	                        // KEY | TAG GOTO | SCRIPT | TEXTDATA
	                        ds_grid_set(global.textgrid,0,MAPLINE, KEY);
	                        TEXT = string_delete(CURRENTLINE,1,LINEPOSITION);
	                        LINEPOSITION = 1; // reset    

	                        var TAG = "";
	                        var SCRIPT = "";
                        
	                        while string_char_at(TEXT,LINEPOSITION) != " "{
	                            TAG = TAG + string_char_at(TEXT,LINEPOSITION);
	                            LINEPOSITION += 1;  
	                        }
	                        ds_grid_set(global.textgrid,1,MAPLINE,TAG);
	                        //show_message("TAG: [" + string(TAG)+"]");
	                        LINEPOSITION += 1;
	                        while string_char_at(TEXT,LINEPOSITION) != " "{
	                            SCRIPT = SCRIPT + string_char_at(TEXT,LINEPOSITION);
	                            LINEPOSITION += 1;  
	                        } 
	                        ds_grid_set(global.textgrid,2,MAPLINE,SCRIPT);
	                        //show_message("SCRIPT: [" + string(SCRIPT)+"]");
	                        var TEXTDATA = string_delete(TEXT,1,LINEPOSITION);
	                        ds_grid_set(global.textgrid,3,MAPLINE,TEXTDATA);
	                        //show_message("TEXTDATA: [" + string(TEXTDATA)+"]");

	                        break;
                        
	                    case "KEYWORD": // DONE, EASY.
                    
	                        // KEY | 0 | 0 | TEXTDATA
                    
	                        TEXT = string_delete(CURRENTLINE,1,LINEPOSITION);  
                        
                        
	                        ds_grid_set(global.textgrid,0,MAPLINE, KEY);
	                        ds_grid_set(global.textgrid,3,MAPLINE,TEXT);
                        
	                        show_debug_message(string(ds_grid_get(global.textgrid,0,MAPLINE)));
                        
	                        //ds_grid_add(global.textgrid,0, MAPLINE, KEY);
	                        //ds_grid_add(global.textgrid, 3, MAPLINE, TEXT);
                    
	                        break;
                        
	                    case "CHOICESET": // Done!
	                        // KEY | CHOICE1 | CHOICE 2 | CHOICE 3 | etc
	                        ds_grid_set(global.textgrid,0,MAPLINE, KEY);
	                        TEXT = string_delete(CURRENTLINE,1,LINEPOSITION);
	                        LINEPOSITION = 1; // reset  
	                        //show_message(string_length(TEXT));
	                        //show_message(TEXT);
                        
	                        var c = 0;
	                        var CHOICENUM = 0;
	                        var CHOICE = "";
                        
	                        while LINEPOSITION < string_length(TEXT){
                        
	                            if string_char_at(TEXT,LINEPOSITION) != " "{
	                                CHOICE = CHOICE + string_char_at(TEXT,LINEPOSITION);
	                            }
	                            else { // we've hit a delimiter space, add the choice to the grid.
	                                ds_grid_set(global.textgrid, CHOICENUM+1,MAPLINE,CHOICE);
	                                //show_message(CHOICE);
	                                CHOICE = "";
	                                CHOICENUM +=1;
	                            }
                        
	                            LINEPOSITION++;
	                        }
                    
	                        break;
                        
	                    case "CHOICELINE": // done!
	                        // KEY | TAG GOTO | SCRIPT | TEXTDATA
	                        ds_grid_set(global.textgrid,0,MAPLINE, KEY);
	                        TEXT = string_delete(CURRENTLINE,1,LINEPOSITION);
	                        LINEPOSITION = 1; // reset  
	                        var TAG = "";
	                        var SCRIPT = "";
                        
	                        while string_char_at(TEXT,LINEPOSITION) != " "{
	                            TAG = TAG + string_char_at(TEXT,LINEPOSITION);
	                            LINEPOSITION += 1;  
	                        }
	                        ds_grid_set(global.textgrid,1,MAPLINE,TAG);
	                        //show_message("TAG: [" + string(TAG)+"]");
	                        LINEPOSITION += 1;
	                        while string_char_at(TEXT,LINEPOSITION) != " "{
	                            SCRIPT = SCRIPT + string_char_at(TEXT,LINEPOSITION);
	                            LINEPOSITION += 1;  
	                        } 
	                        ds_grid_set(global.textgrid,2,MAPLINE,SCRIPT);
	                        //show_message("SCRIPT: [" + string(SCRIPT)+"]");
	                        var CHOICETEXT = string_delete(TEXT,1,LINEPOSITION);
	                        ds_grid_set(global.textgrid,3,MAPLINE,CHOICETEXT);
	                        //show_message("CHOICETEXT: [" + string(CHOICETEXT)+"]");
                
	                        break;                       
                        
	                }
	                MAPLINE += 1; // only update this after parsing to both grid and map!
                
                
                
	                //scr_add_line(KEY,TEXT);
            
	            }
	        }
	        file_text_readln(f); // now skip to next line
        
	    }
	    file_text_close(f);
	}
	else { // user has deleted the text files or something.
	    show_message("Error: "+TEXTFILE+" is missing. The game will now exit.");
	    game_end();
	}


}
