visible = false;
revealSave = new trigger_dynamic()
revealSave.action_begin = function()
{
	t = 0;
	dummy = -1;
}

revealSave.action_step = function()
{
	t++;
	switch t
	{
		case 1:
			dummy = instance_create_layer(x-48,y-32,"Instance_Under_Tiles",objDummy);
			play_sfx(sndMarioSmallJump,.8);
			with dummy 
			{
				sprite_index = sprNeosSave;
				image_speed = 0;
				move_to_position(,,0,-32,true,animCurve_Back,,30);	
			}
		
		break;
		
		case 31:	
			with instRevealTrueSave
			{
				y -= 32;
			}
			instance_destroy(dummy)
			instance_destroy();
		break;
	}
}

init_trigger(revealSave)