contraption = function()
{
	with instStageJebaited
	{
		sprite_index = sprPandaLUL;	
		sprite = sprite_index;
		var _w = sprite_get_width(sprite);
		var _h = sprite_get_height(sprite);
		image_xscale = width / _w;
		image_yscale = height / _h;
		//image_xscale = width / 256;
		//image_yscale = height / 256;
		name = "LUL";
		//id = "PANDA";
	}
}