function select_portrait(argument0) {
	var PORTRAIT_STRING = argument0;
	var NEW_PORTRAIT_SPRITE = -1;

	switch(PORTRAIT_STRING){
		case "BONGO":
			NEW_PORTRAIT_SPRITE = spr_portraitBongo;
			break;	
		case "COWBELLIE":
			NEW_PORTRAIT_SPRITE = spr_portraitCowbellie;
			break;
		case "none":
		default:
			break;
	}	
			
	return NEW_PORTRAIT_SPRITE;


}
