/// audio listener step event

// make the game's audio listener (ears!) follow the player position
audio_listener_position(x,y,0);

// make the mainEmitter follow the player so that all sounds
// played through it have a distance of 0 from the game's audio listener
audio_emitter_position(global.mainEmitter,x,y,0);