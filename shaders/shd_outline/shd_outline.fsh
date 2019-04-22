


//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float surfaceWidth;
uniform float surfaceHeight;
uniform vec4 outlineColor;

uniform float strokeWidth;

void main()
{
    vec4 originalColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 newColour = originalColour;
	

	//newColour.b = 1.0;
    
    //float strokeWidth = 1.0;
	
    float SURFWIDTH = surfaceWidth; //512.0;
    float SURFHEIGHT = surfaceHeight; //288.0;
    
    float alpha = newColour.a;
    vec2 offsetx;
    offsetx.x = 1.0 / SURFWIDTH; // global gameWidth
    vec2 offsety;
    offsety.y = 1.0 / SURFHEIGHT; // global gameHeight
    float OW = strokeWidth; // outline width
    //float OW = 1.0;
	
	
	// set the colour of the outline
	if (alpha < 0.5){
		//newColour.b = 0.145;
		//newColour.g = 1.0;
		//newColour.r = 1.0;
		
		newColour.rgb = outlineColor.rgb;
		//newColour.r = 0.0;
		//newColour.g = 0.0;
		//newColour.b = 0.0;
	}
	
    
    alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offsetx * OW).a); // right
    alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - offsetx * OW).a); // left
    alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offsety * OW).a); // below
    alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - offsety * OW).a); // above
    //alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + (offsety+offsetx) * OW).a); // right
    //alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - (offsety-offsetx) * OW).a); // left
    //alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + (offsety-offsetx) * OW).a); // below
    //alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - (offsety+offsetx) * OW).a); // above
    
	
	
    
    newColour.a = alpha;

    gl_FragColor = newColour;
}

