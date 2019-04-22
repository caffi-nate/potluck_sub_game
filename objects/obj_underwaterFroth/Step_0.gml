/// @description Insert description here
// You can write your code in this editor

with (obj_player){
	other.x = x - XSCALE * 30;
	other.dir = XSCALE;
	other.y = y + 16;
}


if (!shrinking){
	if (smokeRadius < maxRadius)
		smokeRadius = approach(smokeRadius,maxRadius,growthSpeed);
	else shrinking = true;
}
else {
	shrinkTimer++;
	
	// maybe we should just make this exponential instead...
	if (shrinkTimer < shrinkThreshold)
		smokeRadius = approach(smokeRadius,0,shrinkSpeed);
	else smokeRadius = approach(smokeRadius,0,10*shrinkSpeed);
	
	if (smokeRadius <= 0){
		instance_destroy();	
	}
}
	


