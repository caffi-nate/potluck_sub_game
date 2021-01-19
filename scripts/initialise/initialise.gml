function initialise() {
	// Game Resolution
	// nah lol

	// macros
#macro view_wview camera_get_view_width(view_camera[0])
#macro view_hview camera_get_view_height(view_camera[0])
#macro view_xview camera_get_view_x(view_camera[0])
#macro view_yview camera_get_view_y(view_camera[0])
#macro RADIAN 0.017453292519943295769236907684886

#macro gp_lstick_down 101
#macro gp_lstick_left 102
#macro gp_lstick_right 103
#macro gp_lstick_up 104
#macro gp_ltrigger 105
#macro gp_rstick_down 106
#macro gp_rstick_left 107
#macro gp_rstick_right 108
#macro gp_rstick_up 109
#macro gp_rtrigger 110

#macro PLAYER_DEPTH 0
#macro TERRAIN_DEPTH 2
#macro ENTITY_DEPTH -2 // was 1. entities drawn on layer -2 though, clean this up later
#macro PARTICLE_DEPTH -1 // was -1
#macro FOREGROUND_PARTICLE_DEPTH -100
#macro BACKGROUND_PARTICLE_DEPTH 5
#macro HUD_DEPTH -10000

	// DEPTHS

	// this doesn't work because we're not in the right room!!
	global.instance_depth = 100;//layer_get_depth(layer_get_id("Instances")); // use for all that defaulted to 200 before
	//show_message(global.instance_depth);


#macro CUSTOM_CONTROLS_FILE "sub_custom_controls.txt"

	// global variables
	global.fullScreen = false;
	global.gameWidth = 640//512;
	global.gameHeight = 360//288;
	global.zoom = 1;
	global.vSyncVar = false; // lags the game
	global.AA_level = 0;
	display_reset(global.AA_level,global.vSyncVar); // set the aalevel to max for instances where it's applicable
	global.screenShake = true;
	global.screenShakeAmp = 1;
	global.defaultFont = font4; draw_set_font(global.defaultFont);

	global.sfxVolume = 100;
	global.musicVolume = 75//75;
	global.musicEmitter = audio_emitter_create();
	audio_emitter_gain(global.musicEmitter, 0.01*global.musicVolume);
	audio_emitter_position(global.musicEmitter,view_wview*0.5,view_hview*0.5,0);
	audio_group_load(ag_sfx);
	audio_group_load(ag_sfx_impact);
	audio_group_load(ag_sfx_ambiance);
	audio_group_set_gain(ag_sfx,0.01*global.sfxVolume,0);
	audio_group_set_gain(ag_sfx_impact,0.01*global.sfxVolume,0);
	audio_group_set_gain(ag_sfx_ambiance,0.01*global.sfxVolume,0);

	global.gameTimer = 0;
	global.gameScore = 0;
	enum controlModes {
		mouseKeyboard,
		controller
	}
	global.controlMode = controlModes.mouseKeyboard; // 1 = mousekeyboard, 2 = controller
	global.gameState = 1; // 0 if dead
	global.sleepTimer = 0;


	initialise_palette();

	// load text data from file. temp for now: still need this for menu item names
	global.textgridWidth = 10;
	global.dialogueKeyMap = ds_map_create();
	global.textgrid = ds_grid_create(global.textgridWidth ,5);
	scr_resize_textgrid("crocsub_textfile.txt");
	scr_load_textdump("crocsub_textfile.txt");

	// dialogue stuff new
	global.currentTextFile = "crocDialogue.txt";
	global.textGrid = ds_grid_create(3,1);
	new_textFile();

	global.currentlyTalking = false;


	instance_create_depth(x,y,-1000,obj_paletteManager);

	instance_create_depth(x,y,0,obj_controls_handler);
	instance_create_depth(x,y,HUD_DEPTH,obj_sound_handler);
	instance_create_depth(x,y,100,obj_gamestate_controller);

	randomize();
	global.perlinSeed = irandom_range(1000000,10000000);


	layer_shader_setup();







	// debug
	// debug variables

	//global.skipIntroCutscene = false;
	global.debugMode = 1;
	global.skipStory = 1;
	global.twitterCamera = true;
	global.kioskMode = false; // for potluck or other multiplayer events.
	global.realTimer = current_time;

	// story progression flags
	set_story_flags();





	room_goto_next();



}
