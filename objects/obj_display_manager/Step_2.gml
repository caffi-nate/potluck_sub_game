///Zoom window
if keyboard_check_pressed(vk_add){
	zoom++;
	view_update_settings();
}
else if keyboard_check_pressed(vk_subtract){
	zoom--;
	view_update_settings();
}

if (keyboard_check_pressed(vk_f4)){
	scr_fullscreen_toggle();
}


// move the backgrounds according to player position
//scr_parallax_control();

var TRAUMA_TICKSPEED = 2;
var TRAUMA_TIME = 100;

trauma = clamp(trauma,0,TRAUMA_TIME); // only shake for a second

trauma = approach(trauma,0,TRAUMA_TICKSPEED);

if (global.screenShake)
	screenShakeAmount = (power(trauma,2) * 0.0015);
else screenShakeAmount = 0;
//screenShakeAmount = approach(screenShakeAmount,0,screenShakeShift);


camera_follow();

camera_set_view_size(view_camera[0],view_w,view_h);
camera_set_view_pos(view_camera[0], view_x, view_y);


global.zoom = zoom;

//camera_set_view_size(view_camera[0],view_wview,view_hview);
//camera_set_view_pos(view_camera[0], view_xview, view_yview);