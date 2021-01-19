function object_activation() {
	var PLAYER_Y = obj_player.y;


	var VIEW_HEIGHT = view_hview;

	// water surface
	// don't run this every frame...




	if (PLAYER_Y > global.waterLevel + VIEW_HEIGHT){
		instance_deactivate_object(obj_water_body);	
	}
	else if (PLAYER_Y < global.waterLevel + VIEW_HEIGHT){
		instance_activate_object(obj_water_body);
	}



	// background management
	var SKY_BACKGROUND = layer_get_id("Backgrounds_2");
	var SKY_THRESHOLD = 520;
	if (PLAYER_Y > SKY_THRESHOLD){
		layer_set_visible(SKY_BACKGROUND,false);	
	}
	else if (PLAYER_Y < SKY_THRESHOLD){
		layer_set_visible(SKY_BACKGROUND,true);	
	}

	var MOUNTAINS = layer_background_get_id("Backgrounds_3");	
	if (PLAYER_Y > SKY_THRESHOLD){
		layer_background_visible(MOUNTAINS, false);
	}
	else {
		layer_background_visible(MOUNTAINS, true);
	}	



}
