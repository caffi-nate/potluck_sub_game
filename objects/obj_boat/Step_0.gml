	// bob along with the waves
	with obj_water_body{
	    var col_y = dyliquid_get_y(other.x)
	    other.y = col_y;
	}
	
	
	
if (global.plugPulled){
	// create a new shipwreck and delete this
	with (obj_dialogue_hitbox) instance_destroy();
	instance_destroy();

}