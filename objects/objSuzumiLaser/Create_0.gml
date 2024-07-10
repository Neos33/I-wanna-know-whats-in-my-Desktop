/// @description 
image_angle = random(360);

//setScale(6,.5);

t = 100;
duration = 250;
destroy = duration+10;
alarm[0] = t;

audio_stop_sound(sndLen_Laser1);
audio_play_sound(sndLen_Laser1,0,false);
//play_sfx(sndLen_Laser1,.25);
