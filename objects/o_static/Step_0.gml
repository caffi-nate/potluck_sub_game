//var movementSpeed = 2;

//if (keyboard_check(vk_left)){
//	x-= movementSpeed;	
//	//physics_apply_force(x,y,-30,0);
//	//physics_apply_impulse(x,y,-30,0);
//}
//else if (keyboard_check(vk_right)){
//	x+= movementSpeed;	
//	//physics_apply_force(x,y,30,0);
//	//physics_apply_impulse(x,y,30,0);
//}



// this is bad but oh well? lol
//phy_position_x = obj_player.x;
//phy_position_y = obj_player.y;


phy_speed_x = obj_player.x - x;
phy_speed_y = obj_player.y - y;