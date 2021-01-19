///audio_emitter_create_ext(falloffmodel,falloff_ref_dist,falloff_max_dist,falloff_factor)
function audio_emitter_create_ext(argument0, argument1, argument2, argument3) {

	var FALLOFFMODEL = argument0;
	var FALLOFF_REF_DIST = argument1;
	var FALLOFF_MAX_DIST = argument2;
	var FALLOFF_FACTOR = argument3;



	myAudioEmitter = audio_emitter_create();
	audio_falloff_set_model(FALLOFFMODEL);
	audio_emitter_falloff(myAudioEmitter,FALLOFF_REF_DIST,FALLOFF_MAX_DIST,FALLOFF_FACTOR);



}
