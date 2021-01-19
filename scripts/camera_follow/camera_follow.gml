function camera_follow() {
	var SHAKE_SPEED = 0.3;
	var CAMERA_SHAKE = sin(trauma * SHAKE_SPEED) * (screenShakeAmount) * global.screenShakeAmp;

	var SHADER_TRAUMA = clamp(trauma-10,0,1000); // make it smaller so the effect ends sooner
	var SHADER_SHAKE = sin(SHADER_TRAUMA * 0.3*SHAKE_SPEED) * (0.3*screenShakeAmount);

	// camera follows player
	//scr_camera_update(CAMERA_SHAKE);

	// now finally change the camera position


	//view_x = obj_player.x - 0.5*view_wview;
	//if (trauma <=0) view_y = obj_player.y - 0.5*view_hview;
	//else view_y = CAMERA_SHAKE;


	/////////////////////

	var LOOK_AHEAD_DISTANCE = (obj_player.xdir * 72);


	var PLAYER_HSPEED = obj_player.hSpeed;//abs(obj_player.hSpeed);

	// test
	with (obj_player){
		PLAYER_HSPEED = point_distance(x,y, x + lengthdir_x(hSpeed,obj_player.facingDirection), y + lengthdir_y(vSpeed,facingDirection));
	}


	var X_MOVE_SPEED = clamp(1+PLAYER_HSPEED,0,3); // depends how fast player wants to go
	adjusted_camera_X = approach(adjusted_camera_X,LOOK_AHEAD_DISTANCE,X_MOVE_SPEED);

	if (global.twitterCamera) adjusted_camera_X = 0;
	view_x = clamp(obj_player.x - view_w * 0.5 + adjusted_camera_X,0, room_width);		




	//view_y = 64;
	//if (abs(obj_player.vSpeed) > 0){
	//view_y = approach(view_y,floor(obj_player.y) - view_h * 0.5,abs(obj_player.vSpeed));

	if (obj_player.state == states.surfacePaddle || obj_player.state = states.endgame){
			view_y = approach(view_y,64,1.5); // so that we can ignore the player's annoying surface bobbing
			view_y = view_y + CAMERA_SHAKE;
	} else {
	
			var CAMSPEED = max(2,abs(obj_player.vSpeed) + 1);
			var VIEWPOS = obj_player.y - view_hview *0.5;
		
			// slowly start creeping up when we're nearing the surface
			if (obj_player.y < 500) VIEWPOS -= ((500-obj_player.y) / 500) * 0.5 * view_hview;
		
		
			view_y = approach(view_y,VIEWPOS,CAMSPEED);
			view_y = view_y + CAMERA_SHAKE;
	}




}
