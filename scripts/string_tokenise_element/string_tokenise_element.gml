var BIGSTRING = argument0;
var SUBSTRING_NUM = argument1; // which substring do we want to pull from the big string?
var TOKEN = " "; // later we can import a different token, like a comma or period.

var RETURN_STRING = "";
var TOKEN_COUNT = 0;
var INDEX = 1;
var LENGTH = string_length(BIGSTRING);


while (INDEX < LENGTH){
	if (string_char_at(BIGSTRING,INDEX) == TOKEN){
		TOKEN_COUNT++;	
	}
	else if (TOKEN_COUNT == SUBSTRING_NUM){
		RETURN_STRING = RETURN_STRING + string_char_at(BIGSTRING,INDEX);	
	}
	
	
	INDEX++;
}


return RETURN_STRING;

