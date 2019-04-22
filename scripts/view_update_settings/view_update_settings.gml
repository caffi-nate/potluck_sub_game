
	zoom = wrap(zoom,1,max_zoom);  
  display_set_gui_size(ideal_width,ideal_height);
  window_set_size(ideal_width*zoom,ideal_height*zoom);
  //surface_resize(application_surface,ideal_width * zoom,ideal_height * zoom); // was * zoom
  surface_resize(application_surface,ideal_width, ideal_height);
  //display_reset(0,global.vSyncVar);
  display_reset_ext(global.AA_level,global.vSyncVar);
  alarm[0]=1;
  
  global.zoom = zoom;