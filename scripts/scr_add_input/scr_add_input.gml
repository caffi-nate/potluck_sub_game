function scr_add_input(argument0, argument1, argument2) {
	//scr_add_input(input_as_string, default keycode as ord, default gamepad input as a constant)
	// gamepad inputs need to be constants so that buttons can be mapped to them

	var INPUT = argument0;
	var DEFAULT_KEYCODE = argument1;
	var DEFAULT_GAMEPAD_INPUT = argument2;

	ds_list_add(inputs, INPUT);
	//if (DEFAULT_KEYCODE != 10000) // -1 means we're using this input as a gamepad-only option
	ds_map_add(defaultKeys, INPUT, DEFAULT_KEYCODE);
	ds_map_add(defaultGamepadInputs, INPUT, DEFAULT_GAMEPAD_INPUT);



}
