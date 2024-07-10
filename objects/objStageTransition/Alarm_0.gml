/// @description 
audio_sound_gain(global.current_music,0,0);

transition_step = 100;
//audio_sound_gain(global.current_music,1,transition_step*10);


screenFlash(depth,"out",transition_step,c_black);

global.resetAllowed = true;
