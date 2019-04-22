//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float surfacePosition;
uniform float sineMovement;

void main()
{	
	vec4 originalColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 uv = v_vTexcoord;
	vec4 newColour = originalColour;
	
	
	float gameHeight = 360.0;
	float gameWidth = 480.0;
	float strokeWidth = 1.0;
	
	//float XX = uv.x * gameWidth * (gameHeight/gameWidth);
	//float XX = uv.x * gameHeight * (gameHeight/gameWidth);
	//float XX = uv.x * gameHeight;// * (gameWidth/gameHeight);
	float XX = uv.x * gameWidth; //* gameHeight;
	float YY = uv.y * gameHeight;
	
	if (uv.y < surfacePosition){
		//newColour.r = 1.0;
		
		float alphaAmount = 8.0;
		newColour.a = clamp(newColour.a - (surfacePosition- uv.y), 0.0, 1.0);
		
		float threshold = 1.0;
		if (mod(XX,2.0) <= threshold){
			uv.x -= (surfacePosition - uv.y);
		}
		else {
			uv.x += (surfacePosition - uv.y);
		}
		
		float sineDistance = 16.0;
		float X2 = mod(uv.x,8.0);
		uv.x += (sin((sineMovement+X2) * 5.0 ) * sineDistance / gameWidth);
		
		
		// float upwards a bit, split the lines up
		uv.y -= (mod(YY,2.0) + 0.3)*(surfacePosition-uv.y);
		
		//uv.y += 0.02;
		
	}
	
	uv.x = clamp(uv.x,0.0,1.0);
	uv.y = clamp(uv.y,0.0,1.0);
	
	
	newColour = v_vColour * texture2D( gm_BaseTexture, uv);
	newColour.a = clamp(newColour.a - (surfacePosition - uv.y), 0.0, 1.0);
	if (newColour.a <= 0.75) newColour.a = 0.0;
	
	//gl_FragColor = newColour * texture2D( gm_BaseTexture, uv);
	
    gl_FragColor = newColour;
}
