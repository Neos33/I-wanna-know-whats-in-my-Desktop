/// @description 
if audio_emitter_exists(emit)
{
	audio_emitter_free(emit);
	audio_stop_sound(sndLaserStreamLoop);
}