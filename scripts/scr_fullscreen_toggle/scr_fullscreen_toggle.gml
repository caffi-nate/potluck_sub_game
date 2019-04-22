var heightVar = global.gameHeight; // 270.. no wait. 216

if (!global.fullScreen){
	window_set_fullscreen(true);
	global.fullScreen = true;
}
else { // fullScreen already true
	window_set_fullscreen(false);
	global.fullScreen = false;
}




exit;
if !global.fullScreen{
    // 1:1 width 160, height 144
    // calculate closest scaleable pixel number
    var fullHeight = display_get_height() div heightVar * heightVar;        
    var fullWidth = (fullHeight * (global.gameWidth/global.gameHeight));
        
    surface_resize(application_surface, fullWidth, fullHeight);
    //display_reset(0,global.vSyncVar);
	display_reset_ext(global.AA_level,global.vSyncVar);
    window_set_fullscreen(true);
    global.fullScreen = true;
        
} else { // fullScreen is true
    window_set_fullscreen(false);
    surface_resize(application_surface, global.gameWidth, global.gameHeight);
    //display_reset(0,global.vSyncVar);  
    display_reset_ext(global.AA_level,global.vSyncVar);
	global.fullScreen = false;
}

//show_message("fullscreen toggle");