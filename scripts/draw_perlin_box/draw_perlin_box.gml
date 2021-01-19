function draw_perlin_box() {
	// TODO / NOTE: This is really unoptimised and bad for performance! Needs fixing!
	var X1 = argument[0];
	var Y1 = argument[1];
	var X2 = argument[2];
	var Y2 = argument[3];
	var X3 = argument[4];
	var Y3 = argument[5]
	var X4 = argument[6]
	var Y4 = argument[7]
	var TIME = argument[8];

	var DISTANCE = 4;
	if (argument_count > 9) DISTANCE = argument[9];

	var SMOOTHING_LEVEL = 6;
	//var RANDOM = getPerlinNoise(TIME,DISTANCE,SMOOTHING_LEVEL);

	X1 -= 0.5*DISTANCE + getPerlinNoise(TIME,DISTANCE,SMOOTHING_LEVEL);;
	X2 -= 0.5*DISTANCE + getPerlinNoise(TIME+100,DISTANCE,SMOOTHING_LEVEL);
	Y1 -= 0.5*DISTANCE + getPerlinNoise(TIME+200,DISTANCE,SMOOTHING_LEVEL);;
	Y2 -= 0.5*DISTANCE + getPerlinNoise(TIME+300,DISTANCE,SMOOTHING_LEVEL);
	X3 -= 0.5*DISTANCE + getPerlinNoise(TIME+400,DISTANCE,SMOOTHING_LEVEL);;
	X4 -= 0.5*DISTANCE + getPerlinNoise(TIME+500,DISTANCE,SMOOTHING_LEVEL);
	Y3 -= 0.5*DISTANCE + getPerlinNoise(TIME+600,DISTANCE,SMOOTHING_LEVEL);;
	Y4 -= 0.5*DISTANCE + getPerlinNoise(TIME+700,DISTANCE,SMOOTHING_LEVEL);

	draw_primitive_begin(pr_trianglestrip);
		draw_vertex(X1,Y1);
		draw_vertex(X2,Y2);
		draw_vertex(X3,Y3);
		draw_vertex(X4,Y4);
	draw_primitive_end();





}
