// clean up then restart


for (i=0; i < instance_count; i++){
	var INSTANCE = instance_id_get(i);
	with INSTANCE{		
		instance_destroy();	
	}
}
show_debug_message("Instance Count: " + string(instance_count));


//room_goto(setup);
game_restart();