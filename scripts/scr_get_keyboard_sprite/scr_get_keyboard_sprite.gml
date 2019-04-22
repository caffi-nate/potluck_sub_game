// get the keycode and turn it into a string

var ORD = argument0;

// default sprite is the small one
var SPRITE = spr_key_small;

switch(ORD){

    case vk_up: return spr_button_up; break;// change
    case vk_down: return spr_button_down; break; // these
    case vk_left: return spr_button_left; break; // to
    case vk_right: return spr_button_right; break; // directional arrow sprites

    case vk_enter: return spr_key_big; break;
    case vk_space: return spr_key_big; break;
    case vk_shift: return spr_key_big; break;
    //case vk_control: return button_keyboard2
}


return SPRITE;
