function set_story_flags() {
	global.canDive = false;
	global.plugPulled = false;

	if (global.skipStory){
		global.canDive = true;	
	
	}


}
