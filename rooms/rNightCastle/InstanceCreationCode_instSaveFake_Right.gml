image_speed = 0;

contraption = function()
{
	play_sfx(sndBreak);	
	image_index = 1;
	
	with objBlockTrgMove
	{
		if inside_view(0)
		{
			//var _adios = instance_create_layer(x,y,layer,objBlockTrgBrick);
			var _adios = Create(x,y,layer,objBlockTrgBrick,sprite_index,image_index,image_speed,,,,,);
			_adios . touched = true;
			_adios . dire = irandom_range(270-25,270+25);
			_adios . spd = random_range(1,4);
			instance_destroy();	
		}
	}
	
	// Remove 2nd jump
	with objPlayer
		jump_left = 0;
}