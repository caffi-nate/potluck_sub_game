/// @description Insert description here
// You can write your code in this editor




// cheap hack: try to make them pop ASAP when they get close to the surface
if (y < global.waterLevel + 24) {
	shrinking = true;
	shrinkTimer = shrinkThreshold;
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

y -= floatSpeed;
x = xstart + sin(RADIAN * (current_time + id) * FREQUENCY) * AMPLITUDE;


