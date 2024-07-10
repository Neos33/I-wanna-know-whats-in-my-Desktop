/// @description 

time_sound = 0;
timer = 0;

function Play(_time_sound,_pitch)
{
	var _snd = sndBlockChange;
	audio_stop_sound(_snd);
	audio_sound_set_track_position(_snd, _time_sound);
	audio_play_sound(_snd, 0, false);
	audio_sound_pitch(_snd,_pitch);
	
	alarm[0] = get_frames(00.050);
}
