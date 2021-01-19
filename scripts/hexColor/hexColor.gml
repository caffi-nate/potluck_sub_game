///convert_color_endianness(val)
function hexColor() {
	//Converts a color from RGB to the little endian BGR and vice versa
	var rgb = argument[0],
	    bgr = 0,   //Output
	    bsh = $10; //Number of bits to shift

	bgr = (rgb & $FF) << bsh;      //Blue
	bgr += (rgb & $FF00);          //Green
	bgr += (rgb & $FF0000) >> bsh; //Red

	return bgr;

	exit;




	var COLOURSTRING = argument0;
	//show_message(COLOURSTRING);
	if string_length(COLOURSTRING)!= 6{
	
		return 0;
	}


	show_message(string_length(COLOURSTRING));

	var RED = string_copy(COLOURSTRING,4,2);
	var GREEN = string_copy(COLOURSTRING,2,2);
	var BLUE = string_copy(COLOURSTRING,0,2);

	var COLOUR = make_colour_rgb(RED,GREEN,BLUE);

	show_message(COLOUR);

	return COLOUR;


	exit;


	//var COLOUR = string($) + RED + GREEN + BLUE;

	//show_message(COLOUR);

	//return COLOUR;


}
