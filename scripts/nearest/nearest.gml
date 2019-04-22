///nearest(theValue,choice1,choice2);

var INPUT_VALUE = argument0;
var CHOICE1 = argument1;
var CHOICE2 = argument2;

if abs(INPUT_VALUE - CHOICE1) < abs(INPUT_VALUE - CHOICE2)
	return CHOICE1;
else return CHOICE2;