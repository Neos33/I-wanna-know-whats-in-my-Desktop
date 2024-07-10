/// @description 

// Inherit the parent event
event_inherited();

mode = 0;

function create_laser(xx,yy,time_to_be_killer,time_duration)
{
	//play_sfx(sndLen_Laser1);
	audio_stop_sound(sndLen_Laser1);
	audio_play_sound(sndLen_Laser1, 0, false);
	var _depth = copyDepth("Tiles_Trap2") + 1;
	var inst = instance_create_depth(xx,yy,_depth,objTH_Laser);
		inst . sprite_index = sprTH_LaserRed;
		inst . image_angle = 270;
		inst . alarm[0] = time_to_be_killer;
		inst . duration = time_duration;
}
