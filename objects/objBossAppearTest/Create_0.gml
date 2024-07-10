/// @description 
alphaShadow = 0;
image_alpha = 0;

alarm[0] = 30;
audio_play_sound(se_SYNTHSWEEP_NEW, 0, false);
var s1 = instance_create_depth(x,y+64,depth-1,objSemiCircleAppearEff);
s1 . vspeed = -1;
s1 = instance_create_depth(x,y-64,depth-1,objSemiCircleAppearEff);
s1 . vspeed = 1;