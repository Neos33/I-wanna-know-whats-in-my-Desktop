// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_sfx(soundID, vol = 1, priority = 0)
{
	var sfx = audio_play_sound(soundID, priority, false);
	audio_sound_gain(sfx, vol, 0);
}