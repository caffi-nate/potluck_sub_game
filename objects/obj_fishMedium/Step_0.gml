event_inherited();

switch(state){
	case fishStates.swim: 
		x += swimmingDirection * hSpeed;
		move_wrap(true, false, 256);

		var AMPLITUDE = 30;

		vSpeed = sin((global.gameTimer + id) * RADIAN * animFrequency) * AMPLITUDE

		y = ystart + vSpeed;

		// now for animation tilt
		AMPLITUDE = 30;
		tiltAngle = cos((global.gameTimer + id) * RADIAN * animFrequency) * AMPLITUDE;

	
		break;
	case fishStates.scared:
	
	
		break;
}



