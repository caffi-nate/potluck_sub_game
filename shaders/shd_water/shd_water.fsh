//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float waterY; // y

// sine wave movement variables:
uniform float sineVar;
uniform float RADIAN;
uniform float waveSize; // y
uniform float widthVar; // y

uniform float view_wview;
uniform float view_hview;
uniform float view_xview;
uniform float view_yview;


// TODO: fix for pixel perfect!

void main()
{
    vec4 originalColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 newColour = originalColour;
    vec2 uv = v_vTexcoord;
    
	
	
	float YY = ((waterY - view_yview)/view_hview);
    
	
    
    // if within the bounds of water object, continue
    if (uv.y > YY){
        // 16-11-16 test 01
        float CONSTANT = 5.0;        
        float HV = ((uv.x * view_wview) + view_xview) * CONSTANT;
        float WV = ((uv.y * view_hview) + view_yview) * CONSTANT;
        
        
        float WAVESIZE2 = 0.05;
		//WAVESIZE2 = waveSize;
		// clamp doesnt do anything. cheap hack: just give a single coloured border for one tile..?
        uv.x = clamp(uv.x + (waveSize * (sin((sineVar + WV) * 2.0*WAVESIZE2))), 0.0, 1.0);
        uv.y = clamp(uv.y + (waveSize * (cos((sineVar + HV) * WAVESIZE2))), 0.0, 1.0);
        
        newColour = texture2D( gm_BaseTexture,uv);
        
		//newColour.r = 1.0;
		//newColour.a = 1.0;
	}
    
    gl_FragColor = newColour;
}
