sonarTimer = 0;
playerSightRadius = sonarTimer;
alphaValue = 0;
alphaStepSpeed = 0.05;
sonarLife = 90;

sonarSurface = -1;

scr_play_sound(sfx_sonar03,1,0.4,false,-4);




surfaceWidth = view_wview;
surfaceHeight = view_hview;

dither_tex = sprite_get_texture(spr_dither_texture,0);
u_size = shader_get_uniform(shd_dither, "texSize");
shaderColour = shader_get_uniform(shd_dither,"shaderColour");
shaderTimer = shader_get_uniform(shd_dither,"shaderTimer");
u_dither_tex = shader_get_sampler_index(shd_dither, "ditherTex");