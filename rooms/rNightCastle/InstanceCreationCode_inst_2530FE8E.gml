
Define(0,0,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);
for (var i = 0; i < 4; ++i) {
    for (var j = 0; j < 3; ++j) {
	    // code here
		var _s = Create(x+32*i,y+32*j,"Killers",object_index,,,,,,,,);
		_s . trigger = trigger;
		with _s
		{
			contraption = function()
			{
				var _brick = Create(x,y,layer,objBlockTrgBrick,,,,,,,,);
				_brick . touched = true;
				_brick . alphaSpeed = .05;
				_brick . angleSpeed = 4;

				_brick . dire = 180 + irandom(180);
				_brick . spd = irandom_range(3,6);
				_brick . gravi_push = .123;

				instance_destroy();
			}
		}
	}
}

instance_destroy();