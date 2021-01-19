function process_dialogue_code(argument0) {
	var CURRENT_CODE = argument0;
	var CODE_TYPE = string_char_at(CURRENT_CODE,1);
	var NUM = string_char_at(CURRENT_CODE,2);

	switch(CODE_TYPE){
		case "C": // colour
			switch(NUM){
				case "0": // default white
					textColour = global.COLOUR6_WHITE; //c_white;
					break;
				case "1": // pink2
					textColour = global.COLOUR7_PEACH; //global.COLOUR9; //make_colour_rgb(238,146,215); 
					break;
				case "2": // tealy green
					textColour = global.COLOUR4_GREENLIGHT //global.COLOUR21; //make_colour_rgb(0,255,168); 
					break;
				case "3": // salmon red
					textColour = global.COLOUR8_RED //global.COLOUR12;
					break;
			}
			break;
		
		case "T": // text effects
			switch(NUM){
				case "1": // jittery
					textEffects = 1;
					break;
				case "2": // wavy
					textEffects = 2;
					break;
				case "3": // irritated
					textEffects = 3;
					break;
				case "4": //irritated proper
					textEffects = 4;
					break;
				case "0":
				default:
					textEffects = 0;
					break;
			}
			break;
	}


}
