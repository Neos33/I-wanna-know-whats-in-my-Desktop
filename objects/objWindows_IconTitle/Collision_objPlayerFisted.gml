if !has_entered and roomTo != noone
{
	var cam = camera_properties(0);
	instance_create_layer(cam.view_x,cam.view_y,"Controllers",objAlundraTransition);
	screenFlash(-10,"out",20,,.6);
	play_sfx(sndAlundra_Enter_Dream);
	has_entered = true;
	
	alarm[0] = 50;
	with objPlayer 
	{
		x = other.x;
		y = other.y;
	}
	instance_destroy(other);
}
