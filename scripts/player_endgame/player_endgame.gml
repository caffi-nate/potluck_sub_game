vSpeed = 0;
hSpeed = 0;
holding = -4;


y = approach(y,global.sun_y, 0.3);
//x = approach(x, global.sun_x,1);


XSCALE = sin(global.gameTimer * RADIAN * 2);
//XSCALE += 0.1;

sprite_index = spr_playerHurt;


invincibilityTimer = 1;



if (y <= global.sun_y){
	endTimer ++;
	
	
	if (endTimer == 180){
		instance_create(x,y,obj_lightFlash);	
		hidePlayer = true;
	}
	
	
	if (endTimer >= 360){
		with (obj_gamestate_controller){
			outroWipe = true;
		}
	}	
}


if !hidePlayer {
	if !instance_exists(obj_sweaty) instance_create_depth(x,y,0,obj_sweaty);	
}
else {
	if instance_exists(obj_sweaty) with (obj_sweaty) instance_destroy();
}