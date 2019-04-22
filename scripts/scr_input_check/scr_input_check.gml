//input_check(input)

var INPUT = argument[0];
var INPUT_MANAGER = obj_controls_handler;


// check through list of inputs for buttons that are held down
if (ds_map_find_value(INPUT_MANAGER.inputsDown, INPUT) > INPUT_MANAGER.analogDownDeadzone)
    return true;

// else    
return false;
