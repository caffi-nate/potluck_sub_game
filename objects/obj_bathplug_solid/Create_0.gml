event_inherited();

sel_force = false;
sel_impulse = false;
//depth = 101//global.instance_depth + 1;

//phy_rotation = random(360); // in degrees not radians

outlined = false;

SCALE = 1;

moveDoors = false;
doorLeft = instance_create_depth(x-16,y+32,100,obj_doorLeft);
doorRight = instance_create_depth(x+16,y+32,100,obj_doorRight);