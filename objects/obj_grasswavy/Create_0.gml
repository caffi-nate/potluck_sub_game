// pause on current frame
image_speed = 0;


xskew = 0;
xset = 0;



parent = 0;           // don't understand these at all wtf zack
parentInit = 0;


// sine wave movement stuff
angle = choose(0,15,30,45,60);// initialise whenever not colliding/being moved
initialAngle = angle;
angleMultiplier = 4; // radius. we'll see how this works...
angleIncrement = RADIAN;

//skewmax = random_range(4,8);
//skewmax = 0; // was 4. 0 initiales grass to point straight up
skewmax = sin(angle) * angleMultiplier;
delay = 4;



if !instance_exists(obj_grassSurface){
    instance_create(x,y,obj_grassSurface);
}