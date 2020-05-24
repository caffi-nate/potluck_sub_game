// initialise
mouse_lastX = window_view_mouse_get_x(0);
mouse_lastY = window_view_mouse_get_y(0);
alarm[1] = 1;


inputs = ds_list_create();
defaultKeys = ds_map_create();
defaultGamepadInputs = ds_map_create();
show_debug_message("created input manager for player");


// set up default controls
// gp_lstick(dir) are macro constants, based on messhof's inputdog

scr_add_input("up", vk_up, gp_lstick_up);
scr_add_input("down",vk_down, gp_lstick_down);
scr_add_input("left", vk_left, gp_lstick_left);
scr_add_input("right", vk_right, gp_lstick_right);


//scr_add_input("up", vk_up, gp_padu);
//scr_add_input("down",vk_down, gp_padd);
//scr_add_input("left", vk_left, gp_padl);
//scr_add_input("right", vk_right, gp_padr);


//scr_add_input("LT", ord("S"), gp_shoulderlb);
scr_add_input("RT", ord("C"), gp_shoulderrb);
scr_add_input("face1", ord("X"), gp_face1);
//scr_add_input("face2", ord("C"), gp_face2);


directInput = 0; // xbox

//controllerType = 1; // xbox controller




// create new data structures to copy controls to
customKeys = ds_map_create();
customGamepadInputs = ds_map_create();
scr_load_default_keyboard_mapping();
scr_load_default_gamepad_mapping();



// whether the controller uses a joystick to aim or a list of 4 buttons


// load custom controls from file. make this later.
scr_load_custom_controls(); 

// check gamepads are connected once every 2 seconds to avoid slowdown
//event_perform(ev_alarm,0);

// inputsDown is a map used to check the state of each button. think of it as key_check
inputsDown = ds_map_create();
var i;
for (i=0; i<ds_list_size(inputs); i++) {
    var INPUT = ds_list_find_value(inputs,i);
    ds_map_add(inputsDown,INPUT,0);

}

// last frame will be used to asses check_pressed and check_released
inputsDownLastFrame = ds_map_create();
ds_map_copy(inputsDownLastFrame,inputsDown);

analogDeadzone = 0.25; // big enough to be an input for movement
analogDownDeadzone = 0.5; // big enough to be a key press


leftStatus = -1;

// check later
gamepadSlot = -1;

event_perform(ev_alarm,0);// find gamepads again i guess?

cursorPos = 0;
state = 1; // show inputs
//controllerSlot = -1;

GAMEPAD_BUTTON = 1;
GAMEPAD_LASTFRAME = -1;