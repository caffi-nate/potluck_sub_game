/// @description  check for joysticks and gamepads every 2 seconds

if directInput {
    scr_find_joysticks();
} else {
    scr_find_gamepads();
}


// are we using controller or gamepad

//if keyboard_check_pressed(vk_anykey)




/*
if gamepadSlot == -1 {
    //scr_find_gamepads();
    if gamepadSlot == -1 {
        gamepadSlot = scr_find_joysticks();
    }
}
*/

alarm[0] = room_speed*2; // 60, 2 seconds

/* */
/*  */
