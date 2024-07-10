visible = false;

jebaited = new trigger_dynamic();

jebaited.action_begin = function()
{
	t = 0;
}
jebaited.action_step = function()
{
	if exists()
		t++;
	else t = -1;
	
	switch t
	{
		case 5:
			play_sfx(sndSpikeTrap);
			with objSpikeUp
			{
				if inside_view(0)
					moveY_to_position(,,-128,true,,,5);
			}
			
		break
		
		case 15:
			//play_sfx(sndSpikeTrap);
			with objSpikeUp
			{
				if inside_view(0)
					moveY_to_position(,,160,true,,,10);
			}
		break;
		
		case 99:
			play_sfx(sndBreak);
			with objBlockTrgMove
			{
				if inside_view(0)
				{
					var _byeBlocks = Create(x,y,layer,objBlockTrgBrick,,,,,,,,);
					_byeBlocks . destroy = false;

					_byeBlocks . touched = true;
					_byeBlocks . alphaSpeed = .05;
					_byeBlocks . angleSpeed = 0;

					_byeBlocks . dire = 260+irandom(20);
					_byeBlocks . spd = irandom_range(3,6);
					_byeBlocks . gravi_push = .123;
					
					instance_destroy();
				}
					//move = false;
					//reverse = choose(-1,1);
					
			}
		break;
		
		case 100:
			//instance_destroy(objBetterCamera);
			instance_deactivate_object(objBetterCamera);
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,32*14,0,true,animCurve_Cubic,2,80);
		break;
		
		case 280:
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,-32*14,0,true,animCurve_Cubic,2,80);

		break;
		case 360:
			//instance_create_layer(0,0,"Controllers",objBetterCamera);
			instance_activate_object(objBetterCamera);
			instance_destroy();
		break;
	}
}


init_trigger(jebaited,1);