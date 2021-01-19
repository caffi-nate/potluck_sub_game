function x_collision() {
	if !instance_place(x + sign(hSpeed), y, obj_brick){
		return false;	
	}
	return true;



	exit;

	var HSPEEDNEW = floor(abs(hSpeed));



	repeat(HSPEEDNEW){
		if !instance_place(x + sign(hSpeed), y, obj_brick){
			x += sign(hSpeed);
		}
		else {
			hSpeed = 0;
			show_message(hSpeed);
			break;
		}
	}





}
