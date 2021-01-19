///dyliquid_init(quality, tension, dampening, spread, auto_wave_applitude, auto_wave_speed, x1, y1, x2, y2)
function dyliquid_init(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	/*
	Initializes water.  Must be called once before calling any other functions.

	argument0: The amount of columns to be used. Ideally, the bigger the area of the water the more columns
	you want to have (If area is small, it won't make a difference but it will slow down the game).
	argument1-argument3: Check scripts dyliquid_set_tension, dyliquid_set_dampening and dyliquid_set_spread.
	argument4-argument7: Bounds of water, same as draw_rectangle.
	*/

	dy_colomns_count = 0;

	dyliquid_set_bounds(argument6, argument7, argument8, argument9);
	dyliquid_set_quality(argument0, 2);
	dyliquid_set_tension(argument1);
	dyliquid_set_dampening(argument2);
	dyliquid_set_spread(argument3);
	dyliquid_set_wave(argument4);
	dyliquid_set_speed(argument5);


}
