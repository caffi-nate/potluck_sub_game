if (global.plugPulled){
	global.endGameGain = approach(global.endGameGain,1,0.02);	
}
else global.endGameGain = 0;


/// @description Insert description here
// You can write your code in this editor
if (audio_group_is_loaded(ag_sfx_ambiance) && audio_group_is_loaded(ag_sfx) && !soundLoaded){
	//show_debug_message("loaded!");
	underwater_loop = scr_play_sound(sfx_underwater2,1,0.4,true,-4);
	underwater_loop2 = scr_play_sound(sfx_underwater3,1,0.4,true,-4);
	
	wind_loop = scr_play_sound(sfx_windLoop,1,0,true,-4);
	
	surface_loop = scr_play_sound(sfx_waterSurfaceLoop,1,1,true,-4);
	
	
	//audio_falloff_set_model(audio_falloff_none);
	//background_music = scr_play_sound(water_loop_test_potluck2,1,0,true,global.musicEmitter);
	//audio_falloff_set_model(audio_falloff_exponent_distance);
	background_music = scr_play_sound(music_SH,1,0,true,-4);//scr_play_sound(water_loop_test_potluck2,1,0,true,-4);
	
	surface_music = scr_play_sound(music_surfaceLoop01,1,0,true,-4);
	
	eraserHeadLoop = scr_play_sound(sfx_eraserhead_loop01,1,0,true,-4);
	
	
	with (obj_player){
		engineSound = scr_play_sound(sfx_subEngineLoop01,1,engineGain * (1-global.endGameGain), true, -4);	
	}
	soundLoaded = true;
}



// underwater bassy noise #1
// exponential gain
waterGain = clamp(obj_player.y - global.waterLevel, 0, WATER_TOP_DISTANCE);
waterGain = (waterGain * waterGain) / WATER_TOP_DISTANCE / WATER_TOP_DISTANCE;
audio_sound_gain(underwater_loop,waterGain * global.sfxVolume * (1-global.endGameGain),0);
audio_sound_gain(underwater_loop2, waterGain * global.sfxVolume * (1-global.endGameGain), 0);


// surface wind
var WINDGAIN = clamp(sign((global.waterLevel+8) - obj_player.y),0,1);
audio_sound_gain(wind_loop,0.002 * WINDGAIN * global.sfxVolume * (1-global.endGameGain),100);

// surface water
audio_sound_gain(surface_loop,WINDGAIN * global.sfxVolume * (1-global.endGameGain),50);

// surface_music
var SURFACE_MUSIC_GAIN = clamp(sign(global.waterLevel + 8 - obj_player.y), 0, 1)
audio_sound_gain(surface_music,SURFACE_MUSIC_GAIN * global.sfxVolume * (1-global.endGameGain),300);

// seagulls
if (!audio_is_playing(gulls_sounds)){
	gullsTimer--;
	if (gullsTimer <= 0){
		gulls_sounds = choose(sfx_gulls02, sfx_gulls01); // assign a new random sound from a set
		scr_play_sound(gulls_sounds, 1, 1* (1-global.endGameGain), false, -4);
	}
}
else {
	audio_sound_gain(gulls_sounds, 0.5 * WINDGAIN * (1-global.endGameGain), 50);
	gullsTimer = irandom_range(1000,2000);
}


//------------------------ music gain ------------------------
musicGain = clamp(obj_player.y - (global.waterLevel + music_offset_y), 0, music_distance);
musicGain = (musicGain * musicGain) / music_distance / music_distance;


if (musicGain <= 0) audio_pause_sound(background_music);
else audio_resume_sound(background_music);

audio_sound_gain(background_music, musicGain * global.musicVolume * 0.01 * (1 - global.endGameGain), 100);


//audio_emitter_position(global.musicEmitter,view_xview + 0.5*view_wview, view_yview + 0.5*view_hview, 0)
audio_emitter_position(global.musicEmitter,obj_player.x,obj_player.y,0);



//audio_group_set_gain(ag_sfx,global.sfxVolume * (1-global.endGameGain),100);
//audio_group_set_gain(ag_sfx_ambiance,global.sfxVolume * (1-global.endGameGain),100);


var playerDisappeared = !obj_player.hidePlayer;

playerDistance = clamp(1 - 2*clamp(((obj_player.y-global.waterLevel) / (room_height)),0, 1),0, 1);

var eraserMaxGain = 0.25 * (playerDistance)

var eraserheadGain = eraserMaxGain * playerDisappeared * global.endGameGain;
audio_sound_gain(eraserHeadLoop, eraserheadGain,0);
