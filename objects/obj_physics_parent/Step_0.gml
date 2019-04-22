
var GRAB = true;

//if mouse_check_button(mb_left) {

if position_meeting(o_dynamic.x,o_dynamic.y,id){
	outlined = true;
	if (scr_input_check("RT") && obj_player.state != states.endgame){
		//if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id){
		if (scr_input_check_pressed("RT")) {
			sel_force = true;	
			global.dragging = true;	
			phy_linear_damping = 10;
			with (obj_player) holding = other.id;//object_get_name(other.object_index);
		}
	}
	else {
		sel_force = false;
		global.dragging = false;
		phy_linear_damping = 2;
		GRAB = false;
		//with (obj_player) holding = -4;
	}
} else outlined = false;

if (sel_force){
	//physics_apply_force(x,y,(mouse_x-x) * 0.5, (mouse_y - y) * 0.5);
	//physics_apply_force(x,y,(mouse_x-x) * 5, (mouse_y - y) * 5);	
	
	with (o_dynamic){
		other.phy_speed_x = (x - other.x);
		other.phy_speed_y = (y + 20 - other.y);
		// distance threshold if we're running up against a rock
		if (point_distance(x,y, other.x, other.y) > 32){
			other.sel_force = false;
			GRAB = false;	
		}
	}
	if (obj_player.state = states.hurt){
		sel_force = false;
		GRAB = false;
	}
}


if (!GRAB){
	obj_player.holding = -4;
}


//if mouse_check_button(mb_right){
//	sel_impulse = true;	
//}
//else sel_impulse = false;

//if (mouse_check_button_released(mb_right)){
//	physics_apply_impulse(x,y,(x-mouse_x)*0.5, (y-mouse_y)*0.5);
//}