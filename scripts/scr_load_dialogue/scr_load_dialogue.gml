function scr_load_dialogue(argument0) {
	//var DIALOGUE_NUM = argument0;
	var ITEM_MATCH = argument0;

	var LABEL = -1;
	switch(global.currentDialogue){
		default:
		case 0: // intro first line: setup
			//LABEL = "intro";
			dialogueStartLabel = "intro";
			exitScript = dialogue_exit_allow_diving;
			global.currentDialogue = 1;
			break;	
		case 1:
			//LABEL = "preBoss1";
			dialogueStartLabel = "retrieveGlasses1";
			global.currentDialogue = 2;
			if (ITEM_MATCH){ dialogueStartLabel = "foundGlasses"; exitScript = dialogue_exit_find_amulet; global.currentDialogue = 3; break; }
			break;
		case 2:
			dialogueStartLabel = "retrieveGlasses2";
			if (ITEM_MATCH){ dialogueStartLabel = "foundGlasses"; exitScript = dialogue_exit_find_amulet; global.currentDialogue = 3; break; }
			break;	
		case 3:
			dialogueStartLabel = "findAmulet";
			//exitScript = dialogue_exit_find_amulet;
			if (ITEM_MATCH){ dialogueStartLabel = "foundAmulet"; exitScript = dialogue_exit_find_gold; global.currentDialogue = 4; break; }
			break;
		
		
		case 4:
			dialogueStartLabel = "getMeGold";
			if (ITEM_MATCH) {dialogueStartLabel = "foundGold"; exitScript = dialogue_exit_find_gold; global.currentDialogue = 4; break; }
			break;
		
	}


	return LABEL;




}
