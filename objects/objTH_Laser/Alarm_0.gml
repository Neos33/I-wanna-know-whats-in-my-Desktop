/// @description Scale in
if image_yscale < 2
{
	//image_yscale += 0.05;
	image_yscale = lerp(image_yscale,2,0.20);
	alarm[0] = 1;
}
else
{
	alarm[1] = duration;	
	maskAlert = false;
}

if makeSound
{
	//play_sfx(sndLen_Laser2);
	audio_stop_sound(sndLen_Laser2);
	audio_play_sound(sndLen_Laser2,0,false);
	audio_play_sound_on(emit,sndLaserStreamLoop,true,1);
	audio_sound_gain(sndLaserStreamLoop,0,0);
	audio_sound_gain(sndLaserStreamLoop,1,9000);
	makeSound = false;
}