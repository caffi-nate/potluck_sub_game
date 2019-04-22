var CHARACTER = argument0;
var IS_SPECIAL_CHARACTER = false;

if (CHARACTER == "[") ||
	(CHARACTER == "]") ||
	(CHARACTER == "|") ||
	(CHARACTER == "#"){
	IS_SPECIAL_CHARACTER = true;
}

return IS_SPECIAL_CHARACTER;