if(keyboard_check_pressed(ord("G"))){
    current_pal++;
	show_debug_message(current_pal);
}
if(keyboard_check_pressed(ord("H"))){
    current_pal--;
	show_debug_message(current_pal);
}




with (obj_player){
	
	
	
	
	// ignore and play by our own rules if we're not underwater already
	if (y > 400){
		if (other.current_pal >= other.darknessThreshold && y > 1000) other.DEEPSEA = true;	else other.DEEPSEA = false;	
		if (y < 600){
			other.current_pal = 3; // default
			if (global.plugPulled) other.current_pal = 4;
		}
		else if (y < 1400) other.current_pal = 4;
		else if (y < 3400) other.current_pal = 5; // music starts here
		else other.current_pal = 6;
		//else if (y < 3000) other.current_pal = 7; // might be too dark
	}
	else DEEPSEA = false; // keep the red light for the ending
	
	if (global.plugPulled){
		other.DEEPSEA = true;
		//other.spotlight_palette_index = 5;	
	}
}



// hack: leaving a 1px buffer in front of the first palette prevents us from getting flickering.
//if (current_pal < 1) current_pal = 1;
current_pal = clamp(current_pal,1,pal_swap_get_pal_count(my_pal_sprite));

//current_pal=wrap(current_pal,0,pal_swap_get_pal_count(my_pal_sprite)-1);
//image_speed=.1 * delta_time * (60/1000000);
//image_speed = 0; // ????
