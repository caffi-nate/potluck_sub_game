instance_create_depth(0,0,global.instance_depth+1,obj_display_manager);

instance_create_depth(0,0,0,obj_gmlive);

set_story_flags(); // reset for new players
room_goto_next();