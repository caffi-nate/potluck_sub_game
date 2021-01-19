///dyliquid_spash_column(column id, force)
function dyliquid_spash_column(argument0, argument1) {

	/*
	Splashes water at given column with given force.  
	A negative force is accepted (Looks as if something is coming out of water)
	*/

	dyliquid_spash(argument0 * dy_column_width, argument1);


}
