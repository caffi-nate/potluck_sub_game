/// @description approach(start,end,shift)
/// @function approach
/// @param start
/// @param end
/// @param shift
function approach(argument0, argument1, argument2) {

	// courtesy Matt Thorsen, Grandma Engine
	// shifts one value towards another by a specfic amount eg acceleration, friction etc


	if (argument0 < argument1)
	    return min (argument0 + argument2, argument1);
	else 
	    return max (argument0 - argument2, argument1);



}
