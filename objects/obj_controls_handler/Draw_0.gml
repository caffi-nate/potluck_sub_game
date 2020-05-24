//if scr_input_check_pressed(

/// @description Insert description here
// You can write your code in this editor

//scr_last_gamepad_button(gamepadSlot);

//var CHECK_CROSSHAIRSTICK = scr_input_check("crossHairLeft");

//draw_text(300,20,CHECK_CROSSHAIRSTICK);





//exit;
//draw_text(20,80,gamepadSlot);
if (gamepadSlot != -1){
	gamepad_set_axis_deadzone(gamepadSlot, analogDeadzone);
	//draw_text(20,100,string(gamepad_axis_value(gamepadSlot,gp_axislh)));
	//draw_text(20,120,string(gamepad_axis_value(gamepadSlot,gp_axislv)));
	//draw_text(20,140,string(gamepad_axis_value(gamepadSlot,gp_axisrh)));
	//draw_text(20,160,string(gamepad_axis_value(gamepadSlot,gp_axisrv)));
}


