for (var i = 0; i < 4; ++i) {
    for (var n = 0; n < 4; ++n) {
	    var _copy = Create(x+32*i,y+32*n,layer,object_index,sprBlock_Texture_Center,6,0,,,,,);
		_copy . trigger = trigger;
		_copy . groundSFX = (n == 0) ? "Concrete" : "";
		
		with _copy
		{
			contraption = function()
			{
				instance_destroy();	
			}
		}
	}
}

instance_destroy();