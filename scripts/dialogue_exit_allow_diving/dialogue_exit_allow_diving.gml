function dialogue_exit_allow_diving() {
	global.canDive = true;

	with (obj_dialogue_hitbox)
		currentObjective = obj_glasses;
	
	instance_create_depth(obj_boat.x - 32, 220, 0, obj_desiredObject);


}
