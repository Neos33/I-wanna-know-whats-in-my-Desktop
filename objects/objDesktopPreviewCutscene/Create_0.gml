/// @description 
t = 0;
audio_sound_gain(global.current_music,1,1000);
apply_camera_settings(view_camera[0],0,0,room_width,room_height);

if room == rStageInternetPreviewEmpty
	cutscene = 1;
else
	cutscene = 0;