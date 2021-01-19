/// @function scr_play_sound(soundID, pitch, gain, looping, audioEmitterID)
/// @description extended sound playing function for audio emitters
/// @param {real} soundID The index of the sound effect, or its name in the resource tree
/// @param {real} pitch The pitch of the sound, where 1 is the original pitch
/// @param {real} gain The volume of the sound, where 1 is 100% original gain
/// @param {real} looping 
/// @param {real} audioEmitterID Which audioEmitter to play the sound on (leave blank for main emitter)
function scr_play_sound() {

	var SOUND_INDEX = argument[0];
	var SOUND_PITCH = argument[1];
	var GAIN = argument[2];
	var LOOPING = argument[3]
	var AUDIOEMITTER = noone;
	var SOUNDNAME = audio_get_name(SOUND_INDEX);

	// if an audio emitter is supplied, play the sound on the emitter in 3D space
	if (argument_count> 4) {
		AUDIOEMITTER = argument[4];
	}
	if (AUDIOEMITTER == noone) {
	    mySound = audio_play_sound(SOUND_INDEX,10,LOOPING);
	}
	else {	
	    mySound = audio_play_sound_on(AUDIOEMITTER,SOUND_INDEX,LOOPING,10);
	}

	audio_sound_pitch(mySound, SOUND_PITCH);
	audio_sound_gain(mySound,GAIN,0);

	return mySound;


}
