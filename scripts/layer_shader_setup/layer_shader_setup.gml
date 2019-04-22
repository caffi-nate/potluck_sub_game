// create global uniforms
//global.LAYERSHADER_COLOUR = shader_get_uniform(shd_colour,"newColour");

global.SHD_SINEVAR = shader_get_uniform(shd_water, "sineVar"); 
global.SHD_RAD = shader_get_uniform(shd_water, "RADIAN");
global.SHD_WAVESIZE = shader_get_uniform(shd_water, "waveSize");
global.SHD_WIDTHVAR = shader_get_uniform(shd_water, "widthVar");

global.SHD_VIEW_WVIEW = shader_get_uniform(shd_water,"view_wview");
global.SHD_VIEW_HVIEW = shader_get_uniform(shd_water,"view_hview");
global.SHD_VIEW_XVIEW = shader_get_uniform(shd_water,"view_xview");
global.SHD_VIEW_YVIEW = shader_get_uniform(shd_water,"view_yview");

global.SHD_WATERY = shader_get_uniform(shd_water,"waterY");



// now apply to layer shader
var lay_id = layer_get_id("Tiles_1");
global.TILEMAP = layer_tilemap_get_id(lay_id);
global.tilesSurface = -1;


//layer_shader(lay_id, shd_water); // test, shd_water later
//layer_script_begin(lay_id, scr_layer_shader_uniforms);