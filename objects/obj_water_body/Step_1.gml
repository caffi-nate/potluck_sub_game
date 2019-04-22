playerInWaterLastFrame = playerInWater;

waterVar += RADIAN;

if (waterTimer > 0) waterTimer -= 1;


if (instance_place(x,y,obj_player)) 
//&& obj_player.state != states.hurt 
{
    playerInWater = true;
    
    var col_y = dyliquid_get_y(obj_player.x); // get collision point. should say other.x
    
    with obj_player {
    
        if !other.playerInWaterLastFrame && other.y > y {
            // angle in whichever direction the player was heading before water
            
            other.waterTimer = 60;
            
            //var splashSound = choose(sfx_splash_DUCK,sfx_splash2_DUCK);
            //scr_play_sound(splashSound,1,global.mainEmitter);
            
            
            //swimDirection = 270 + floor(hSpeed) * 10; 
            
            // make some splash particles(along with a wave sprite later)
            
            var obj = object_index;
            
            scr_splash_create(obj, x, obj_player.y, -abs(obj_player.vSpeed * 0.25), 16, 4, 4, 0.25, global.COLOUR6_WHITE, 1, bm_normal);
            instance_create_depth(x,col_y,0,obj_splash);
            
            //if (y >= col_y) 
            with (obj_water_body)
                dyliquid_spash(other.x, other.vSpeed * 8);  // splash
            
             
               // }       
        }  
    }    
} else { 
    playerInWater = false;
    if playerInWaterLastFrame && other.y > y {
		// we're surfacing: create splash particles as required
        //scr_play_sound(sfx_splashSurface1,1,global.mainEmitter);
    }   
}


/// create some bubble particles
bubbleCreationTimer -= 1;

if (bubbleCreationTimer == 0){
    bubbleCreationTimer = 240 + floor(random_range(-180,180)); // reset clock
    
    var YY = y + sprite_yoffset;
    RANDOMX = random_range(x-sprite_xoffset,x+sprite_xoffset);
    
    YY = dy_y[1];
    RANDOMX = random_range(dy_x[0],dy_x[1]);
    
    
    var bub = instance_create_depth(RANDOMX,YY,0,pt_waterBubble);  
    with bub {
        bubbleYSpeed = random_range(0.5,1.2);
        bubbleXSpeed = random_range(-1,1);   
        waterBodyTop = other.y - other.sprite_yoffset;
    }
}