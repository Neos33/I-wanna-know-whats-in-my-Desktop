for (var i=0; i<4; i++){
	for (var j=0; j<3; j++)
	{
		var _block = instance_create_layer(x+32*i,y+32*j,layer,object_index);
		_block . sprite_index = sprBlock_Texture_Center;
		_block . image_speed = 0;
		_block . image_index = (j == 0) ? 4 : 5;
		//_block . pathID = (i < 2) ? pthLeft : pthRight;
		_block . pathID = pthDown;
		_block . pspd = 10;
		_block . destroy = true;
		_block . pScale = 2;
		_block . trigger = trigger;
	}
}



instance_destroy();