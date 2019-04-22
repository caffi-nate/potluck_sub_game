/// @description Insert description here
// You can write your code in this editor

bubbleTrailSurface = -1;
surfaceWidth = view_wview;
surfaceHeight = view_hview;

SURFWIDTH = shader_get_uniform(shd_outline,"surfaceWidth");
SURFHEIGHT = shader_get_uniform(shd_outline,"surfaceHeight");
OUTLINECOLOR = shader_get_uniform(shd_outline,"outlineColor");
STROKEWIDTH = shader_get_uniform(shd_outline,"strokeWidth");