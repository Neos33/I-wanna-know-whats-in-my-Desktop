//Define(16,16,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);

for (var i = 0; i < 4; ++i) {
    for (var j = 0; j < 2; ++j) {
		var _block = Create(x+32*i,y+32*j,"Collisions",object_index,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);
		_block . trigger = trigger;
		with _block 
		{
			contraption = function()
			{
				alpha_to_destination(1,0,,,,10);
				//instance_destroy();	
			}
		}
	}
}

instance_destroy();