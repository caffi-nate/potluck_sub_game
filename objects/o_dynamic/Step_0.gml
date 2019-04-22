//depth = 100;




//if physics_test_overlap(x,y,0,obj_ball){
	//show_message("overlap!");	
//}


with (obj_player){
	//other.phy_speed_x = (x-10*hSpeed) - other.x;
	//other.phy_speed_y = (y+64) - other.y;
	other.phy_speed_x = (x - other.x);
	other.phy_speed_y = (y+64 - other.y);
	if (state = states.hurt) other.clawClosed = false;
	
	
	
	if scr_input_check("RT") && state != states.endgame{
		other.clawClosed = true;	

	}
	else{
		other.clawClosed = false;
	}
}

if (clawClosed){
	sprite_index = spr_clawClosed;
}
else {
	sprite_index = spr_claw;	
}

exit;

var movementSpeed = 2;

if (keyboard_check_pressed(vk_left)){
	//x-= movementSpeed;	
	physics_apply_force(x,y,-30,0);
	//physics_apply_impulse(x,y,-30,0);
}
else if (keyboard_check_pressed(vk_right)){
	//x+= movementSpeed;	
	physics_apply_force(x,y,30,0);
	//physics_apply_impulse(x,y,30,0);
}