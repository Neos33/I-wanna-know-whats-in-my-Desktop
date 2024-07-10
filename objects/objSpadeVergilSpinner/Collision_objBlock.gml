/// @description 


if !stuck
{
	// Move a few frames to look like it being stuck
	x += lengthdir_x(speed,image_angle);
	y += lengthdir_y(speed,image_angle);
	
	speed = 0;
	gravity = 0;
	
	if inside_view(0)
		play_sfx(sndMvc3_VergilSwish,1/3);
		
	stuck = true;
	alarm[0] = 10;
}