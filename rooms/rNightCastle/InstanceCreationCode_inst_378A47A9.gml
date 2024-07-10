for (var i = 0; i < 2; ++i) {
    for (var n = 0; n < 3; ++n) {
	    var _block = Create(x+32*i,y+32*n,"Killers",object_index,sprBlock_Texture_Center,6,0,,,,,);
		_block . trigger = trigger;
		
		with _block
		{
			contraption = function()
			{
				var _dummy = Create(x,y,layer,objDummy,,,,,,,,);
				with _dummy 
				{
					alpha_to_destination(1,0,,,,15);
				}
				instance_destroy();
			}
		}
	}
}



instance_destroy();