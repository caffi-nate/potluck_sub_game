/// @description scr_find_gamepads()
/// @function scr_find_gamepads
function scr_find_gamepads() {
	var gp_num = gamepad_get_device_count();

	for (var i = 0; i < gp_num; i++){
	    if gamepad_is_connected(i){
	        gamepadSlot = i;
        
	    }

	}



	/*
	if(gamepadSlot != -1)
	{
	    if(!gamepad_is_connected(gamepadSlot))
	    {
	        gamepadSlot = -1;
	        show_debug_message("gamepad disconnected");
	    }
	}
	else
	{
	    gamepadSlot = 1;
	    if(gamepadSlot != -1)
	        show_debug_message("found gamepad");
	}

	*/



}
