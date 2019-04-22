sonarTimer+=2;

if (sonarTimer > 120){
	//alphaValue = approach(alphaValue, 0, alphaStepSpeed);
	//if (alphaValue <= 0) instance_destroy();
	//if (sonarTimer > view_wview) instance_destroy();
	alphaValue = approach(alphaValue, 0, 0.25*alphaStepSpeed);
	if (alphaValue <= 0) instance_destroy();
}
else {
	alphaValue = approach(alphaValue, 1, alphaStepSpeed);
	playerSightRadius = sonarTimer; // cap at 120
}

x = obj_player.x;
y = obj_player.y;


with (obj_player){
	
	sonarSightRadius = max(sonarSightRadius, other.playerSightRadius);
	
	//sonarSightRadius = clamp(other.playerSightRadius,sonarInitialRadius,1000);	
}
draw_set_alpha(1);

