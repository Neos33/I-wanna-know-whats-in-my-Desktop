var i = 0;
repeat 3
{
	var _block = Create(x,y+32*i,"Collisions",object_index,sprBlock_Texture_Center,5,0,1,1,0,,1);
	_block . trigger = trigger;
	with _block
	{
		contraption = function()
		{
			instance_destroy();
		}	
	}
	i++;
}


instance_destroy();