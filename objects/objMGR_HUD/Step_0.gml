/// @description 
/*var currentPosition = audio_sound_get_track_position(BGM);
if canLoop
{
	if currentPosition > loopEnd
	{
		audio_sound_set_track_position(BGM, loopStart);
		print("Jumped to loop start");
	}
}
else
{
	if currentPosition > loopStart and currentPosition < loopEnd
	{
		audio_sound_set_track_position(BGM, loopEnd);
		print("Jumped to loop end");
	}	
}*/
avoidance_Sync(BGM);
if is_held(vk_space)
	game_set_speed(1000,gamespeed_fps);
else
	game_set_speed(roomSpeed,gamespeed_fps);
	

image_xscale = lerp(image_xscale,1,0.15);
image_yscale = image_xscale;