event_inherited();

switch(state){
	case anglerStates.swim: 
		x += swimmingDirection * hSpeed;
		move_wrap(true, false, 256);


		var FREQUENCY = 3;
		var AMP = 0.12;
		XSCALE = 1 - abs(cos((global.gameTimer + id) * RADIAN * FREQUENCY) * AMP);
		//vSpeed = sin((global.gameTimer + (id mod 8)*2) * RADIAN * animFrequency) * AMPLITUDE

		y = ystart + vSpeed;

		// now for animation tilt
		AMPLITUDE = 5;
		tiltAngle = cos((global.gameTimer + id) * RADIAN * FREQUENCY) * AMPLITUDE;

	
		break;
	case anglerStates.scared:
	
	
		break;
}



