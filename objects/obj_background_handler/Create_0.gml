/// @description Insert description here
// You can write your code in this editor
parallaxVar = 0.95;

MOUNTAINS = layer_get_id("Backgrounds_3");
SUN = layer_get_id("Assets_1");


CLOUDS_LAYER = layer_get_id("Instances_Clouds");

instance_create_layer(x,y,CLOUDS_LAYER,obj_sun);
for (i = 0; i < 3; i++){

	var CLOUD = instance_create_layer(x,y,CLOUDS_LAYER,obj_cloud);
	with (CLOUD){
		movementX = other.i * 1500;
		parallaxVar = other.parallaxVar;
		y = 180;
	}
}


sunSurface = -1;




SINEVAR = shader_get_uniform(shd_water, "sineVar"); 
RAD = shader_get_uniform(shd_water, "RADIAN");
WAVESIZE = shader_get_uniform(shd_water, "waveSize");
WIDTHVAR = shader_get_uniform(shd_water, "widthVar");

VIEW_WVIEW = shader_get_uniform(shd_water,"view_wview");
VIEW_HVIEW = shader_get_uniform(shd_water,"view_hview");
VIEW_XVIEW = shader_get_uniform(shd_water,"view_xview");
VIEW_YVIEW = shader_get_uniform(shd_water,"view_yview");

WATERX = shader_get_uniform(shd_water,"waterX");
WATERY = shader_get_uniform(shd_water,"waterY");
WATERWIDTH = shader_get_uniform(shd_water,"water_width");
WATERHEIGHT = shader_get_uniform(shd_water,"water_height");


waveSize = 0.002//0.001; // test was 0.003
sineVar = 0.0;
widthVar = 0.002//0.002; // was 0.004
