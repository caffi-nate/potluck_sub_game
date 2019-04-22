if (file_exists(CUSTOM_CONTROLS_FILE)){
	show_message("Hello");
    var f = file_text_open_read(CUSTOM_CONTROLS_FILE);
    
    ds_map_read(customKeys,file_text_read_string(f));
    file_text_readln(f);
    
    //file_text_write_string(f, ds_map_write(customGamepadInputs));
    
    ds_map_read(customGamepadInputs,file_text_read_string(f));
    file_text_readln(f);
    directInput = real(file_text_read_string(f));
    
    //file_text_writeln(f);
    //file_text_write_string(f, string(directInput));
	
	//file_text_write_string(f, string(controllerCrosshairType));
	//file_text_write_string(f, string(mouseHand));
	file_text_readln(f);
	controllerCrosshairType = string(file_text_read_string(f));
	file_text_readln(f);
	mouseHand = string(file_text_read_string(f));
	
    
    file_text_close(f);
	
	show_debug_message("loaded custom controls");
}
