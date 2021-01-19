function string_replace_variables(argument0) {
	var INPUTSTRING = argument0;
	var NUM_VARIABLES = string_count("$",INPUTSTRING);

	repeat (NUM_VARIABLES){
		var VARIABLE_STRING = "";
		for (i = 0; i < string_length(INPUTSTRING); i++){
			if (string_char_at(INPUTSTRING,i) == "$"){
				// we've found a variable. now iterate over it to catch the whole thing
				while (string_char_at(INPUTSTRING,i) != " ")
						&& (string_char_at(INPUTSTRING,i) != ",")
						&& (string_char_at(INPUTSTRING,i) != ".")
						&& (string_char_at(INPUTSTRING,i) != "!")
						&& (string_char_at(INPUTSTRING,i) != "?"){
					VARIABLE_STRING = VARIABLE_STRING + string_char_at(INPUTSTRING,i);
					i++;
				}
				var NEW_VARIABLE = string(lookup_variable_table(VARIABLE_STRING));
				var NEW_STRING = string_replace(INPUTSTRING,VARIABLE_STRING,NEW_VARIABLE);
				break;
			}	
		}
		INPUTSTRING = NEW_STRING;
	}

	return INPUTSTRING;


}
