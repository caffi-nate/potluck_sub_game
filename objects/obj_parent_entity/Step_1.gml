event_inherited();

cLeft = place_meeting(x - 1, y, obj_brick);
cRight = place_meeting(x + 1, y, obj_brick);

if (cLeft) wallTarget = instance_place(x - 1, y, obj_brick);
if (cRight) wallTarget = instance_place(x + 1, y, obj_brick);



// procedural animation stuff
//if onGround && !onGroundLastFrame {
//    xscale = 1.3; // was 1.3
//    yscale = 0.7; // was 0.7
//}
//else if !onGround && onGroundLastFrame && vSpeed < 0 { // jumping upwards, not just falling
//    xscale = 0.7;
//    yscale = 1.3;
//}

