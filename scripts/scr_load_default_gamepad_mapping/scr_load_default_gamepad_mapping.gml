function scr_load_default_gamepad_mapping() {
	//scr_load_default_gamepad_mapping()
	with obj_controls_handler{
		ds_map_copy(customGamepadInputs, defaultGamepadInputs);
	}


}
