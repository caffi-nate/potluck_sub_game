function scr_input_check_anybutton() {


	// bad! change this later for this game specficially


	if scr_input_check_pressed("up") ||
	scr_input_check_pressed("down") ||
	scr_input_check_pressed("left") ||
	scr_input_check_pressed("right") ||
	//scr_input_check_pressed("jump") ||
	//scr_input_check_pressed("roll") ||
	scr_input_check_pressed("RT") ||
	scr_input_check_pressed("face1") ||
	keyboard_check_pressed(vk_anykey) {

	    return true;

	}

	else return false;




}
