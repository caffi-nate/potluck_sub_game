function scr_layer_shader_uniforms() {
	//shader_set_uniform_color(global.LAYERSHADER_COLOUR, c_red, 1);


	if !surface_exists(global.tilesSurface){
		global.tilesSurface = surface_create(view_wview,view_hview);
	}


	draw_surface(global.tilesSurface, 0, 0);



	exit;
	if instance_exists(obj_display_manager){
		with (obj_display_manager){
			//show_debug_message(sineVar);
		
			shader_set_uniform_f(global.SHD_WATERY,128.0); // was global.waterLevel

			shader_set_uniform_f(global.SHD_VIEW_WVIEW,view_wview);
			shader_set_uniform_f(global.SHD_VIEW_HVIEW,view_hview);
			shader_set_uniform_f(global.SHD_VIEW_XVIEW,view_xview);
			shader_set_uniform_f(global.SHD_VIEW_YVIEW,view_yview);

			shader_set_uniform_f(global.SHD_SINEVAR,sineVar);
			shader_set_uniform_f(global.SHD_RAD,RAD);
			shader_set_uniform_f(global.SHD_WAVESIZE,waveSize);
			shader_set_uniform_f(global.SHD_WIDTHVAR,widthVar);
		}
	}


}
