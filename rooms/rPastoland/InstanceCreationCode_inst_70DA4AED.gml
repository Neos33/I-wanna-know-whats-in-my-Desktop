with objBlockTrgMove
{
	if trigger == 199
	{
		//x -= 1024;
		Define(-1024+16,16,sprBlock_Texture_Center,5,0,1,1,0,,);
		jank = false;
		groundSFX = "Dirt";
	}
}

contraption = function()
{
	with objBlockTrgMove
	{
		if trigger == 199
		{
			x += 1024;
			alpha_to_destination(0,1,,,,20);
		}
	}
	instance_destroy();	
}