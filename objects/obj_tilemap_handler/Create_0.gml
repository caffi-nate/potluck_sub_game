var lay_id = layer_get_id("Tiles_1");
TILEMAP = layer_tilemap_get_id(lay_id);

var lay2_id = layer_get_id("Tiles_2");
TILEMAP2 = layer_tilemap_get_id(lay2_id);

var lay3_id = layer_get_id("Tiles_3");
TILEMAP3 = layer_tilemap_get_id(lay3_id);


tileMapSurface = -1;




/// water shader start here


//uniform float waterX; // y
//uniform float waterY; // y
//uniform float waterWidth; // y
//uniform float waterHeight; // y
SINEVAR = shader_get_uniform(shd_water, "sineVar"); 
RAD = shader_get_uniform(shd_water, "RADIAN");
WAVESIZE = shader_get_uniform(shd_water, "waveSize");
WIDTHVAR = shader_get_uniform(shd_water, "widthVar");

VIEW_WVIEW = shader_get_uniform(shd_water,"view_wview");
VIEW_HVIEW = shader_get_uniform(shd_water,"view_hview");
VIEW_XVIEW = shader_get_uniform(shd_water,"view_xview");
VIEW_YVIEW = shader_get_uniform(shd_water,"view_yview");

WATERX = shader_get_uniform(shd_water,"waterX");
WATERY = shader_get_uniform(shd_water,"waterY");
WATERWIDTH = shader_get_uniform(shd_water,"water_width");
WATERHEIGHT = shader_get_uniform(shd_water,"water_height");


waveSize = 0.002//0.001; // test was 0.003
sineVar = 0.0;
widthVar = 0.002//0.002; // was 0.004


//// sine wave movement variables:
//uniform float sineVar;
//uniform float RADIAN;
//uniform float waveSize; // y
//uniform float widthVar; // y


//uniform float view_wview;
//uniform float view_hview;
//uniform float view_xview;
//uniform float view_yview;


