/// @description 
if audio_sound_get_gain(global.current_music) == 0 and touch
{
	//audio_stop_sound(global.current_music);
	instance_destroy();
}