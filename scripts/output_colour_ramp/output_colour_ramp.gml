/// @desc output_palette_ramp(percentageValue,colour1,colour2, colour3, [etc...])
/// @arg percentageValue
/// @arg colour1
/// @arg colour2
/// @arg colour3

/// For games with restricted or limited colour palettes, this helps with transitioning between palette colours
/// It's recommended to define your palette colours as global variables using make_colour_rgb() etc
/// Import a value between 0 and 1 and the script will choose a colour from an array depending on the value.

var CURRENT_PERCENTAGE = argument[0]; // a value between 0 and 1
var COLOUR_ARRAY;

// script requires at least 2 arguments: a percentage and one or more colours
if (argument_count <= 1){
	return 0;
	show_debug_message("Invalid colour ramp: more arguments required.");
}

// if we have enough arguments, put the colours into an array
if (argument_count > 1) {
	for (var i = 1; i < argument_count; i++){
		COLOUR_ARRAY[i] = argument[i];
	}
}

// choose a colour/argument based on the current percentage value in argument[0]
var NUM_COLOURS = argument_count-1;
var MULTIPLIER = 1 / NUM_COLOURS;
var RETURN_COLOUR = clamp((CURRENT_PERCENTAGE / MULTIPLIER) + 1,1,argument_count-1);

return COLOUR_ARRAY[RETURN_COLOUR];