/// @description Audio emitter setup

emit = 0;

if soundID != noone
{
	emit = audio_emitter_create();
	audio_emitter_position(emit,x+x_offset,y+y_offset,0);
	audio_falloff_set_model(audio_falloff_exponent_distance);
	audio_emitter_falloff(emit,fallStart,maxDist,1);
	audio_play_sound_on(emit,soundID,true,1);
}
