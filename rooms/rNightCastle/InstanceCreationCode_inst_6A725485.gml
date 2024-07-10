visible = false;

contraption = function()
{	
	for (var i = 0; i < 2; ++i) {
	    // code here
		var _blockL = Create(x-160,y+160+32*i,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,0);
		_blockL . visible = true;
		
		var _blockR = Create(x,y+160+32*i,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,0);
		_blockR . visible = true;
		
		with _blockL
			alpha_to_destination(0,1,,,,30);
			
		with _blockR
			alpha_to_destination(0,1,,,,30);
	}
	
	with instGate_P2_D
	{
		var _s = Create(x,y,"Killers",objDummy,sprite_index,,,,,,,);
		with _s { alpha_to_destination(1,0,,,,30); }
		instance_destroy();	
	}
	
	with instGate_P2_U
	{
		var _s = Create(x,y,"Killers",objDummy,sprite_index,,,,,,,);
		with _s { alpha_to_destination(1,0,,,,30); }
		instance_destroy();	
	}
}