visible = false;
// Spawn arrow
contraption = function()
{
	
	for (var i = 0; i < 3; ++i) {
    // code here
	var _block1 = Create(x,y-128+32*i,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,0);
	_block1 . trigger = trigger;
	_block1 . visible = true;
	
	var _block2 = Create(x-96,y-128+32*i,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,0);
	_block2 . trigger = trigger;
	_block2 . visible = true;
	with _block1
	{
		alpha_to_destination(0,1,,,,30);
	}
	with _block2
	{
		alpha_to_destination(0,1,,,,30);
	}
}
	
	//instance_create_layer(x+32,y-128-80,"Collisions",objArrowShow);
	if !global.triggersPersistent[1] 
	{
		with instFirstArrow
		{
			visible = true;
			alpha_to_destination(0,1,,,,40);
		}
		global.triggersPersistent[1] = true;
	}
	instance_destroy();
}