global.waterLevel = y;

playerInWater = instance_place(x,y,obj_player);
playerInWaterLastFrame = playerInWater;

waterVar = 0; // ?
waterTimer = 0; // this controls how much the water waves around


bubbleCreationTimer = 300;

//dyliquid_init(100, 0.025, 0.025, 0.35, 1, 3.5, x, y, x+sprite_width, y+sprite_height);
//dyliquid_init(100, 0.025, 0.025, 0.35, 0, 3.5, x, y, x+sprite_width, y+sprite_height);

var QUALITY = 25//50; // was 100


// quality, tension, dampening, spread, wave, speed

//dyliquid_init(QUALITY, 0.025, 0.025, 0.35, 1.4, 3.5, x, y, x+sprite_width, y+sprite_height);

dyliquid_init(QUALITY, 0.01, 0.01, 0.05, 2, 3.5, x, y, x+sprite_width, y+sprite_height);


col[0] = make_colour_rgb(52, 152, 219);
col[1] = make_colour_rgb(41, 128, 185);


// used for surface texture
image_speed = 0.1;
IMAGE_INDEX = 0;
IMAGE_NUMBER = sprite_get_number(spr_testWater2);

waterSurface = -1;
SURFACE_OFFSET_Y = 100;


//depth = 
//var water_draw_object = instance_create(x,y,obj_water_drawing);

/// shader stuff

move=10;
//texture_set_repeat(false);
draw_set_color(c_white);


BM1 = 8;
BM2 = 4;



instance_create_depth(0,0,global.instance_depth,obj_lightShaftSurface);