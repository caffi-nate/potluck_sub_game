var TEXTFILE = argument0;

show_debug_message(TEXTFILE);

if file_exists(TEXTFILE){
    var f = file_text_open_read(TEXTFILE);
    
    var TEXTGRIDHEIGHT = 0;
    
    while (!file_text_eof(f)){
        if !file_text_eoln(f){
            var CURRENTLINE = file_text_read_string(f);
            var FIRSTCHAR = string_char_at(CURRENTLINE,0); 
            
            if FIRSTCHAR != "/" && FIRSTCHAR != ""{
                TEXTGRIDHEIGHT += 1;
            }  
        }
        file_text_readln(f); // skip to next line of the file
        
    }    
    
    show_debug_message("RESIZED GRID TO: "+string(global.textgridWidth)+" | "+string(TEXTGRIDHEIGHT));
    ds_grid_resize(global.textgrid,global.textgridWidth,TEXTGRIDHEIGHT);
     
    file_text_close(f);  
}
else {
    show_message("Error: Trying to resize nonexistant file " + string(TEXTFILE)+". The program will now exit.");
    game_end();
}