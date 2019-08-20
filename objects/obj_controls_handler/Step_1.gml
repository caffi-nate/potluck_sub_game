

///update inputs
ds_map_copy(inputsDownLastFrame, inputsDown);


for (i=0; i<ds_list_size(inputs); i++){

    var INPUT = ds_list_find_value(inputs,i);
    
    // keyboard input
    //show_message(string(INPUT));
    if (INPUT == "shoot") || (INPUT == "start"){
        ds_map_replace(inputsDown, INPUT, mouse_check_button(ds_map_find_value(customKeys, INPUT)));
    }
    else {
        //show_message(string(ds_map_find_value(customKeys, INPUT))); // test
		//if (INPUT != "crossHairLeft" && INPUT != "crossHairRight" && INPUT != "crossHairDown" && INPUT != "crossHairUp")
        
		
		switch(os_type){
			default:
			case os_windows:
				ds_map_replace(inputsDown, INPUT, keyboard_check_direct(ds_map_find_value(customKeys, INPUT)));
			
			break;
			
			case os_macosx:
			ds_map_replace(inputsDown, INPUT, keyboard_check(ds_map_find_value(customKeys, INPUT)));
			
			break;
			
		}
		
		
    }
    // note: macs need a script to check here if using them instead
    
    
    
    // gamepad input
    /*if valid {    
        lets jUST STick WITH KEYBOARDs for now lol
    } */
    
    /*
    if gamepadSlot == -1 {
        gamepadSlot = scr_find_joysticks();
    }
    */
    

    
    
    
    // use whichever value is true out of controller or gamepad
    //
    
    
    
    if gamepadSlot != -1 {
        //var directInput = 0; // test value
        var MAX = max(scr_input_check(INPUT), scr_check_gamepad_input(gamepadSlot, ds_map_find_value(customGamepadInputs,INPUT),directInput));
        ds_map_replace(inputsDown, INPUT, MAX);
    }

}

/* */
/*  */


if (keyboard_check(vk_escape)){
	// do this last after all other input stuff to avoid crashes
    game_restart_ext();
}

