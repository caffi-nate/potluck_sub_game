// get the keycode and turn it into a string

var ORD = argument0;
var CHR = chr(ORD);

switch(ORD){

	case mb_left: return "mouse left"; break;
	case mb_middle: return "mouse middle"; break;
	case mb_right: return "mouse right"; break;

    case vk_enter: return "enter"; break;
    case vk_space: return "space"; break;
    case vk_shift: return "shift"; break;
	//case vk_lshift: return "left shift"; break;
	case vk_lcontrol: return "left control"; break;

	//case vk_rshift: return "right shift"; break;
	case vk_rcontrol: return "right control"; break;

	
	//case vk_control: return "control"; break;
	
	case vk_backspace: return "backspace"; break;
	case vk_tab: return "tab"; break;

	case vk_end: return "end"; break;
	case vk_delete: return "delete"; break;
	case vk_insert: return "insert"; break;
	case vk_pageup: return "page up"; break;
	case vk_pagedown: return "page down"; break;
	case vk_numpad0: return "numpad 0"; break;
	case vk_numpad1: return "numpad 1"; break;
	case vk_numpad2: return "numpad 2"; break;
	case vk_numpad3: return "numpad 3"; break;
	case vk_numpad4: return "numpad 4"; break;
	case vk_numpad5: return "numpad 5"; break;
	case vk_numpad6: return "numpad 6"; break;
	case vk_numpad7: return "numpad 7"; break;
	case vk_numpad8: return "numpad 8"; break;
	case vk_numpad9: return "numpad 9"; break;
	case vk_multiply: return "numpad *"; break;
	case vk_divide: return "numpad /"; break;
	case vk_add: return "numpad +"; break;
	case vk_subtract: return "numpad -"; break;
	case vk_decimal: return "."; break;
	

    case vk_left: return ""; break; // don't print anything
    case vk_right: return ""; break; // the buttons already show the direction
    case vk_up: return ""; break;
    case vk_down: return ""; break; 
	
	
	// restricted keys:
	case vk_ralt: return "right alt"; break;
	case vk_lalt: return "left alt"; break;
	
	
	case vk_home: return "home RESTRICTED"; break;
	case vk_escape: return "escape RESTRICTED"; break;
	case vk_alt: return "alt"; break;
	// caps lock

	// extras, dependent on keyboard though...
	case 186: return ";"; break;
	case 188: return "<"; break;
	case 190: return ">"; break;
	case 191: return "/"; break;
	case 222: return "'"; break;
	case 219: return "["; break;
	case 221: return "]"; break;
	case 189: return "-"; break;
	case 187: return "="; break;
	case 192: return "`"; break;
	case 220: return "\\"; break;

}






//show_debug_message("GET KEYBOARD CHAR:");
//show_debug_message(ORD);
//show_debug_message(CHR);


return CHR;
