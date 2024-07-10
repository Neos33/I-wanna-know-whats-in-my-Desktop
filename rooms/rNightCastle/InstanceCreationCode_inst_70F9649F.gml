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
			var _blockBaseball = Create(2176+16,1536+16,"Triggers",objBlockTrgMove,sprBlock_Texture_Center,6,0,1,1,0,,1);
			_blockBaseball . jank = false;
			_blockBaseball . trigger = 199;
			_blockBaseball . depth = copyDepth("Tiles_Shadow") + 1;
			
			with _blockBaseball
			{
				move_to_position(,,0,-32*6 / 2,true,,,10);
				scale_to_destination(,,1,7,false,,,10);
			}
			play_sfx(sndWorms_Igotya);
		break;
		
		case 20:
			with objBlockTrgMove
			{
				if trigger == 0
				{
					alpha_to_destination(1,0,,,,15);	
				}
			}
		break;
		
		case 76:
			/*with objPlayerFisted
			{
				speed = 0;
				gravity = 0;
			}*/
		break;
		
		case 90: // Cosmo speaking facts
			var _cosmo = instance_create_layer(2432,1600,"Player",objDummy);
			_cosmo . sprite_index = sprCosmoingFacts;
			_cosmo . image_speed = 0;
			with _cosmo 
			{
				alpha_to_destination(0,1,false,,,70);	
			}
			play_sfx(sndBlockChange);
			
			
			with instSaveFake_Right
			{
				sprite_index = sprSaveFall;
				image_index = 0;
				scale_to_destination(,,5.5,5.5,false,animCurve_Cubic,2,30);
				move_to_position(,,-64-8,-128-16,true,animCurve_Cubic,2,30);
				depth = copyDepth("Player") - 1;
			}
			play_sfx(sndSMB_PowerUp,.6);
		break;
		
		case 160:
			with objDummy
			{
				if sprite_index == sprCosmoingFacts
				{
					image_index = 1;	
				}
			}
			with instSaveFake_Right
			{
				image_index = 3;
			}
			
			play_sfx(sndVineBoom);
		break;
		
		case 180:
			with instSaveFake_Right
			{
				moveY_to_position(,,160,true,animCurve_Back,1,250);
			}
			play_sfx(sndCherry,5);
		break;
		
		case 440:
		if exists()
		{
			var _hub = instance_create_depth(objPlayer.x,objPlayer.y,0,objWindows_Icon);
			_hub . visible = false;
			_hub . name = "";
			_hub . roomTo = rStageInternetTransition;
			_hub . warp_x = 2048;
			_hub . warp_y = 480;
			
			
			instance_destroy(objG_GridBG);
			instance_destroy();
		}
		break;
		

	}
}

init_trigger(myTrap);

