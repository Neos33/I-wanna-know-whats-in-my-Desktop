contraption = function()
{
	for (var i = 0; i < 17; i++) {
		for (var j = 0; j < 18; j++)
		{
			var _reveal = instance_create_layer(x+32*i,y+32*j,"Miscellaneous",objBlockTrgBrick);
			//_reveal . touched = true;
			_reveal . angleSpeed = random_range(-6,6);
			_reveal . alphaSpeed = random_range(0.01,0.04);
			_reveal . sprite_index = sprBlock_Texture_Center;
			_reveal . image_index = 5;
			_reveal . dire = irandom(360);
			_reveal . spd = random_range(2,4);
			_reveal . gravi_push = .123;
		}
	}
	instance_destroy();
}