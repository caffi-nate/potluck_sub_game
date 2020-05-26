/// @description Insert description here
// You can write your code in this editor


// update to follow the camera

if (live_call()) return live_result;


//
//layer_x(MOUNTAINS, parallaxVar * view_xview + 32);
layer_x(MOUNTAINS, 1 * view_xview );
//layer_y(MOUNTAINS, (view_yview ));//+ 128));
layer_y(MOUNTAINS, (view_yview ));




layer_x(SUN, view_xview);
layer_y(SUN, view_yview);



//layer_y(CLOUDS_LAYER,view_yview);


with (obj_cloud){
	y = view_yview + 164;
}
//y = floor(parallaxVar * (view_yview));


with (obj_sun){
	y = view_yview + 64;// + 164;
	x = view_xview + 0.5*view_wview-32;
	global.sun_x = x;
	global.sun_y = y;
}