if !instance_place(x, y + sign(vSpeed), obj_brick){
	return false;	
}
return true;




exit;

var VSPEEDNEW = floor(abs(vSpeed)); 
repeat(VSPEEDNEW){
	if !instance_place(x, y + sign(vSpeed), obj_brick){
		y += sign(vSpeed);
	}
	else {
		vSpeed = 0;
		break;
	}
}