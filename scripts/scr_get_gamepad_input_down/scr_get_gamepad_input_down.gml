/// @description inputdog_get_gamepad_input_down(slot, directInput)
/// @function inputdog_get_gamepad_input_down
/// @param slot
/// @param  directInput
function scr_get_gamepad_input_down(argument0, argument1) {

	var SLOT = argument0;
	var DIRECT_INPUT = argument1;
	var INPUTS = ds_list_create();
	ds_list_add(INPUTS, gp_face1);
	ds_list_add(INPUTS, gp_face2);
	ds_list_add(INPUTS, gp_face3);
	ds_list_add(INPUTS, gp_face4);
	ds_list_add(INPUTS, gp_select);
	ds_list_add(INPUTS, gp_start);
	ds_list_add(INPUTS, gp_shoulderl);
	ds_list_add(INPUTS, gp_shoulderr);
	ds_list_add(INPUTS, gp_shoulderlb);
	ds_list_add(INPUTS, gp_shoulderrb);
	ds_list_add(INPUTS, gp_stickl);
	ds_list_add(INPUTS, gp_stickr);

	ds_list_add(INPUTS, gp_lstick_up);
	ds_list_add(INPUTS, gp_lstick_down);
	ds_list_add(INPUTS, gp_lstick_left);
	ds_list_add(INPUTS, gp_lstick_right);

	ds_list_add(INPUTS, gp_rstick_up);
	ds_list_add(INPUTS, gp_rstick_down);
	ds_list_add(INPUTS, gp_rstick_left);
	ds_list_add(INPUTS, gp_rstick_right);

	ds_list_add(INPUTS, gp_ltrigger);
	ds_list_add(INPUTS, gp_rtrigger);

	ds_list_add(INPUTS, gp_padd);
	ds_list_add(INPUTS, gp_padu);
	ds_list_add(INPUTS, gp_padl);
	ds_list_add(INPUTS, gp_padr);

	var i;
	var INPUT_DOWN = -1;
    
	for(i=0; i<ds_list_size(INPUTS); i++)
	{
	    var INPUT = ds_list_find_value(INPUTS,i);
	    if(scr_check_gamepad_input(SLOT,INPUT,DIRECT_INPUT) > 0.5)
	    {
	        INPUT_DOWN = INPUT;
	        break;
	    }
	}

	ds_list_destroy(INPUTS);
	return INPUT_DOWN;



}
