/// @description Reset Game (F2)
if (global.game_started) {
    restart_game();
    save_game(false);
	global.game_started = false;
	global.resetAllowed = true;
	global.lastCutsceneComplete = false;
	audio_sound_gain(global.current_music,1,1000);
}
save_config();
instance_destroy(objPlayer);

room_goto(rTitle);

#region Online
//online_disconnect();
//buffer_delete(__ONLINE_buffer);
#endregion
