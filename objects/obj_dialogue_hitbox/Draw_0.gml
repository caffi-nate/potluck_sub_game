/// @description Insert description here
// You can write your code in this editor
//don't draw

if (global.debugMode){
	draw_self();
}


if instance_place(x,y,obj_player) && !instance_exists(obj_dialogueManager){
	
	
	// show a marker above this spot asking for input
	if !instance_exists(obj_dialogue_start_marker){
		instance_create_depth(x,y-64,0,obj_dialogue_start_marker);	
	}
	
	if scr_input_check("face1") {
		//show_message("dialogue!");
		
		
		var ITEM_MATCH = false;
		var HOLDING = obj_player.heldItem;
		if (HOLDING != noone){
			var HELD_OBJECT = (HOLDING.object_index);
			//show_message(HELD_OBJECT);
			//show_message(currentObjective);
			
			if (HELD_OBJECT == currentObjective){
				ITEM_MATCH = true;//show_message("match!");
				var DUMMY = instance_create_depth(HOLDING.x,HOLDING.y, 0,obj_dummy_handin);
				with DUMMY {
					sprite_index = HOLDING.sprite_index;	
				}
				with (HOLDING) instance_destroy();
				with (obj_desiredObject) instance_destroy();
				with (obj_player) heldItem = noone;
			}
			//if (object_get_name(HOLDING.object_index) == currentObjective) show_message("match!");
		}
		//show_message(object_get_name(obj_player.heldItem.object_index));
		
		text = instance_create_depth(0,0,0,obj_dialogueManager);
		with text {
			//label = 	
			//var CURRENT = obj_gamestate_controller.currentDialogue;
			//dialogueStartLabel = scr_load_dialogue(CURRENT);
			scr_load_dialogue(ITEM_MATCH);
			//dialogueStartLabel = scr_load_dialogue(0);
		

			// todo: another script that handles the event processed after the dialogue
		
		}
	}
}
else {
	if instance_exists(obj_dialogue_start_marker){
		with (obj_dialogue_start_marker) destroy = true;
	}	
}