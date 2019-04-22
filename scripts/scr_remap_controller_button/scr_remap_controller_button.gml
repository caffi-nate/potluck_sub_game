    GAMEPAD_LASTFRAME = GAMEPAD_BUTTON;
    GAMEPAD_BUTTON = scr_get_gamepad_input_down(gamepadSlot, directInput);

    // trying to make equivalent of keyboard_check_pressed(anykey)
    if (GAMEPAD_BUTTON != -1) && GAMEPAD_BUTTON != GAMEPAD_LASTFRAME && GAMEPAD_LASTFRAME == -1 {
    
          
    
        var tempButton = ds_map_find_first(customGamepadInputs);
        for (i=0; i < ds_map_size(customGamepadInputs); i++){
        
            // does this value already exist in button list? if so, swap it
            if ds_map_find_value(customGamepadInputs, tempButton) == GAMEPAD_BUTTON {
                
                var value = ds_map_find_value(customGamepadInputs,current);
                
                ds_map_replace(customGamepadInputs,tempButton,value);           
                
            
            }       
            tempButton = ds_map_find_next(customGamepadInputs,tempButton); 
        }    
    
    
    
        // replace after checks are made
        ds_map_replace(customGamepadInputs,current,GAMEPAD_BUTTON);
        
        //GAMEPAD_LASTFRAME = -1;
        //GAMEPAD_BUTTON = -1;
        state = 1;
    }
    
    
//}

//awaitingInput = true;


// done, revert state
//state = 1;


