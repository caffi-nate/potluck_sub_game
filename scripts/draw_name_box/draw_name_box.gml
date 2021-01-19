function draw_name_box() {
		draw_set_colour(global.COLOUR8_RED);
		//draw_rectangle(8,4,24 + string_width(currentSpeaker),24,0);
		var NM_X = 40;
		var NM_Y = 8;
		draw_perlin_box(NM_X,4 + NM_Y,NM_X + 16 +string_width(currentSpeaker),0 + NM_Y, NM_X-8, 24 + NM_Y, NM_X - 8 + 16 +string_width(currentSpeaker), NM_Y + 28, floor(timeVar));
	
		draw_set_colour(global.COLOUR1_BLACK); // shadow first
	
		
		var nmDist = 1;
		var nameMovement = nmDist + sin(timeVar*0.25) * nmDist;
		var numShadows = 8;
		for (i = 0; i <= numShadows; i++){
			var shadowMovement = (i/numShadows)*nameMovement;
			draw_text(NM_X+1 - shadowMovement,NM_Y+4+1 - shadowMovement,currentSpeaker);
		}
		draw_set_colour(global.COLOUR3_GREEN);
		draw_text(NM_X - nameMovement ,4+NM_Y - nameMovement,currentSpeaker);


}
