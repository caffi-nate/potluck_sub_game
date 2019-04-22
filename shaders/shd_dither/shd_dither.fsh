varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texSize;
uniform sampler2D ditherTex;
uniform vec4 shaderColour;
uniform float shaderTimer;

float height = 4.0;
vec2 size = vec2(16.0, 16.0);
vec2 tSize = vec2(32.0, 64.0);

vec2 rSize = size / tSize;


void main()
{
    float band = floor(texture2D( gm_BaseTexture, v_vTexcoord ).r * 7.0);
	
	float ditherSquareSize = 1.0; // default is 2.0 
	
	//float timeOffset = shaderTimer / texSize.x; // test offset for cycling based on game time
	float timeOffset = 0.0; // failsafe for later
	
    vec2 offset = vec2(rSize.x * floor(band / height), rSize.y * mod(band, height));
	
	//vec2 texcoord = v_vTexcoord;
    vec2 texcoord = vec2( ((mod((v_vTexcoord.x * texSize.x), size.x) + timeOffset) / (tSize.x * ditherSquareSize)),
                          (mod((v_vTexcoord.y * texSize.y), size.y) / (tSize.y * ditherSquareSize)));
						  
	
	vec4 newColour = texture2D(ditherTex, texcoord + offset);
	
	newColour.rgb = shaderColour.rgb;
	
    gl_FragColor = newColour;
}
