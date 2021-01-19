///dyliquid_set_dampening(dampening)
function dyliquid_set_dampening(argument0) {

	/*
	Sets the dampening of the springs. This value controls the speed in which the springs
	return back to their original location.
	*/

	dy_dampening = clamp(argument0, 0.0001, 0.5);


}
