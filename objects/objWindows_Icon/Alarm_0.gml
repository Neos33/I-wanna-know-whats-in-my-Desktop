/// @description 

screenFlash(-100,"in",time_transition,c_black);
audio_sound_gain(global.current_music,0,time_transition*10+500);
alarm[1] = time_transition+10;
