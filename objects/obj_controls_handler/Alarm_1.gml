// check whether player is using a mouse or keyboard. only do this every few frames for performance
scr_find_controlType();

if (controlType == "keyboard") global.controlMode = 1;
else global.controlMode = 2; // controller


alarm[1] = 8;