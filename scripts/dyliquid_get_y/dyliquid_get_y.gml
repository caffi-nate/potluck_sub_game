///dyliquid_get_y(x)
function dyliquid_get_y(argument0) {

	/*
	Returns y position of water at given x point or noone if x is outside of bounds
	*/

	//show_debug_message("dyliquid_get_y("+string(argument0)+")");

	if (argument0 > dy_x[0] and argument0 < dy_x[1]) {
	  return(dy_column[(floor((argument0-dy_x[0])/dy_column_width))*3+1]);
	} 
	else if (argument0 <= dy_x[0]){
		//show_error("out of bounds: left", 0);
		//return(dy_column[(floor(dy_x[0]/dy_column_width))*3+1
		// shouldn't happen
		return(dy_column[0]);
	}
	else {
		// shouldn't happen
		return(dy_column[1]);
		//show_error("out of bounds: right", 0);	
	}
	//else {
	//  show_error("x in dyliquid_get_y(x) is outside of bounds of liquid rectangle!", 0);
	//}


}
