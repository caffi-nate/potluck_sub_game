///x = argument0
///y = argument1


var BUBBLE = instance_create_depth(argument0,argument1,200,obj_bubbleTrail);




with (BUBBLE){
	var BASEFLOATSPEED = 2;
	floatSpeed = BASEFLOATSPEED + random_range(-0.1*BASEFLOATSPEED,0.1*BASEFLOATSPEED); // floatSpeed = 0.5 
	shrinkThreshold = 60;
}



//maxRadius = 4 + random_range(-1,1);
//shrinking = false;

exit;
growthSpeed = 1;
shrinkSpeed = 0.01;
shrinkTimer = 0;
shrinkThreshold = 30; // was 30




FREQUENCY = 0.2 + random_range(-0.05,0.05);
AMPLITUDE = 5 + random_range(-1,1);