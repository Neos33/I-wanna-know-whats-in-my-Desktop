visible = false;

contraption = function()
{

	with objThwompFurious
	{
		//vspeed = 10;
		path_start(pthDown,7,path_action_stop,false)
		path_scale = 32;
		setScale(18,-18);
	}
	var snd = audio_play_sound(sndThwomp,0,false);
	audio_sound_pitch(snd,.75);
	instance_destroy();
}