global.gameTimer++;

if (keyboard_check_pressed(vk_escape)){
	game_restart_ext();
}

if (keyboard_check_pressed(vk_f1)){
	room_goto(1);
}

if (!window_has_focus()){
	if (windowFocused)
		audio_pause_all();
		instance_deactivate_all(true);
		instance_activate_object(obj_controls_handler);
		physics_pause_enable(true);
	windowFocused = false;

}
else {
	if (!windowFocused){
			audio_resume_all();
			instance_activate_all();
			physics_pause_enable(false);
	}
	windowFocused = true;
}
