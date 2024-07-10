visible = false;

contraption = function()
{
	//Create blocks 
	var _block = Create(3984,944,"Killers",objBlock,sprBlock_Texture_Center,5,0,1,1,0,,1);
	_block . visible = true;
	_block = Create(3984,944+32,"Killers",objBlock,sprBlock_Texture_Center,5,0,1,1,0,,1);
	_block . visible = true;
	
	// Create visible trigger and arrows?
	Create(3104,768,"Triggers",objDummy,sprTrigger,0,0,1,3,0,,);
	
	//Create(3104+32,764,"Triggers",objArrowShow,sprArrow,0,0,1,1,180,,,);
	Create(3152,816,"Triggers",objArrowShow,sprArrow,0,0,1,1,180,,,);
	//Create(3104+32,764+64,"Triggers",objArrowShow,sprArrow,0,0,1,1,180,,,);
	
	global.triggersPersistent[4] = true;
	instance_destroy();
}