//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	vec4 originalColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	
	vec4 newColour = originalColour;
	newColour.r = 1.0;
	
    gl_FragColor = newColour;
}
