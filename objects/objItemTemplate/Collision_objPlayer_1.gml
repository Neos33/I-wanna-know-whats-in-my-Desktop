if !collected
{
	global.items[$ type][num] = true;

	if (global.auto_save_items) {
		save_game(false);
	}

	play_sfx(sndGemCollect,.9);
	audio_stop_sound(soundID);
	collected = true;
}
//instance_destroy();