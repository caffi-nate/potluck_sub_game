//----- drawing functions ------------ 

//depth = -2;
image_speed = 0.3;


//----- movement functions -----------

dir = 1; // or -1 flipped
grav = 0.25;
verticalLimit = 5;
fric = 0.7;
acceleration = 0.4;
hSpeed = 0; // current
vSpeed = 0; // current,
cx = 0; // subpixel x movement
cy = 0; // subpixel y movement
moveSpeed = 4; // max left/right
jumpSpeed = 5; // height - grav


// collision checks
wallTarget = 0; // which solid wall are we up against
cLeft = place_meeting(x - 1, y, obj_brick);
cRight = place_meeting(x + 1, y, obj_brick);


//landed = false; // extra checks for platforms

collidingEntity = -4;
collidingOffense = -4;
collisionDirection = -4;
eCollisionLastFrame = -4;

armourTop = 0;
armourBottom = 0;
armourFront = 0;
armourBack = 0;
armourSpiked = false;


//----- special checks --------------

invisible = false;
dead = false;

// for numeric springing stuff
xscale = 1;
yscale = 1;


// audio emitters
create_audio_component();