//scr_get_gamepad_string(input)

if obj_controls_handler.directInput {
    switch(argument0){
        case gp_face1: return "1"; break;
        case gp_face2: return "2"; break;
        case gp_face3: return "3"; break;
        case gp_face4: return "4"; break;
        case gp_shoulderl: return "5"; break;
        case gp_shoulderr: return "6"; break;
        case gp_select: return "9"; break;
        case gp_start: return "10"; break;
        case gp_stickl: return "7"; break;// ?
        case gp_stickr: return "8"; break; // ?
        
    

        //default: return "unknown "+string(argument0); break;
        default: return ""; break;
    }
}

else { // xbox controller
    switch(argument0)
    {
        case gp_axislh: return "gp_axislh"; break;
        case gp_axislv: return "gp_axislv"; break;
        case gp_axisrh: return "gp_axisrh"; break;
        case gp_axisrv: return "gp_axisrv"; break;
        
        case gp_face1: return "face_1"; break;
        case gp_face2: return "face_2"; break;
        case gp_face3: return "face_3"; break;
        case gp_face4: return "face_4"; break;
        case gp_padd: return "pad_d"; break;
        case gp_padl: return "pad_l"; break;
        case gp_padr: return "pad_r"; break;
        case gp_padu: return "pad_u"; break;
        case gp_shoulderl: return "l_bump"; break;
        case gp_shoulderlb: return "left trigger"; break; // was l_trig
        case gp_shoulderr: return "r_bump"; break;
        case gp_shoulderrb: return "right trigger"; break; // was r_trig
        case gp_stickl: return "joy_l"; break;
        case gp_stickr: return "joy_r"; break;
        case gp_start: return "start"; break;
        case gp_select: return "select"; break;
        
        case gp_lstick_down: return "left_joystick_down"; break;
        case gp_lstick_left: return "left_joystick_left"; break;
        case gp_lstick_right: return "left_joystick_right"; break;
        case gp_lstick_up: return "left_joystick_up"; break;
        case gp_ltrigger: return "left_trigger"; break;
        
        case gp_rstick_down: return "right_joystick_down"; break;
        case gp_rstick_left: return "right_joystick_left"; break;
        case gp_rstick_right: return "right_joystick_right"; break;
        case gp_rstick_up: return "right_joystick_up"; break;
        case gp_rtrigger: return "right_trigger"; break;
        
        default: return "unknown "+string(argument0); break;
    }
}
