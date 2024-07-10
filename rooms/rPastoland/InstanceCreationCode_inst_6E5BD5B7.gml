image_speed = 0;
visible = false;

// Create Blocks
#region Blocks
var _StartX = 3776+16;
var _StartY = 448+16;
for (var i = 0; i < 6; i++)
{
	blocks[i] = Create(_StartX+32*i,_StartY,"Triggers",objBlockTrgMove,sprBlock_Texture_Center,5,0,1,1,0,c_white,1);
	blocks[i] . jank = false;
	
	blocks[i+6] = Create(_StartX+32*i,_StartY+32,"Triggers",objBlockTrgMove,sprBlock_Texture_Center,5,0,1,1,0,c_white,1);
	blocks[i+6] . jank = false;
	
	blocks[i+12] = Create(_StartX+32*i,_StartY+32*2,"Triggers",objBlockTrgMove,sprBlock_Texture_Center,5,0,1,1,0,c_white,1);
	blocks[i+12] . jank = false;
	
	blocks[i+18] = Create(_StartX+32*i,_StartY+32*3,"Triggers",objBlockTrgMove,sprBlock_Texture_Center,5,0,1,1,0,c_white,1);
	blocks[i+18] . jank = false;
	
	blocks[i+24] = Create(_StartX+32*i,_StartY+32*4,"Triggers",objBlockTrgMove,sprBlock_Texture_Center,5,0,1,1,0,c_white,1);
	blocks[i+24] . jank = false;
	
	blocks[i+30] = instance_create_layer(_StartX-16+32*i,_StartY-16+32*5,"Killers",objSpikeDown);
	blocks[i+30] . sprite_index = sprS1_SpikeDown;
	//blocks[i+30] . image_alpha = .6;
}
#endregion

thwomp_fall = new trigger_dynamic();
//thwomp_rise = new trigger_dynamic();

thwomp_fall.action_begin = function()
{
	//blocks = noone;
	timer = 0;
}
thwomp_fall.action_step = function()
{
	timer++;
	switch timer
	{
		case 1:
			play_sfx(sndThwomp);
			image_index = 1;
			visible = true;
			path_start(pthDown,10,path_action_stop,false);
			path_scale = 12;
			
			// Move blocks as well
			var _total = array_length(blocks);
			for (var i = 0; i < _total; i++)
			{
				with blocks[i]
				{
					path_start(pthDown,10,path_action_stop,false);
					path_scale = 12;
				}
			}
			
			//Create trigger if you go back (only in twicetwice)
			with instPoppoSurvival
			{
				if mode == 1
				{
					var _trg = instance_create_layer(3552,992,"Triggers",objTriggerTouch);
					_trg . trigger = 20;
					_trg . image_xscale = 2;
					_trg . soundID = sndBlockChange;
				}
			}
		break;
		
		case 100:
			//set_next_trigger(thwomp_rise);
			image_index = 0;
			path_start(pthUp,3,path_action_stop,false);
			path_scale = 12;
			
			var _total = array_length(blocks);
			for (var i = 0; i < _total; i++)
			{
				with blocks[i]
				{
					path_start(pthUp,3,path_action_stop,false);
					path_scale = 12;
				}
			}
		break;
		
		case 1152:
			visible = false;
		break;
	}
	
}
/*thwomp_rise.action_begin = function()
{
	timer = 0;	
	trigger++;
	global.basicTrigger[trigger] = false;
}
thwomp_rise.action_step = function()
{
	timer++;
	switch timer
	{
		case 1:
			image_index = 0;
			path_start(pthUp,3,path_action_stop,false);
			path_scale = 12;
			
			var _total = array_length(blocks);
			for (var i = 0; i < _total; i++)
			{
				with blocks[i]
				{
					path_start(pthUp,3,path_action_stop,false);
					path_scale = 12;
				}
			}
		break;
	}
}*/
init_trigger(thwomp_fall,1);

