/// @description animation grieta
if surf_index < 9
{
	surf_index += 1/2;
	alarm[2] = 1;
}
else
{
	audio_stop_sound(sndFloorCrack);	
}