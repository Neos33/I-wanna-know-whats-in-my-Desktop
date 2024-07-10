//Touches screen border
if (global.outside_kills && outside_room()) {
	kill_player();
}

// Attach the audio listener to Player
audio_listener_set_position(0,x,y,0);