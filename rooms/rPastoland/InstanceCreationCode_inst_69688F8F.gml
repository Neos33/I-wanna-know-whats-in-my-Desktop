for (var i = 0; i < 2; i++)
{
	for (var j = 0; j < 4; j++)
	{
		var _inst = instance_create_layer(x + 32 * i, y + 32 * j, layer, object_index);
		_inst . image_speed = 0;
		_inst . sprite_index = sprBlock_Texture_Center;
		_inst . image_index = (j == 0) ? 4 : 5;
		_inst . trigger = trigger;
		_inst . pathID = (i == 0) ? pthLeft : pthRight;
		_inst . pspd = 12 - j * 2;
		_inst . destroy = true;
		_inst . groundSFX = (j == 0) ? "Dirt" : "";
	}
}

instance_destroy();
/*
terrain = "brown_grass";