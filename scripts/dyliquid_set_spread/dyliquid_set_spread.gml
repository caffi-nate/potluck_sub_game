///dyliquid_set_spread(spread)
function dyliquid_set_spread(argument0) {

	/*
	Sets the factor of the amount of force that will be spread to nearby springs (How fast the waves spread)
	A very low value will cause the spring being hit to take most of the force, 
	as opposed to a higher value which will distribute the force.
	*/

	dy_spread = clamp(argument0, 0.07, 0.6);


}
