for (var i = 0; i < 6; ++i) {
   for (var n = 0; n < 4; ++n) {
       var _block = Create(x+32*i,y+32*n,layer,object_index,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);
	   _block . trigger = trigger;
	   with _block{
			contraption = function()
			{
				instance_destroy();	
			}
	   }
   }
}

contraption = function()
{
	// Wall at the left
	for (var i = 0; i < 7; ++i) {
	    // code here
		var _wall = Create(5424,1328+32*i,"Killers",objBlock,sprBlock_Texture_Center,6,0,1,1,0,,);
		_wall . visible = true;
	}	
	
	// Wall at the bottom
	for (var i = 0; i < 4; ++i) {
	    // code here
		var _wall = Create(5584+32*i,1680,"Killers",objBlock,sprBlock_Texture_Center,6,0,1,1,0,,);
		_wall . visible = true;
	}
	instance_destroy();
}
