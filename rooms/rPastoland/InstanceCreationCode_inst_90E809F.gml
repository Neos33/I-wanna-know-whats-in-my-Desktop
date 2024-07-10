visible = false;
reveal = new trigger_dynamic();

reveal.action_begin = function() 
{
	timer = 0;
}
reveal.action_step = function()
{
	timer++;
	if timer == 297
	{
		var _depth = copyDepth("Amogus");
		var i = 0;
		repeat (7)
		{
			spike[i] = instance_create_depth(x,y,_depth + 1, objSpikeRight);
			spike[i] . hspeed = 8;
			i++;
		}
	}
	if timer == 310
	{
		var i = 0;
		repeat (7)
		{
			with spike[i]
			{
				moveY_to_position(,,32*(i-3),true,animCurve_Elastic,,30);	
				//hspeed = 15;
			}
			i++;
		}
	}
	if timer == 340
	{
		var i = 0;
		repeat (7)
		{
			with spike[i]
			{
				gravity = .2;
				gravity_direction = 0;
			}
			i++;
		}
		instance_destroy();
	}
	
}

/*contraption = function()
{
	instance_create_depth(x,y,depth,objAmongUs_SpikeTrap);
	audio_sound_gain(global.current_music,0,600);
	image_blend = c_red;
	
	
	play_sfx(sndBreak);
	with objBlockTrgBrick touched = true;
}*/

init_trigger(reveal,1);