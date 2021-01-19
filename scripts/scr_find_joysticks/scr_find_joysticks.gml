function scr_find_joysticks() {
	    var j;
	    for (j = 1; j <= 2; j++){ // 2 is the max for gamemaker
	        if joystick_exists(j){
	            //show_message(string(j));
	            gamepadSlot = j;
	            //show_message(string(j));
	            return 1;
	            //show_message("joystick found!");
	            var numButtons = joystick_buttons(1);
	            if numButtons >= 10 { //is valid
                
	                // select active controller
	                var i;
	                for (i = 0; i < numButtons; i++) {
	                    if (joystick_check_button(j,i)){
	                        //jName = joystick_name(j)
                        
	                        show_message(string(j));
						
	                        return j;
						
						
	                    }
                    
	                }    
	            }
            
	        }
	    }
    
	// if no joysticks are found
	gamepadSlot = -1;
	//return -1;



}
