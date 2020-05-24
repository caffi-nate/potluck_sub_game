currentGridLine = 0;

draw_all_dialogue = false; // old, redundant


// use a grid instead
choice_grid = ds_grid_create(2,4); // max of 4 choices. not robust but whatever lol
choiceActive = false;
numChoices = 0;
choiceText = "";

portraitSurface = -1;
new_portrait_sprite = -1;
current_portrait_sprite = -1;
portrait_transition_time = 0;
portrait_alpha = 0;
old_portrait_alpha = 0;
portrait_xscale = 1;
portrait_yscale = 1;
image_speed = 0.08; // used for portrait animations
portraitAnimTime = 0;

dialogueBoxSurface = -1;
surfaceWidth = global.gameWidth - 64;
surfaceHeight = 96;
surface_initial_y = global.gameHeight + 64; // add 64 to give a longer time for it to recover
surface_resting_y = 0//180//256;
surface_y = surface_initial_y;
surface_fade_in = true;
surface_fade_timer = 0;
surface_alpha = 1 //0;
fade_time = 6; // how many frames to fade over. was 10.
surface_ready = false;

surface_initial_x = -160;
surface_ready_x = 32; //?
surface_x = surface_initial_x;



currentDialogue = "";
currentSpeaker = "";
newSpeaker = "none";
speakerCard = ""; // use a separate variable for this so that it doesnt change on the way out.


// dialogue display typewriter
strIndex = 1;
typeWriterDone = false;
cutoff = 1; // index of the processed string
textDelay = 1; // frames between each printed character
textSpeed = 1;
bodyTextColour = 0; // 0 for white, 1 for greyed out thoughts, 2 for highlight A, 3 for highlight B. 


dialogueMarker = -1;
dialogueTimer = 0; // tick up for sounds etc

processingCode = false;
lastCharacter = ""; // store while we're processing code
tempCharacterWidth = 0;
currentCode = "";

textColour = global.COLOUR6_WHITE;
textEffects = 0;

angle = 0;


textboxColour = global.COLOUR1_BLACK; // now dark blue black // was mid blue test // make_color_rgb(209,85,148);


portraitDarkness = 255;
dialogueDebug = false;
runDialogue = false;
TEXT_ADVANCE = false;


// new test:
show_debug_message("dialogue manager created");
runDialogue = true;
destroyBox = false;
dialogueStartLabel = "intro";//"preboss1"; // default
timeVar = 0;
textboxWidthPercentage = 0.1;
FONTSCALE_INITIAL = 1;
JITTER_TEXT_FREAKOUT_TIME = 17;

exitScript = dialogue_exit_default;

//if (instance_exists(obj_player)) obj_player.canShoot = false;

