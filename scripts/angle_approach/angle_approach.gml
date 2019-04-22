/// @param current_angle
/// @param target_angle
/// @param amount

var current_angle = argument0;
var target_angle = argument1;
var amount = argument2;


// sanitize the angle just incase
current_angle = (current_angle + 360) mod 360;
target_angle = (target_angle + 360) mod 360;


// wrap around 0
if ((current_angle - target_angle) > 180){
	target_angle += 360;
}
if ((current_angle - target_angle) < -180){
	target_angle -= 360;	
}


if current_angle > target_angle {
	return max(current_angle-amount,target_angle);
	}
else if current_angle < target_angle {
	return min(current_angle+amount,target_angle)
	}
else {return target_angle};

