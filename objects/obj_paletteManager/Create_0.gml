pal_swap_init_system(shd_pal_swapper);


lightingSurface = -1;


appSurfaceCopy = -1;


current_pal = 3; // i think?
spotlight_palette_index = 9; // which palette should be used for the lights at night



darknessThreshold = 5; //5 // above this, we turn on the lights
my_pal_sprite = spr_palette_test;

drawingPalette = false;

//alarm[0] = 3;

//show_message(pal_swap_get_pal_count(my_pal_sprite));



godraySurface = -1;
surface_light_palette = 2; // godrays


DEEPSEA = false;


// try again for gradual lighting change
surfaceWidth = view_wview;
surfaceHeight = view_hview;
dither_tex = sprite_get_texture(spr_dither_texture,0);
u_size = shader_get_uniform(shd_dither, "texSize");
shaderColour = shader_get_uniform(shd_dither,"shaderColour");
shaderTimer = shader_get_uniform(shd_dither,"shaderTimer");
u_dither_tex = shader_get_sampler_index(shd_dither, "ditherTex");