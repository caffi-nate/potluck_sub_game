function scr_find_controlType() {
	/*
	if (point_distance(window_view_mouse_get_x(0),window_view_mouse_get_y(0),mouse_lastX,mouse_lastY) >= 1){
		controlType = "keyboard";
		show_message("hello");
	}
	mouse_lastX = window_view_mouse_get_x(0); // mouse_x
	mouse_lastY = window_view_mouse_get_y(0); //mouse_y;
	*/
	// gives weird problems either way

	if (keyboard_check(vk_anykey) || mouse_check_button(mb_left)){
		//controlType = "keyboard";	
		global.controlMode = controlModes.mouseKeyboard
	}

	var gamepadPressed = false;
	for (i = 0; i < gamepad_button_count(gamepadSlot); i++){
		if (gamepad_button_check(gamepadSlot,i)){
			gamepadPressed = true;
			break;
		}
		for (j = 0; j < gamepad_axis_count(gamepadSlot); j++){
			if (abs(gamepad_axis_value(gamepadSlot,j)) > 0){
				gamepadPressed = true;
				break;
			}
		}
	}
	if (gamepadPressed) global.controlMode = controlModes.controller;//controlType = "controller";


}
