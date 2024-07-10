if global.triggersPersistent[3]
{
	//Recreate the blocks
	var _blockTop = Create(x-16,y-16,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);
	_blockTop . visible = true;
	var _blockBot = Create(x-16,y+16,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);
	_blockBot . visible = true;
	
	instance_destroy();
}

visible = false;


scene = new trigger_dynamic();

scene.action_begin = function()
{
	t = 0;	

}

scene.action_step = function()
{
	t++;
	switch t
	{
		case 1:
			with objPlayer
			{
				frozen = true;	
			}
			
			instance_deactivate_object(objBetterCamera);
			save_game(true);
		break;
		
		case 10:
			// Show blocks?
			var _blockTop = Create(x-16,y-16,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,0);
			_blockTop . visible = true;
			var _blockBot = Create(x-16,y+16,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,0);
			_blockBot . visible = true;
			
			with _blockTop alpha_to_destination(0,1,,,,30);
			with _blockBot alpha_to_destination(0,1,,,,30);
			
			play_sfx(sndBlockChange);
		break;
		
		case 30: // Save the game to avoid player restart whitout watching the full cutscene
			save_game(true);
		break
		
		// Move camera
		case 150:
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,-1024,0,true,animCurve_Cubic,2,100);
			
			audio_sound_gain(global.current_music,.5,2000);
		break;
		
		case 300:
			var cam = camera_properties(0);
			//view_position_destination(cam.view_x,cam.view_y,3072,0,true,animCurve_Cubic,2,150);
			var zoom_level = 3;
			var _platformReveal_positionY = 848;
			
			//var _ratioX = x - cam.view_w / (zoom_level * 2);
			var _ratioY = _platformReveal_positionY - cam.view_h / (zoom_level * 2); //platform y-axis
			view_position_destination(cam.view_x,cam.view_y,3072,_ratioY,false,animCurve_Cubic,2,100);
			view_size_destination(cam.view_w,cam.view_h,cam.view_w/zoom_level,cam.view_h/zoom_level,false,animCurve_Cubic,2,100);
			play_sfx(sndAmongUs_Reveal);
			
			
			// Platform message
			var _msg = instance_create_layer(3184+64,855,"Collisions",objDummy);
			_msg . sprite_index = sprTextIndicate_Platform;
			with _msg
			{
				alpha_to_destination(0,1,true,animCurve_Cubic,,80);	
				moveX_to_position(,,-64,true,animCurve_Cubic,,80);
			}
		break;
		
		case 385:
		case 396:
		case 411:
		case 426:
		case 437:
		case 452:
		case 466:
		case 500:
			with objPlatform
			{
				if inside_view(0)
				{
					depth *= -1;	
				}
			}
		break;
		
		case 600:
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,3072,576,false,animCurve_Cubic,2,150);
			view_size_destination(cam.view_w,cam.view_h,1024,576,false,animCurve_Cubic,2,150);
			audio_sound_gain(global.current_music,1,2000);
			global.triggersPersistent[3] = true;
		break;
		
		case 750:
			var cam = camera_properties(0);
			view_position_destination(cam.view_x,cam.view_y,1024,0,true,animCurve_Cubic,2,150);
			
		break;
		
		case 900:
			//audio_sound_gain(global.current_music,.25,2000);
			instance_activate_object(objBetterCamera);
			with objPlayer
				frozen = false;
		break;
	}
}

init_trigger(scene);

