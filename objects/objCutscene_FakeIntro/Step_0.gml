/// @description 
var cam = camera_properties(0);
t++;

switch t
{
	case 1:
		view_position_destination(cam.view_x,cam.view_y,-512*2,-288*2,false,animCurve_Cubic,0,150);
		view_size_destination(cam.view_w,cam.view_h,1024*3,576*3,false,animCurve_Cubic,0,150);
	break;
	case 200:
		with objMonitorShutdown
		{
			visible = true;	
			image_alpha = 1;
			//shutdown = true;
			x = 512;
			y = 287.5001;
			sprite_index = sprWhiteSquareCenter;
			scale_to_destination(56.25,30,0,-30,true,animCurve_Cubic,0,20);
		}
		play_sfx(sndTV_Off);
		instance_destroy(objWindowsFakeBarCutscene);
		instance_destroy(objBGFakeCutscene);
	break;
	
	case 300:
		play_sfx(sndBlockChange);
		view_position_destination(cam.view_x,cam.view_y,0,0,false,animCurve_Cubic,2,100);
		view_size_destination(cam.view_w,cam.view_h,1024,576,false,animCurve_Cubic,2,100);
		
		//with objMonitorScuff
		//{
		//	alpha_to_destination(1,0,false,animCurve_Normal,0,100);
		//}
		
	break;
	
	case 500:
		var _load = instance_create_layer(1024/2,576/2+128,"Controllers",objLoadingIntro);
		_load . radius = 48;
		with _load
			alpha_to_destination(0,1,false,,,60);
	break;
	
	case 550:
		showReference(1024-150,100,"Fangame","1","I wanna Classic",sprRef_Classic);
	break;
	
	case 600:
		story = instance_create_layer(0,0,"Controllers",objText);
	break;
	
	case 1500:
		var _roomTarget = rStageInternetPreviewEmpty;
		room_goto(_roomTarget);
		
		var transition = instance_create_depth(x,y,0,objStageTransition);
		transition . roomTo = _roomTarget;
		transition . autoSave = true;
		transition . alarm[0] = 1;
		instance_destroy(objPlayer);
		audio_sound_gain(global.current_music,1,0);
	break;
}
