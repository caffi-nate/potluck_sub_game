function dialogue_exit_find_gold() {
	global.canDive = true;

	var CURRENT_OBJECTIVE = obj_treasure

	with (obj_dialogue_hitbox)
		currentObjective = CURRENT_OBJECTIVE;
	
	var DESIRED = instance_create_depth(obj_boat.x - 32, 220, 0, obj_desiredObject);

	with (DESIRED){
		desiredSprite = object_get_sprite(CURRENT_OBJECTIVE);
	}


}
