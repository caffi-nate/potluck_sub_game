// TODO: This is wildly unoptimised! 
//Only used to replace random_range() when seed is being manipulated with perlin functions
var MIN = argument0;
var MAX = argument1;
var TIME = get_timer();

var RESULT = MIN + getPerlinNoise(TIME,abs(MAX-MIN),6);

return RESULT;