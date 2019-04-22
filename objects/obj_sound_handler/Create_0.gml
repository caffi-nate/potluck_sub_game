underwater_loop = -1;
underwater_loop2 = -1;
wind_loop = -1;
surface_loop = -1;

gulls_sounds = -1;
gullsTimer = 0;

soundLoaded = false;
waterGain = 0;
WATER_TOP_DISTANCE = 96;




global.musicEmitter = audio_emitter_create();
audio_emitter_gain(global.musicEmitter,global.musicVolume); // only mess with this when we need to

background_music = -1;
musicGain = 0;
music_offset_y = 1300//300;
music_distance = 400;



surfaceMusic = -1;


global.endGameGain = 0;

playerDistance = -1;