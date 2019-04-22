//exit;
//if (view_camera[0] != camera)
//if (view_camera[0] == -1){		// check first or we'll get a memory leak!
	view_camera[0] = camera;
	show_debug_message("camera assigned");
//}
//else {
//	show_debug_message("CAMERA: " + string(view_camera[0]));	
//}
view_enabled = true;
view_visible[0] = true;



// start looking right
view_x = 104;
view_y = 64; // regular surface value
// camera shift to look ahead depending on player's direction
adjusted_camera_X = 72;





instance_create_depth(0,0,0,obj_background_handler);




alarm[5] = 15;

if (room == 2)
	instance_create_depth(0,0,global.instance_depth+1,obj_tilemap_handler);
