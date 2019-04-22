//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 player_coords;
uniform float circle_jitter;
uniform float pixel_amount;
uniform float light_amount;
uniform vec2 lantern_1;
uniform vec2 lantern_2;
uniform vec2 lantern_3;
uniform vec2 lantern_4;
uniform float x_view;
uniform float y_view;

vec3 rgb_to_hsv(vec3 col)
{
    float H = 0.0;
    float S = 0.0;
    float V = 0.0; 
    float M = max(col.r, max(col.g, col.b));
    float m = min(col.r, min(col.g, col.b));
    V = M;
    float C = M - m;
    if (C > 0.0)
    {
        if (M == col.r) H = mod( (col.g - col.b) / C, 6.0);
        if (M == col.g) H = (col.b - col.r) / C + 2.0;
        if (M == col.b) H = (col.r - col.g) / C + 4.0;
        H /= 6.0;
        S = C / V;
    }
    return vec3(H, S, V);
}
vec3 hsv_to_rgb(vec3 col)
{
    float H = col.r;
    float S = col.g;
    float V = col.b;
    float C = V * S;
    H *= 6.0;
    float X = C * (1.0 - abs( mod(H, 2.0) - 1.0 ));
    float m = V - C;
    C += m;
    X += m;
    if (H < 1.0) return vec3(C, X, m);
    if (H < 2.0) return vec3(X, C, m);
    if (H < 3.0) return vec3(m, C, X);
    if (H < 4.0) return vec3(m, X, C);
    if (H < 5.0) return vec3(X, m, C);
    else         return vec3(C, m, X);
}

void main()
{


    // gradually add to this to find out how much light we want
    float LNUM = 0.0;

    float resX = 398.0;
    float resY = 224.0;
    
    vec2 uv = v_vTexcoord;
    vec2 uv2 = v_vTexcoord;
    vec2 uv3 = v_vTexcoord;

    
    vec4 oldColour = v_vColour * texture2D( gm_BaseTexture, uv );
    
    vec4 newColour = oldColour;

    
    float centre_x = (player_coords.x/resX) * (resX/resY);
    float centre_y = player_coords.y/resY;
    
    
    
    // not this easy: need the room width/height maybe? idk
    uv.x *= resX/resY;
    
    //float dist = distance(uv, vec2(centre_x,centre_y)); // old
    
    
    // let's try again for pixel perfect. convert to
    
    
    float c2_x = (floor(player_coords.x/pixel_amount)*pixel_amount)/resX * (resX/resY);
    float c2_y = (floor(player_coords.y/pixel_amount)*pixel_amount)/resY;
    float XCOORD = uv2.x * resX;
    float YCOORD = uv2.y * resY;
    uv2.x = (floor(XCOORD/pixel_amount)*pixel_amount)/resX * (resX/resY);
    
    uv2.y = (floor(YCOORD/pixel_amount)*pixel_amount)/resY;
    
    float dist = distance(vec2(uv2.x,uv2.y), vec2(c2_x,c2_y));  
    
    // add some wiggle to this later by importing sinewave variable
    
    vec4 colorHSV = vec4( rgb_to_hsv(oldColour.rgb ), oldColour.a);
    
    float NEW_JITTER = circle_jitter * 0.002;
    float NOTBLACK = 1.0/256.0;
    
    if (dist < (0.3 + NEW_JITTER)) LNUM = max(1.0,LNUM); // inner circle, mid brightness
    if (dist < (0.2 + NEW_JITTER)) LNUM = 2.0; // bright, middle of player circle
     
    
    // turn off player circle for now
    
    
    
/////// Now let's cycle through each of the lanterns /////////////////////////////////

if ((lantern_1.x > 0.0) && (LNUM < 2.0)){
    //calculate distance. we already have uv2x and y, now need lantern coordinates.
    //... but we need xview and yview :(

    float L1_x = (((lantern_1.x - x_view) /resX) * (resX/resY));
    float L1_y = ((lantern_1.y - y_view)/resY);

    // pixel perfect test
    //L1_x = (floor((lantern_1.x - x_view)/pixel_amount)*pixel_amount)/resX * (resX/resY);
    //L1_y = (floor((lantern_1.y - y_view)/pixel_amount)*pixel_amount)/resY;
    
    //float c2_x = (floor(player_coords.x/pixel_amount)*pixel_amount)/resX * (resX/resY);
    //float c2_y = (floor(player_coords.y/pixel_amount)*pixel_amount)/resY;
    
    
    float dist1 = distance(vec2(uv2.x,uv2.y),vec2(L1_x,L1_y));    
    if (dist1 < 0.3 + NEW_JITTER) LNUM = max(LNUM,1.0);
    if (dist1 < (0.2 + NEW_JITTER)) LNUM = 2.0;
}

if ((lantern_2.x > 0.0) && (LNUM < 2.0)){
    //vec2 uv4 = v_vTexcoord;
    float L2_x = (((lantern_2.x - x_view) /resX) * (resX/resY));
    float L2_y = ((lantern_2.y - y_view)/resY);
    //uv4.x *= resX/resY;
    
    float dist1 = distance(vec2(uv2.x,uv2.y),vec2(L2_x,L2_y));    
    if (dist1 < 0.3 + NEW_JITTER) LNUM = max(LNUM,1.0);
    if (dist1 < (0.2 + NEW_JITTER)) LNUM = 2.0;

}

if ((lantern_3.x > 0.0) && (LNUM < 2.0)){
    float L3_x = (((lantern_3.x - x_view) /resX) * (resX/resY));
    float L3_y = ((lantern_3.y - y_view)/resY);
    //uv3.x *= resX/resY;
    
    float dist1 = distance(vec2(uv2.x,uv2.y),vec2(L3_x,L3_y));    
    if (dist1 < 0.3 + NEW_JITTER) LNUM = max(LNUM,1.0);
    if (dist1 < (0.2 + NEW_JITTER)) LNUM = 2.0;

}

if ((lantern_4.x > 0.0) && (LNUM < 2.0)){
    float L4_x = (((lantern_4.x - x_view) /resX) * (resX/resY));
    float L4_y = ((lantern_4.y - y_view)/resY);
    //uv3.x *= resX/resY;
    
    float dist1 = distance(vec2(uv2.x,uv2.y),vec2(L4_x,L4_y));    
    if (dist1 < 0.3 + NEW_JITTER) LNUM = max(LNUM,1.0);
    if (dist1 < (0.2 + NEW_JITTER)) LNUM = 2.0;
}



    
    
    
    
    

    
    
/////// Now we've added up all lanterns and lights, we choose a colour //////////////
    
    if (LNUM >= 2.0) {
        // bright
        //  let's tint towards yellow
        colorHSV.g = clamp(colorHSV.g*(1.0-0.2*light_amount),0.0,1.0-NOTBLACK);// lower saturation
        colorHSV.b = clamp(colorHSV.b*(1.0+0.2*light_amount),NOTBLACK,1.0); // raise brightness
            
        vec4 colorRGB = vec4( hsv_to_rgb(colorHSV.rgb ), colorHSV.a);
        
        newColour.r = colorRGB.r;
        newColour.g = colorRGB.g;
        newColour.b = colorRGB.b * (1.0-0.4*light_amount);
    
    }
    else if (colorHSV.b > 0.0) { // if we're not dealing with black, let's adjust
        
        if (LNUM >= 1.0){ // inner circle, lighter blue
            
            colorHSV.g = clamp(colorHSV.g+0.2*light_amount,0.0,1.0-NOTBLACK);// raise saturation
            colorHSV.b = clamp(colorHSV.b*(1.0-0.5*light_amount),NOTBLACK,1.0); // lower brightness
            
            vec4 colorRGB = vec4( hsv_to_rgb(colorHSV.rgb ), colorHSV.a);
        
            newColour.r = clamp(colorRGB.r * (1.0-0.6*light_amount),NOTBLACK,1.0);
            newColour.g = clamp(colorRGB.g * (1.0-0.6*light_amount),NOTBLACK,1.0);
            newColour.b = colorRGB.b;
            
        }
        else { // outer circle, darker. LNUM = 0.
            colorHSV.g = clamp(colorHSV.g+0.4*light_amount,0.0,1.0-NOTBLACK);// raise saturation
            colorHSV.b = clamp(colorHSV.b*(1.0-0.8*light_amount),NOTBLACK,1.0); // lower brightness
        
            vec4 colorRGB = vec4( hsv_to_rgb(colorHSV.rgb ), colorHSV.a);
            
            newColour.r = colorRGB.r * (1.0-0.8*light_amount);
            newColour.g = colorRGB.g * (1.0-0.8*light_amount);
            newColour.b = colorRGB.b;
            
        }
    }
    

    gl_FragColor = newColour;
}
