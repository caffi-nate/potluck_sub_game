draw_set_valign(fa_top);
draw_set_halign(fa_left);




timeVar+= 0.5//0.25;
var JITTER_TIMEVAR = floor(current_time *0.004)


if (runDialogue) {

	//draw_set_font(font1);

	angle += 4 * RADIAN;
	var OLD_SPEAKER = newSpeaker;
	

	if mouse_wheel_down(){
	//	room_speed = approach(room_speed,1,1);	
	}
	else if mouse_wheel_up(){
	//	room_speed = approach(room_speed,60,1);	
	}

	var TEXT_DONE_LASTFRAME = typeWriterDone;
	var PARSING_DIALOGUE = false; // 

	var FONTSCALE = 1;
	// compare these later in text advance
	var OLD_DIALOGUE = currentDialogue;
	
		// portrait sprites and transitions
		// try a test whttps://forum.yoyogames.com/index.php?threads/retro-palette-swapper.7498/ith different character sprites and tween between them
		var TRANSITION_SPEED = 0.05; // was 0.08
		//var PX = -120 + portrait_alpha * 120;//200; // was 260
		var PX = 0;
		var FINAL_PX = 120;
		var PY = 0;
		portrait_yscale = 1;
		portrait_xscale = 1;
	
	
		if !surface_exists(portraitSurface){
			portraitSurface = surface_create(global.gameWidth,global.gameHeight);
		}
		surface_set_target(portraitSurface);
		draw_clear_alpha(c_black,0);
	
		portrait_alpha = approach(portrait_alpha,1,TRANSITION_SPEED);
		//old_portrait_alpha = approach(old_portrait_alpha,0,TRANSITION_SPEED*0.5); // fade out slower than fade in
		//if (current_portrait_sprite != -1) draw_sprite_ext(current_portrait_sprite,1,FINAL_PX,PY,portrait_xscale,portrait_yscale,0,c_white,0);	
		portraitAnimTime += image_speed;
		if (current_portrait_sprite != -1) draw_sprite_ext(current_portrait_sprite,portraitAnimTime % sprite_get_number(current_portrait_sprite),PX,PY,portrait_xscale,portrait_yscale,0,c_white,1);	

		surface_reset_target();
	
		// when the player is speaking, subtly alter the character's value so they aren't highlighted
		var HIGHLIGHT_SPEED = 10;
		if (currentSpeaker == "Samiel" || currentSpeaker == "none") portraitDarkness = approach(portraitDarkness,150,HIGHLIGHT_SPEED);
		else portraitDarkness = approach(portraitDarkness,255,HIGHLIGHT_SPEED);
	
		//draw_surface_ext(portraitSurface,0,0,1,1,0,make_colour_hsv(255,0,portraitDarkness),1);


	var GRID_HEIGHT = ds_grid_height(global.textGrid);
	//TEXT_ADVANCE = max(keyboard_check_pressed(vk_right),
	//						keyboard_check_pressed(vk_down),
	//						keyboard_check_pressed(vk_enter),
	//						mouse_check_button_pressed(mb_left),
	//						keyboard_check_pressed(vk_space),
	//						0);
	TEXT_ADVANCE = max(0,scr_input_check_pressed("face1"),scr_input_check_pressed("RT"),scr_input_check_pressed("face2"));

	var CHOICE_SELECT = -1;
		if (keyboard_check_pressed(ord("1"))) CHOICE_SELECT = 1;
		else if (keyboard_check_pressed(ord("2"))) CHOICE_SELECT = 2;
		else if (keyboard_check_pressed(ord("3"))) CHOICE_SELECT = 3;
		else if (keyboard_check_pressed(ord("4"))) CHOICE_SELECT = 4;


	if keyboard_check_pressed(vk_f2){
		draw_all_dialogue = !draw_all_dialogue;	
	}

		var CURRENT_TEXT = ds_grid_get(global.textGrid,2,currentGridLine);
		var FIRSTWORD = ds_grid_get(global.textGrid,0,currentGridLine);



		#region firstword switch statement
		switch (FIRSTWORD){			
			case "SHAKE":
				var SHAKEAMOUNT = real(string_tokenise_element(CURRENT_TEXT,1));
				with (obj_display_manager){
					trauma = approach(trauma,100,SHAKEAMOUNT);
				}		
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
				
			case "loadStart":
				//var LABEL = string_tokenise_element(CURRENT_TEXT,1);
				
				// skip over for now
				//advance_dialogue_gridline(GRID_HEIGHT);
				var LABEL_TAG = "label "+string(dialogueStartLabel)+":";
				for (i = 0; i < GRID_HEIGHT; i++){
					var CURRENT = ds_grid_get(global.textGrid,2,i);
					//show_message(string(CURRENT) + " | " + string(LABEL_TAG));
					if (CURRENT == LABEL_TAG){
						currentGridLine = i + 1; // skip over the label tag
						break;
					}
				}

				break;
		
			case "goto": //was goto
				var LABEL = string_tokenise_element(CURRENT_TEXT,1);
			
				var CURRENTLINE = string(currentGridLine);
				dialogue_goto(CURRENTLINE);
				break;
		
			case "choice:":
				// only text advance if there's no choice on screen
				if (TEXT_ADVANCE){
					cutoff = string_length(currentDialogue);
				}
		
				choiceActive = true;
		
				// activate this script /once/ whenever we encounter a choice, then reset variables afterwards
				if (choiceText == "") parse_dialogue_choices(currentGridLine);
				currentDialogue = string_replace_nansi_characters(choiceText);
			
				if (typeWriterDone){
					for (i = 0; i < numChoices; i++){
						var CHOICETEXT = string(i+1) + " " + ds_grid_get(choice_grid,0,i)
						draw_text(300,100+i*20,CHOICETEXT);
		

						// create a choice box ONCE
						if (instance_number(obj_choiceBox) < numChoices){
							var CHOICE = instance_create_depth(140+ i*64,global.gameHeight,HUD_DEPTH,obj_choiceBox);
							with (CHOICE){
								choiceIndex = i;
								choiceText = CHOICETEXT;
							}
						}
		
					}
		
		
					if (CHOICE_SELECT > 0) && (CHOICE_SELECT <= numChoices){
						with (obj_choiceBox) choicesActive = false;
					
						// text advance	temp
						var CHOICE_INDEX = ds_grid_get(choice_grid,1,CHOICE_SELECT-1);
						currentGridLine = CHOICE_INDEX + 1; // remember to goto the line after the actual dialogue choice
						scr_play_sound(sfx_choiceConfirm,1,0.3 * (1-global.endGameGain),0,-4);
					}
				}
				break;
	
			case "PORTRAIT":
				var NEW_PORTRAIT_SPRITE = -1;
				var PORTRAIT_STRING =  string_replace(CURRENT_TEXT,"PORTRAIT ","");
			
			
				NEW_PORTRAIT_SPRITE = select_portrait(PORTRAIT_STRING);
		
				// switchover: perform this once
				if (NEW_PORTRAIT_SPRITE != new_portrait_sprite){
					//old_portrait_sprite = portrait_sprite;
					new_portrait_sprite = NEW_PORTRAIT_SPRITE;		
					// fade transition between the two
					portrait_alpha = 0;
					old_portrait_alpha = 1;
				}
				// skip over, auto advance
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
			case "SPEAKER":
				//newSpeaker = string_replace(CURRENT_TEXT,FIRSTWORD+" ","");
				newSpeaker = string_replace(CURRENT_TEXT,FIRSTWORD+" ","");
				show_debug_message(newSpeaker);
				// skip over, auto advance
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
		
			case "return":
				// end scene, do not advance. wait until textbox surface is off screen to trigger
				//if (surface_y >= surface_initial_y)
					// TODO: close the dialogue box instead and take any necessary actions
					// destroy
					//instance_destroy();
					//destroyBox = true;
				
				
					//with (obj_gamestate_controller){
						//load_scene();
					//}
				break;
			
			case "SET":
				// setting a variable
				var SET_VARIABLE = string_tokenise_element(CURRENT_TEXT,1);
				SET_VARIABLE = string_replace(SET_VARIABLE,"$","_");
				var SET_VALUE = string_tokenise_element(CURRENT_TEXT,2);
				SET_VALUE = string_replace(SET_VALUE,"\"","");
				SET_VALUE = string_lower(SET_VALUE);			
				ds_map_replace(global.variableMap,SET_VARIABLE,SET_VALUE);
			
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
			case "PAUSE":
				// wait for the time indicated, then advance dialogue
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
		
			case "label":
				// skip over this line, auto advance
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
			
			case "BACKGROUND":
				var COMMAND_1 = string_tokenise_element(CURRENT_TEXT,1);
				var FADE_TIME = real(string_tokenise_element(CURRENT_TEXT,2));

				with (obj_gamestate_controller){
					transitionDuration = FADE_TIME;
					fadeComplete = false; // in out probably doesnt matter				
				}
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
			
			case "MUSIC":
				// process the music event, then move to next gridline
				var COMMAND = string_tokenise_element(CURRENT_TEXT,1);
				var MUSIC_ID = asset_get_index(string_tokenise_element(CURRENT_TEXT,2));
				var TIME = real(string_tokenise_element(CURRENT_TEXT,3));		
				if (COMMAND == "start"){
					with (obj_audioManager){
						track1 = scr_play_sound(MUSIC_ID,1,0,1,-4);	
						fadeIn = true;
						fadeTime = TIME;
					}
				}
				else if (COMMAND == "stop"){
					with (obj_audioManager){
						fadeIn = false;
						fadeTime = TIME;
					}
				}		
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
			case "SOUND":
				// process the sound event, then move to the next gridline
				var SOUND_ID = asset_get_index(string_tokenise_element(CURRENT_TEXT,1));
				var GAIN = string_tokenise_element(CURRENT_TEXT,2);		
				scr_play_sound(SOUND_ID,1,real(GAIN),0,-4);
				advance_dialogue_gridline(GRID_HEIGHT);
				break;
		
		
			default: // a text or dialogue string
				reset_choice_data();			
				currentDialogue = string_replace_nansi_characters(CURRENT_TEXT);

				// only text advance if there's no choice on screen AND the textbox has come into view
				if (TEXT_ADVANCE && surface_y <= surface_resting_y){
					var LENGTH = string_length(currentDialogue);
					if (cutoff < LENGTH)
						cutoff = LENGTH;
					else {
						advance_dialogue_gridline(GRID_HEIGHT);
						with (dialogueMarker) destroy = true;
					}
				}
				break;
		
		}
		#endregion

	/////////////////// draw the textbox surface here!

	if !surface_exists(dialogueBoxSurface){
		dialogueBoxSurface = surface_create(surfaceWidth,surfaceHeight);	
	}
	surface_set_target(dialogueBoxSurface);
	draw_clear_alpha(c_black,0);
	draw_set_colour(textboxColour);
	draw_set_alpha(1);
	//draw_rectangle(0,28,surfaceWidth,surfaceHeight,0);
	draw_perlin_box(32,32,32 + (textboxWidthPercentage * (surfaceWidth-32)), 16,
					0, surfaceHeight-24, textboxWidthPercentage * (surfaceWidth-32), surfaceHeight, floor(timeVar)+1000);
	draw_set_alpha(1);	
	
	// draw the name box
	//draw_name_box();
	

	

	var LINE_WIDTH = 0; // starts at 0 and gradually increments over each line
	var LINE_NUM = 0;
	var TEXT_X = 64 // 32//16//40; // start it way out from the sides for easier reading
	var TEXT_Y = 32//300 300 was the non surface version;
	var TEXT_Y_SIZE = 1;
	var LINE_Y_SPACE = 20;

	var DIALOGUE_LENGTH = string_length(currentDialogue);

	if (FIRSTWORD == 0 || FIRSTWORD == "choice:")
		play_dialogue_scroll_sounds(); // old placement

	if (surface_ready)
		cutoff = approach(cutoff,DIALOGUE_LENGTH,textSpeed);

	if (cutoff >= DIALOGUE_LENGTH){
		typeWriterDone = true;
		if (FIRSTWORD == 0 && !TEXT_DONE_LASTFRAME){
			if (instance_exists(obj_dialogueNextMarker)) with (obj_dialogueNextMarker) instance_destroy();
			dialogueMarker = instance_create_depth(view_wview - 80,80,HUD_DEPTH+1,obj_dialogueNextMarker);
		}
	}

	// update variables if the gridline has changed
	if (OLD_DIALOGUE != currentDialogue){
		cutoff = 1;
		typeWriterDone = false;
	}
	var i = 1; // string index temp variable
	var outputIndex = 1;

	while (i <= string_length(currentDialogue) && i <= cutoff){
	//for (i = 1; i <= DIALOGUE_LENGTH; i++){
		var CURRENT_CHAR = string_char_at(currentDialogue,i);
	
		switch (CURRENT_CHAR){
			case "%":
				// phoenix wright screenshake effect. process invisibly.
				if (i == cutoff) // process it once only
					with (obj_display_manager){
						trauma = approach(trauma,100,70);
						scr_play_sound(sfx_smack,1,0.5,0,-4);
						instance_create_depth(0,0,HUD_DEPTH+5,obj_lightFlash);
					}
				break;		
			case "|":
				// it's a pause. process it invisibly.
				break;
			case "#":
				// it's a linebreak. process it invisibly.
				LINE_WIDTH = 0;
				LINE_NUM++;
				// outputIndex = 0; // ?
				break;
			case "[":
				if (i > 1) lastCharacter = string_char_at(currentDialogue,i-1);
				if (!is_special_character(lastCharacter))  tempCharacterWidth = string_width(lastCharacter);
				processingCode = true;
				currentCode = ""; // reset the code
				++i; // step into the code
			
				while (string_char_at(currentDialogue,i) != "]"){
					// fill the new code string with the code to be interpreted
					currentCode = currentCode + string_char_at(currentDialogue,i);
					++i;	
				}
				// then run the code here
				process_dialogue_code(currentCode);
				break;
			case "]":
				show_message("no code"); // shouldn't run
				processingCode = false;
				break;		
			default:
					if (!typeWriterDone) TEXT_Y_SIZE = clamp((cutoff - i) * 0.2, 0, 1);
					var START_Y = -(5 - (5 * TEXT_Y_SIZE)); // start 5 pixels above and fall down

					// all text effects and actual text drawing go in here!
					#region drawDialogueText
						var XX = TEXT_X + LINE_WIDTH;
						var YY = LINE_NUM * LINE_Y_SPACE + TEXT_Y + START_Y;
						// variables for additional movement depending on text effect
						var X1 = 0;
						var Y1 = 0;
						
						
						FONTSCALE = FONTSCALE_INITIAL; // let's... reset this between shit so jitter doesnt mess with it


						switch(textEffects){	
							case 1: // jittery. // may have to be adjusted, looks odd at 60fps
								//var MAX_JITTER = 1//0.52; // the rounding means we only jitter occasionally
								//X1 = random_range(-MAX_JITTER,MAX_JITTER);
								//Y1 = random_range(-MAX_JITTER,MAX_JITTER);
								
								
									// only called every few frames?
									var MAX_JITTER = 0.52;
									//var MAX_JITTER = 1;
									FONTSCALE = FONTSCALE_INITIAL;
									X1 = 1*(random_range_perlin(-MAX_JITTER,MAX_JITTER)); // was 2
									Y1 = 1*(random_range_perlin(-MAX_JITTER,MAX_JITTER));
								break;
							case 2:
								var AMPLITUDE = 1.6;
								var FREQUENCY = 2;
								Y1 = (AMPLITUDE * sin(i + angle * FREQUENCY)) - 0.5 * AMPLITUDE;
								break;
							case 3: // wiggly wavey 2
								var AMPLITUDE = 1;
								var FREQUENCY = 3;
								Y1 = AMPLITUDE * sin(((i mod 6) + angle) * FREQUENCY);
								break;
							case 4: // irRiTaTEd
								//show_message("hello");
								if ((JITTER_TIMEVAR mod JITTER_TEXT_FREAKOUT_TIME) == 0){ // big jitters!
									var MAX_JITTER = 0.52;
									X1 = 13*random_range_perlin(-MAX_JITTER,MAX_JITTER);
									Y1 = 13*random_range_perlin(-MAX_JITTER,MAX_JITTER);
									FONTSCALE = FONTSCALE_INITIAL*choose(1,-1,2);									
								}
								else { // on edge, slight jitters
									var MAX_JITTER = 0.52//0.501;
									FONTSCALE = FONTSCALE_INITIAL;
									X1 = 2*round(random_range(-MAX_JITTER,MAX_JITTER));
									Y1 = 2*round(random_range(-MAX_JITTER,MAX_JITTER));
								}						
								break;
							default:
							case 0: //normal
								break;
						}
					
						// draw text shadow
						draw_set_colour(global.COLOUR1_BLACK);
						draw_text_transformed(XX + X1 + 1,YY + 1 + Y1, CURRENT_CHAR,FONTSCALE,FONTSCALE * TEXT_Y_SIZE,0);
	
						// draw text 
						draw_set_colour(textColour);
						draw_text_transformed(XX + X1,YY + Y1, CURRENT_CHAR, FONTSCALE,FONTSCALE * TEXT_Y_SIZE,0);
					#endregion
					
					LINE_WIDTH += string_width(CURRENT_CHAR);
					outputIndex++;
				break;
		}	
		i++; // we stepped through the input string once, so let's increment
	}


	surface_reset_target();

	if (surface_fade_in){
		surface_y = surface_resting_y;
		surface_alpha = 1;

		//currentSpeaker = newSpeaker;



		// change it when it's safe to do so
		if (surface_x <= surface_initial_x){
			current_portrait_sprite = new_portrait_sprite;	
			currentSpeaker = newSpeaker;
		}



		// translate, then scale width
		if (string_length(currentDialogue) > 0) // only fade in if we have text to show
			surface_x = approach(surface_x,surface_ready_x,abs(surface_initial_x - surface_ready_x) / fade_time);
		
		

		
		
		if (surface_x >= surface_ready_x){
			textboxWidthPercentage = approach(textboxWidthPercentage,1,0.08);
			if (textboxWidthPercentage >= 1)
				surface_ready = true;
		}
	
	}
	else { // fade out
		surface_ready = false;
		surface_y = surface_resting_y;
		surface_alpha = 1;
		currentDialogue = ""; // get rid of text before fading out: failsafe for last line
		
		// shrink scale before translating
		textboxWidthPercentage = approach(textboxWidthPercentage,0.1,0.08);
		if (textboxWidthPercentage <= 0.1){
			surface_x = approach(surface_x, surface_initial_x, abs(surface_initial_x - surface_ready_x) / fade_time);
		}

		// prepare for next dialogue box, only if current line is not RETURN.
		if (surface_x <= surface_initial_x){

			if (FIRSTWORD != "return") surface_fade_in = true;
			else destroyBox = true;
		}
	}

	// destroy after surface draw calls
	if (OLD_SPEAKER != newSpeaker || FIRSTWORD == "return"){
		surface_fade_in = false;
	}


	draw_surface_ext(dialogueBoxSurface,surface_x,surface_y,1,1,0,c_white,surface_alpha);

	// draw the portrait above
	//draw_surface_ext(portraitSurface,surface_x-12,20+sin(6*timeVar*RADIAN)*6,1,1,0,make_colour_hsv(255,0,portraitDarkness),1);

	if (destroyBox) instance_destroy();



	if (global.debugMode){
		draw_text(20,100,TEXT_DONE_LASTFRAME);
		draw_text(20,120,typeWriterDone);
		draw_text(20,140,"FIRST WORD: "+ string(FIRSTWORD));
		draw_text(20,160,string_char_at(currentDialogue,cutoff));
		draw_text(20,180,processingCode);
		draw_text(600,20,room_speed);
		draw_text(600,40,fps);
		draw_text(600,60,typeWriterDone);
		draw_set_colour(c_white);		
		draw_text(250,20,"Choice Active: " + string(choiceActive));
		draw_text(400,20,numChoices);
		draw_text(20,20,"Grid Line: " + string(currentGridLine));
		draw_text(20,40,choiceActive);
		draw_text(20,60,choiceText);
		draw_text(20,80,numChoices);	
	}
	
	//draw_text(300,20,surface_x);
	//draw_text(300,40,surface_y);
	//draw_text(300,60,surface_ready);
	//draw_text(300,80,surface_fade_in);
	//draw_text(300,100,currentGridLine);

}		
TEXT_ADVANCE = false;

if (JITTER_TIMEVAR mod JITTER_TEXT_FREAKOUT_TIME == 1)
	JITTER_TEXT_FREAKOUT_TIME = irandom(8) + 8;


draw_text(20,20,processingCode);