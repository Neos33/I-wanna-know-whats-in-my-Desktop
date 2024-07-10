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
			var i = 0;
			repeat 2
			{
				var _blockLeft = Create(1872+32,1584+32*i,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
				_blockLeft . visible = true;
				with _blockLeft alpha_to_destination(0,1,false,,,20);
				
				var _blockRight = Create(2000,1584+32*i,"Killers",objBlock,sprBlock_Texture_Center,5,0,,,,,0);
				_blockRight . visible = true;
				with _blockRight alpha_to_destination(0,1,false,,,20);
				
				i++;
			}
			
			//instance_destroy();
		break;
		
		case 60:
			instance_destroy(objBetterCamera);
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,0,-64,true,animCurve_Cubic,2,60);
			instance_destroy();
		break;
	}
}

init_trigger(myTrap);