event_inherited();

hSpeed = 0.6 + random_range(-0.1,0.1);
vSpeed = 0;
swimmingDirection = -1;

tiltAngle = 0;
AMPLITUDE = 1;


animFrequency = 2;


enum anglerStates{
	swim,
	scared
}

state = anglerStates.swim;


anglerX = x + swimmingDirection * 8;


XSCALE = 1;