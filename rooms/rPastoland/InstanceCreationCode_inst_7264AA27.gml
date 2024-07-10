depth -= 1;
for (var i = 0; i < 5; i++) {
	for (var k = 0; k < 4; k++)
	{
		var _inst = instance_create_layer(x+32*i,y+32*k,layer,object_index);
		_inst . sprite_index = sprBlock_Texture_Center;
		_inst . image_speed = 0;
		_inst . image_index = (k == 0) ? 4 : 5;
		_inst . depth = depth;
		_inst . trigger = trigger;
		_inst . pathID = pathID;
		_inst . pspd = pspd;
		_inst . pScale = pScale;
		_inst . jank = false;
	}
}

instance_destroy();