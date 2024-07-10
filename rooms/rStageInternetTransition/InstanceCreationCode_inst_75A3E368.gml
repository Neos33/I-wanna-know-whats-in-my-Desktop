for (var i = 0; i < 6; ++i) {
    var _blockTrap = Create(x+32*i,y,layer,object_index,sprBlock_Texture_Center,7,0,1,1,0,,,);
	_blockTrap . trigger = trigger;
	with _blockTrap
	{
		contraption = function()
		{
			var _destroyed = Create(x,y,layer,objBlockTrgBrick,,,,,,,,);
			_destroyed . touched = true;
			_destroyed . dire = irandom(360);//irandom_range(270-50,270+50)

			instance_destroy();
		}
	}
}

instance_destroy();