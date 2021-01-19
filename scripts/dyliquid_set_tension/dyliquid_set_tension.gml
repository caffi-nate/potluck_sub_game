///dyliquid_set_tension(tension)
function dyliquid_set_tension(argument0) {

	/*
	Sets the stiffness of the springs (variable k in Hooke’s Law).

	A low value will make the springs loose and more flexible (A force will cause bigger waves that oscillate  slowly).
	A high value will increase the tension of the springs (A force will cause smaller waves that oscillate quickly).
	*/

	dy_tension = clamp(argument0, 0.00005, 2);


}
