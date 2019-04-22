var XX = argument0; // x or time value
var RANGE = argument1; // amplitude to multiply by: normally Perlin noise is between 0 and 1
var CHUNKSIZE = argument2; // 16 in this case

// high amplitude low frequency: big changes but smooth interpolation
// low amplitude high frequency: small jittery changes; little interpolation between them

//var CHUNKSIZE = 16; // magic number welp
var CHUNKINDEX = XX div CHUNKSIZE; // WELP
var PROGRESS = (XX mod CHUNKSIZE) / CHUNKSIZE; // find a number between 0 and 1. what's the point of chunksize lol
var LEFT_RANDOM = randomSeed(CHUNKINDEX, RANGE);
var RIGHT_RANDOM = randomSeed(CHUNKINDEX+1, RANGE);

// now choose our interpolation algorithm
// LINEAR:
var NOISE = (1-PROGRESS) * LEFT_RANDOM + PROGRESS*RIGHT_RANDOM; 

return NOISE;