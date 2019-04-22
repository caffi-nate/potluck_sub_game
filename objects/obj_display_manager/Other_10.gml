/// adjust zoom amount (called from pause menu)



zoom++;
  
  if(zoom>max_zoom)
    zoom=1;
  
  window_set_size(ideal_width*zoom,ideal_height*zoom);			// OFF FOR NOW
  surface_resize(application_surface,ideal_width,ideal_height); // OFF FOR NOW
  
  
  
  
  //surface_resize(application_surface,ideal_width * zoom,ideal_height * zoom);  
  // switch to second option to allow subpixels
  display_set_gui_size(ideal_width,ideal_height);				// OFF FOR NOW
  //display_set_gui
  
  //display_reset(0,global.vSyncVar);							// OFF FOR NOW
  display_reset_ext(global.AA_level,global.vSyncVar);
  alarm[0]=1;

