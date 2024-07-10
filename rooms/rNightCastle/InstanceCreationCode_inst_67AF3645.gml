visible = false;
myTrap = new trigger_dynamic();

myTrap.action_begin = function()
{
	t = 0;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
	
	switch t
	{
		case 1:
			global.triggersPersistent[5] = true;
			
			if exists(objS3_BrickKiller)
			{
				with objS3_BrickKiller
				{
					x = irandom_range(3488,3680-16);
					y = irandom_range(912,934);
					Define(0,0,,,,,,irandom_range(-360,360),c_white,1);	
				}
			}
			else
			{
				//play_sfx(sndSpecialMove);
				//var _x = irandom_range(3488,3680-16);
				//var _y = irandom_range(912,934);
				for (var i = 0; i < 8; ++i) {
				    for (var j = 0; j < 8; ++j) {
					    var _brick = instance_create_layer(3520+8+16*i,672+8+16*j,"Collisions",objS3_BrickKiller);
						_brick . image_angle = irandom_range(-360,360);
					}
				}
				
			}
			
			if exists(instBlockFart)
			{
				with instBlockFart
					y -= 96;
			}
			
			var _depthCheck = copyDepth("Miscellaneous") + 1; 
			with objSave
			{
				if depth == _depthCheck
					alpha_to_destination(1,0,,,,60);
			}
			
			with objTriggerSpikeDown
			{
				if trigger = 54
					instance_destroy();
			}
		break;
		
		case 3:
			with objTriggerTouch
			{
				if trigger >= 51 and trigger <= 59
					instance_destroy();
			}
			
			with objS3_BrickKiller
			{
				x = irandom_range(3488,3680-16);
				y = irandom_range(912,934);
				Define(0,0,,,,,,irandom_range(-360,360),c_white,1);	
				depth = copyDepth("Instance_Under_Tiles");
			}
			
			
			instance_create_layer(4608,896,"Collisions",objBlockSpring);
			with instBlockForSpring
			{
				var _block_next_to_me = instance_place(x+32,y,objBlock)
				instance_destroy(_block_next_to_me);
				instance_destroy();
			}
		break;
	}
}

init_trigger(myTrap);
