event_inherited();



acceleration = 0.2;
fric = 0.04;
movementSpeed = 3;
hSpeed = 0;
vSpeed = 0;


facingDirection = 0;
newAngle = -4;

xdir = 1;
XSCALE = xdir;

isUnderWater = true;
UNDERWATER_LAST_FRAME = isUnderWater;


enum states {
	surfacePaddle,
	underwater,
	endgame,
	hurt
}

hurtTimer = 0;
invincibilityTimer = 0;
hurtSpinSpeed = 15;
impactDirection = -4;

state = states.underwater;


// audio listener set up
audio_listener_create();


tailEmitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(tailEmitter,128,240,1.5);

propellerSpriteIndex = 0;



audio_emitter_position(tailEmitter,x - XSCALE *30,y,0);
engineGain = 1;
engineSound = -1; 


instance_create_depth(0,0,global.instance_depth,obj_bubbleTrailSurface);
instance_create_depth(0,0,global.instance_depth,obj_frothSurface);
instance_create_depth(0,0,global.instance_depth,obj_physics_surface);
instance_create_depth(0,0,global.instance_depth,obj_grassSurface);

//instance_create_depth(0,0,0,obj_frothSurface);



movementTimer = 0;


sonarInitialRadius = 32;
sonarSightRadius = 0;//sonarInitialRadius;


skidTimer = 0;

propellerSprite = spr_propeller_static;


ropeHolder = instance_create_depth(x,y,0, o_static);
claw = instance_create_depth(x,y+200,0,o_dynamic);

//clawLeft = instance_create_depth(x-32,y+32,0,obj_clawpart);
//clawRight = instance_create_depth(x+32,y+32,0,obj_clawpart);


ropeSetup = false;
ropeSurface = -1;
surfaceWidth = global.gameWidth;
surfaceHeight = global.gameHeight;
SURFACEWIDTH = shader_get_uniform(shd_outline,"surfaceWidth");
SURFACEHEIGHT = shader_get_uniform(shd_outline,"surfaceHeight");
OUTLINECOLOUR = shader_get_uniform(shd_outline,"outlineColor");
STROKEWIDTH = shader_get_uniform(shd_outline,"strokeWidth");


heldItem = -4;

noInputTimer = 0;
noInputThreshold = 60*60; // 60 seconds


hidePlayer = false;
endTimer = 0;
