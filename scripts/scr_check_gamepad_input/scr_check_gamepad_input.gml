/// @description inputdog_check_gamepad_input(slot, input, directInput)
/// @function inputdog_check_gamepad_input
/// @param slot
/// @param  input
/// @param  directInput
var SLOT = argument0;
var INPUT = argument1;
var DIRECT_INPUT = argument2;
var VAL = 0;

if(DIRECT_INPUT)
    switch(INPUT)
    {   
        case gp_lstick_left:  VAL = clamp(-joystick_xpos(SLOT),0,1); break;
        case gp_lstick_right: VAL = clamp( joystick_xpos(SLOT),0,1); break;
        case gp_lstick_up:    VAL = clamp(-joystick_ypos(SLOT),0,1); break;
        case gp_lstick_down:  VAL = clamp( joystick_ypos(SLOT),0,1); break;

        case gp_face1:         if(joystick_check_button(SLOT,1)) VAL = 1; break;
        case gp_face2:         if(joystick_check_button(SLOT,2)) VAL = 1; break;
        case gp_face3:         if(joystick_check_button(SLOT,3)) VAL = 1; break;
        case gp_face4:         if(joystick_check_button(SLOT,4)) VAL = 1; break;


        case gp_shoulderlb:    if(joystick_check_button(SLOT,5)) VAL = 1; break;
        case gp_shoulderrb:    if(joystick_check_button(SLOT,6)) VAL = 1; break;
        
        case gp_ltrigger:      if(joystick_check_button(SLOT,7)) VAL = 1; break;
        case gp_rtrigger:      if(joystick_check_button(SLOT,8)) VAL = 1; break;
        
        case gp_select:        if(joystick_check_button(SLOT,9)) VAL = 1; break;
        case gp_start:         if(joystick_check_button(SLOT,10)) VAL = 1; break;
        
    }
else
    switch(INPUT)
    {   
        case gp_lstick_left:  VAL = clamp(-gamepad_axis_value(SLOT,gp_axislh),0,1); break;
        case gp_lstick_right: VAL = clamp( gamepad_axis_value(SLOT,gp_axislh),0,1); break;
        case gp_lstick_up:    VAL = clamp(-gamepad_axis_value(SLOT,gp_axislv),0,1); break;
        case gp_lstick_down:  VAL = clamp( gamepad_axis_value(SLOT,gp_axislv),0,1); break;
        
        case gp_rstick_left:  VAL = clamp(-gamepad_axis_value(SLOT,gp_axisrh),0,1); break;
        case gp_rstick_right: VAL = clamp( gamepad_axis_value(SLOT,gp_axisrh),0,1); break;
        case gp_rstick_up:    VAL = clamp(-gamepad_axis_value(SLOT,gp_axisrv),0,1); break;
        case gp_rstick_down:  VAL = clamp( gamepad_axis_value(SLOT,gp_axisrv),0,1); break;
        
        default:                 if(gamepad_button_check(SLOT,INPUT))               VAL = 1; break;
    }

var INPUT_MANAGER = obj_controls_handler;
if(VAL < INPUT_MANAGER.analogDeadzone)
    VAL = 0;
    
return VAL;
