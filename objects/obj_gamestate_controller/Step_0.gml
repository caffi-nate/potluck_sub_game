global.gameTimer++;

if (keyboard_check_pressed(vk_escape)){
	game_restart_ext();
}

if (keyboard_check_pressed(vk_f1)){
	room_goto(1);
}