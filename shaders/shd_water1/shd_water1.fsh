//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float waterX; // y
uniform float waterY; // y
uniform float waterWidth; // y
uniform float waterHeight; // y

// sine wave movement variables:
uniform float sineVar;
uniform float RADIAN;
uniform float waveSize; // y
uniform float widthVar; // y

uniform float view_wview;
uniform float view_hview;
uniform float view_xview;
uniform float view_yview;

void main()
{
    vec4 originalColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 newColour = originalColour;
    vec2 uv = v_vTexcoord;
    
    float YY = waterY / 512.0; // divide by room height
    float XX = waterX / 5000.0; // divide by room width
    float X2 = (waterWidth) / 5000.0;
    float Y2 = (waterHeight) / 512.0;
    
    
    // updated test:
    XX = ((waterX-view_xview)/view_wview); // gives water X1 on the view instead of room width    
    X2 = ((waterWidth-view_xview)/view_wview) ; // gives water X2 on the view instead of room width
    YY = ((waterY - view_yview)/view_hview);
    Y2 = ((waterHeight-view_yview)/view_hview);
    
    
    // if within the bounds of water object
    if ((uv.y > YY) && (uv.x > XX) && (uv.y < Y2) && (uv.x < X2)){
        // update coordinates for fun.
        //uv.x = uv.x + 0.02;
        
        
        
        // adjust these by calculating how far away they are from the water boundaries            
        float WIDTHVAR = floor(uv.y * 512.0);
        //uv.x = uv.x + waveSize * (sin((sineVar + WIDTHVAR) * widthVar)) * distance_topbottom;
        
        
        // was 720 and 1280, now 512 and 5000
        
        

        
        
        float HEIGHTVAR = floor(uv.x * 512.0); // times height of the room
        //uv.y = uv.y + waveSize * (cos((sineVar + HEIGHTVAR) * widthVar)) * distance_from_side;
        
        
        // old test
        //uv.x = uv.x + waveSize * (sin((sineVar+WIDTHVAR) * (widthVar*62.5)      ));
        //uv.y = uv.y + waveSize * (cos((sineVar+HEIGHTVAR) * (widthVar * 6.4)  ));
        
        float proximity_to_edge = 1.0;
        
        
        // 16-11-16 test 01
        float CONSTANT = 5.0;        
        float HV = ((uv.x * view_wview) + view_xview) * CONSTANT;
        float WV = ((uv.y * view_hview) + view_yview) * CONSTANT;
        
        
        // depends how far we are from the water top
        //float distance_from_top = clamp(   ( (WV/5.0)  -YY) / ((32.0 / view_hview)),0.0,1.0);
        //float distance_from_bottom = clamp((Y2 - (WV/5.0)) / ((32.0/view_hview)),0.0,1.0);
        //float distance_topbottom = min(distance_from_top,distance_from_bottom);
        
        
        //float distance_from_left = clamp((uv.x - XX) / ((32.0 / view_wview)),0.0,1.0);
        //float distance_from_right = clamp((X2 - uv.x) / ((32.0/view_wview)),0.0,1.0);
        
        
        // distance from top/bottom
        float H32 = 16.0 / view_hview; // 32 height pixels in tex
        float distance_from_top = clamp( (uv.y - YY) / H32, 0.0, 1.0);
        float distance_from_bottom = clamp(  (Y2 - uv.y) / H32, 0.0, 1.0);
        float distTB = min(distance_from_top,distance_from_bottom);
        //distTB = floor((distTB * distTB)* 100.0) * 0.01; // make it even smaller the closer it is to 0
        //if (distTB < 1.0) distTB = 0.0;
        
        // distance from sides
        float W32 = 16.0 / view_wview; // 32 pixels in tex
        float distance_from_left = clamp( (uv.x - XX) / W32,    0.0,    1.0);
        float distance_from_right = clamp( (X2 - uv.x) / W32,  0.0,    1.0);
        float distSide = min(distance_from_left,distance_from_right);
        //distSide = floor((distSide*distSide) * 100.0) * 0.01; // make it even smaller the closer it is to 0
        //if (distSide < 1.0) distSide = 0.0;
        
        float WAVESIZE2 = 0.05;
        uv.x = uv.x + (waveSize * (sin((sineVar + WV) * 2.0*WAVESIZE2))) * distTB *distSide ;
        uv.y = uv.y + (waveSize * (cos((sineVar + HV) * WAVESIZE2))) * distSide * distTB ;
        
        newColour = texture2D( gm_BaseTexture,uv);
        
        
        // test to show range of sine varzz
        //newColour.b = newColour.b * min(distSide,distTB);
        //newColour.a += 0.8;
        
    }
    
    
    
    gl_FragColor = newColour;
}
