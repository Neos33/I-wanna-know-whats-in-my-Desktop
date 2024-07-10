/// @description Fall from stool reference

// Inherit the parent event
event_inherited();

if is_pressed(ord("C"))
	print(timer);

switch (timer)
{
	case 1:
		global.resetAllowed = true;
		if instance_exists(objPlayer)
		{
			with objPlayer
			{
				visible = false;
				frozen = true;
				//y += -32;
			}
			instance_create_layer(objPlayer.x,objPlayer.y+32,"Player",objBlock);
			
			// Player copy
			var _copy = instance_create_layer(objPlayer.x,objPlayer.y,"Player",objS1_Save6_PlayerIntoTheBombs);
			_copy . image_xscale = objPlayer.xscale;
		}
		//if global.resetAllowed
		//	global.resetAllowed = false
		
		//audio_pause_sound(global.current_music);
		audio_sound_gain(global.current_music,0,1000);
		play_sfx(sndBlockChange);
		instance_destroy(objBetterCamera);
		audio_play_sound(musFallTheStool,0,false);
		
		// Camera setup
		var cam = camera_properties(0);
		if tag == "First_Pit"
		{
			//apply_camera_settings(cam.view_cam,cam.view_x+160+64,cam.view_y+576-576/3 - 48,1024/3,576/3);
			var _vx = 160+64;
			view_position_destination(cam.view_x,cam.view_y,_vx+6,576-576/3 - 32,true,animCurve_Cubic,0,60);
			view_size_destination(cam.view_w,cam.view_h,1024/3,576/3,false,animCurve_Cubic,0,60);
		}
		else
		{
			//apply_camera_settings(cam.view_cam,cam.view_x+432+160,cam.view_y+576-576/3 - 48,1024/3,576/3);
			var _vx = 432+160-16;
			view_position_destination(cam.view_x,cam.view_y,_vx+6,576-576/3 - 32,true,animCurve_Cubic,0,60);
			view_size_destination(cam.view_w,cam.view_h,1024/3,576/3,false,animCurve_Cubic,0,60);
		}
	break;
	
	case 90: audio_pause_sound(global.current_music); break;
	
	
	case 100:
		showReference(1024-150,100,"Fangame","2","I wanna Fall the Stool",sprRef_FallTheStool);
	break;
	
	case 2431:
		//play_sfx(sndBlockChange);
		with objBombCutscene
		{
			state_feeling = "WakeUp";	
		}
	break;
	
	//Eyes wide open and ! alert
	case 2519: 
	
		play_sfx(sndMGS_AlertSound) 
		with objBombCutscene
			instance_create_depth(x+16*image_xscale,y-8,depth+1,objMGS_Exclamation);
	
	break;
	
	case 2520:
	case 2525:
		with objBombCutscene
			bomb_anim_index++;
	break;
	
	case 2530:
	case 2535:
		with objBombCutscene
			bomb_anim_index--;
	break;
	
	case 2600:
		with objMGS_Exclamation
			alphaTarget = 0;
	break;
	
	case 2630:
	case 2635:
	case 2640:
	case 2645:
	case 2650:
	case 2655:
	case 2660:
	case 2665:
	case 2670:
	case 2675:
	case 2680:
	case 2685:
	case 2690:
	case 2695:
	case 2700:
		with objBombCutscene
			image_blend = (image_blend == c_white) ? c_red : c_white;
			
		play_sfx(sndCs16_c4_Click);
	break;
	
	//Transition to BOOM squad
	case 2730:
		instance_create_layer(x,y,"Controllers",objBoom_Squad)
	break;
	
	case 3144:
		var _xx = objS1_Save6_PlayerIntoTheBombs.x;
		var _yy = objS1_Save6_PlayerIntoTheBombs.y;
		
		// Camera local variables
		var cam = camera_properties(0);
		var _vpx = cam.view_x + cam.view_w / 2;
		var _vpy = cam.view_y + cam.view_h - 48;
		
		with objPlayer {
			x = _xx;
			y = _yy;
		}
		
		
		// Create explosion
		var _boom = instance_create_layer(_vpx,_vpy,"Player",objMetalSlug_Explosion);
		_boom . image_xscale = 1.25;
		_boom . image_yscale = 1.25;
		
		// Destroy everything else
		kill_player();
		instance_destroy(objBombCutscene);
		instance_destroy(objS1_Save6_PlayerIntoTheBombs);
		//instance_destroy();
		play_sfx(sndCS_BombExplode);
	break;
}
