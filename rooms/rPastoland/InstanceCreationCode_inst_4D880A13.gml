for (var i = 0; i < 5; ++i) {
    for (var n = 0; n < 3; ++n) {
	    var _block = Create(x+32*n,y+32*i,"Collisions",object_index,sprBlock_Texture_Center,5,0,1,1,0,,1);
		_block . trigger = trigger;
		with _block
		{
			contraption = function()
			{
				instance_destroy();
			}	
		}
	}
}


instance_destroy();