///Display Properties
//exit;

global.fullScreen = false;

ideal_width=0;

zoom=1; // default?
max_zoom=1;



ideal_height = global.gameHeight;
ideal_width = global.gameWidth;

aspect_ratio=display_get_width()/display_get_height();

//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;
  
view_w = ideal_width;
view_h = ideal_height;
 
 
    
//Calculate Max Zoom based on screen dimensions. Subtract 1 so that it doesnt take up whole screen
max_zoom=floor(display_get_width()/ideal_width);
max_zoom = min(max_zoom, floor(display_get_height() / ideal_height));

//zoom = clamp(max_zoom,1,3); // scale up to the 2ndbiggest window for the user as a default.  
  
//zoom = clamp(zoom,1,max_zoom);
// scale to second largest zoom size
//zoom = clamp(max_zoom-1,1,max_zoom);
//zoom = clamp(1,1,max_zoom);

// nvm lets go with largest
zoom = clamp(max_zoom,1,max_zoom);


//zoom = clamp(max_zoom,1,max_zoom); // nah just go for max

display_set_gui_size(ideal_width,ideal_height);
window_set_size(ideal_width*zoom,ideal_height*zoom);
surface_resize(application_surface,ideal_width,ideal_height); 
//surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
alarm[0]=1; //Sorry.  This line got left out of the tutorial vid.  This will center the window after the initial resizing.
//display_reset(0,global.vSyncVar);
display_reset_ext(global.AA_level,global.vSyncVar);


// create camera

camera = camera_create();

// test
//lookatMatrix = matrix_build_lookat(0,0,-10,0,0,0,0,1,0);
//projectionMatrix = matrix_build_projection_ortho(global.gameWidth,global.gameHeight,1,3200);
//projectionMatrix = matrix_build_projection_perspective(global.gameWidth,global.gameHeight,1,3200);
//target = obj_player;
//diestCameraTiltVar = 0;



//globalvar view_x,view_y,view_w,view_h;
view_x = 0; // was 0
view_y = 0; // was 0






screenShakeAmount = 0;
trauma = 0; // can go up to 100
// trauma (between 0 and 1)
// any time something bad happens, add a certain amount of trauma (0.1 for small hits, 0.5 for really bad etc)
// trauma constantly decreases at a linear rate
// camera shake is trauma^2 or trauma^3
//view_camera[0] = noone;


// draw average fps


num_seconds = 1;
steps_passed = 0;
average_fps = 0;
fps_array_size = room_speed * num_seconds;
fps_array[fps_array_size] = 0;
for(i=0;i<fps_array_size;i++){
     fps_array[i] = 0;
}










