
var GRAB = true;


//if mouse_check_button(mb_left) {
//	if !instance_exists(obj_grab_marker){
//		with (obj_player)
//			instance_create_depth(x,y -32, global.instance_depth,obj_grab_marker);
//	}
//}

//if position_meeting(o_dynamic.x,o_dynamic.y,id){
var OBJECT_IN_RANGE = instance_position(o_dynamic.x,o_dynamic.y, id);
if (OBJECT_IN_RANGE){
	outlined = true;
	
	// create a grab icon here
	var ICON = instance_exists(obj_grab_marker);
	
	if (scr_input_check("RT") && obj_player.state != states.endgame){
		//if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id){
		if (scr_input_check_pressed("RT")) {
			sel_force = true;	
			global.dragging = true;	
			phy_linear_damping = 10;
			with (obj_player) heldItem = other.id;//object_get_name(other.object_index);
		}		
		with (obj_grab_marker) destroy = true;
		ICON = true; // don't create any new ones
	}
	else {
		sel_force = false;
		global.dragging = false;
		phy_linear_damping = 2;
		GRAB = false;
		//with (obj_player) heldItem = -4;	
	}
	if (!ICON){
		with (obj_player)
			instance_create_depth(x,y -32, global.instance_depth,obj_grab_marker);
	}
	
} else { // no object in range
	if (outlined) 	with (obj_grab_marker) destroy = true;
	outlined = false;
	//ICON = false;

	//with (obj_grab_marker) destroy = true;
}

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
	obj_player.heldItem = noone;
}


//if mouse_check_button(mb_right){
//	sel_impulse = true;	
//}
//else sel_impulse = false;

//if (mouse_check_button_released(mb_right)){
//	physics_apply_impulse(x,y,(x-mouse_x)*0.5, (y-mouse_y)*0.5);
//}