var STRING = argument0;

// step 1: replace non ansi quotes
var RETURNSTRING = string_replace_all(STRING,chr(147),"\"");
RETURNSTRING = string_replace_all(RETURNSTRING,chr(148),"\"");

// step 2: replace quotes entirely
RETURNSTRING = string_replace_all(RETURNSTRING,"\"","");

// step 3: replace single quotes
RETURNSTRING = string_replace_all(RETURNSTRING,chr(145),"'");
RETURNSTRING = string_replace_all(RETURNSTRING,chr(146),"'");

// step 4: replace ellipsis
RETURNSTRING = string_replace_all(RETURNSTRING,chr(133),"...");

// step 3: replace all bars with 10 to pause for longer
RETURNSTRING = string_replace_all(RETURNSTRING,"|","||||||||||||||||||||");

// add these to the start else we'll get weirdness
RETURNSTRING = "[T0][C0]"+RETURNSTRING; 

RETURNSTRING = string_replace_variables(RETURNSTRING);


// double space if necessary
RETURNSTRING = string_replace_all(RETURNSTRING, " ", "  ");


return RETURNSTRING;