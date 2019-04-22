/// @description Insert description here
// You can write your code in this editor

// reset view stuff, not sure if this is necessary
//view_camera[0] = noone; // DON'T DO THIS: creates a memory leak? maybe because already done in room end
view_enabled = false;
view_visible[0] = false;

camera_destroy(camera);


//event_perform(ev_room_end,0);

//show_debug_message("camera destroyed");


// delete arrays, freeing up memory
fps_array = 0;
