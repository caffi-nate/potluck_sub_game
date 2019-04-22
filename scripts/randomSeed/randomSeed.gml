var SEED = argument0;
var RANGE = argument1;

SEED += global.perlinSeed; // add a large number so that it takes a while for the randomness to repeat itself

random_set_seed(SEED);
var RANDOM_NUM = irandom_range(0,RANGE);

return RANDOM_NUM;