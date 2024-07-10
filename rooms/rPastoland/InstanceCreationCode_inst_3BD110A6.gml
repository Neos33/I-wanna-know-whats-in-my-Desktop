for (var i = 0; i < 4; i++)
{
	for (var j = 0; j < 2; j++)
	{
		var _inst = instance_create_layer(x+32*i,y+32*j,layer,object_index);
		_inst . image_speed = 0;
		_inst . image_index = 5;
		_inst . sprite_index = sprBlock_Texture_Center;
		_inst . trigger = trigger;
		_inst . pathID = (j == 0) ? pthUp : pthDown;
		_inst . pspd = 4 - i;
	}
}

instance_destroy();