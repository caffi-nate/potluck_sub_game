// TODO: doesn't line up with how dialogue scrolls perfectly well
if (!typeWriterDone){
	dialogueTimer++;
	var SPEECH_SPEED = 2 // was 4
	var CHR = string_char_at(currentDialogue,cutoff);
	if ((dialogueTimer mod SPEECH_SPEED == 0) && 
		!is_special_character(CHR)
		&& CHR != " ")
		scr_play_sound(sfx_dialogue,1,0.1,0,-4);	// was 0.05 gain
}