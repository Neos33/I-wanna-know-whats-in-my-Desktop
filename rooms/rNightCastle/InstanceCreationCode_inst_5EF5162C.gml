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
			var _cosmo = instance_create_layer(x,y,"Player",objDummy);
			_cosmo . sprite_index = sprCosmoingFacts;
			_cosmo . image_speed = 0;
			with _cosmo 
			{
				alpha_to_destination(0,1,false,,,100);	
			}
	
			reset_jumps();
			play_sfx(sndBlockChange);
			//instance_destroy();
		break;
		
		case 90:
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
			with instSaveFake_Right
			{
				//Change
				Create(x,y,depth,objBlockKiller,sprite_index,2,0,image_xscale,image_yscale,0,,,);
				instance_destroy();
			}
			
		break;
		
		case 180:
			with objBlockKiller
			{
				moveY_to_position(,,160,true,animCurve_Back,1,250);
			}
			play_sfx(sndCherry,3);
		break;
	}
}


init_trigger(myTrap);

