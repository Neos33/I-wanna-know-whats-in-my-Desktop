for (var i = 0; i < 360; i+=360/32) {
	if not ((i > 70 and i < 110) or (i > 250 and i < 290))
	{
	
	var _x = x + lengthdir_x(32*6,i);
	var _y = y + lengthdir_y(32*6,i);
	
	var _s = instance_create_layer(_x,_y,layer,object_index);
	_s . sprite_index = sprSpikeBall_Normal;	
	}

}

instance_destroy();