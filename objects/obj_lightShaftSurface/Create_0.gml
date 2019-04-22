/// @description Insert description here
// You can write your code in this editor

lightShaftSurface = -1;
surfaceWidth = view_wview;
surfaceHeight = view_hview;

//SURFWIDTH = shader_get_uniform(shd_dither,"surfaceWidth");
//SURFHEIGHT = shader_get_uniform(shd_dither,"surfaceHeight");



dither_tex = sprite_get_texture(spr_dither_texture,0);
u_size = shader_get_uniform(shd_dither, "texSize");
shaderColour = shader_get_uniform(shd_dither,"shaderColour");
shaderTimer = shader_get_uniform(shd_dither,"shaderTimer");
u_dither_tex = shader_get_sampler_index(shd_dither, "ditherTex");