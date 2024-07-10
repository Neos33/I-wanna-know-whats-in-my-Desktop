/// @description Timer setup

// Get view settings
var camCore = camera_properties(0);
var centerX = camCore.view_x + camCore.view_w / 2;
var centerY = camCore.view_y + camCore.view_h / 2;
#region Setup timer
if instance_exists(objPlayer)
{
    if t < 1800
        avoidance_Sync(BGM);
	else
	{
		audio_stop_sound(BGM);
		exit;
	}
}
else
{
    t = -1;
	audio_stop_sound(BGM);
	exit;
}
#endregion


#region Inputs Debug
if is_pressed(ord("S"))
{
	print(string_interp("case {0}:",string(t)));	
}
#endregion


switch (t) // Timer
{
	case 1:
		instance_deactivate_object(objG_Bullet);
		event_user(0);
		alarm[1] = 1;
		var platform = instance_create_layer(centerX-160,576-32,"Collisions",objGlucagonBlocks);
		platform . alarm[0] = 1;
		platform . visible = true;
		platform . image_xscale = 10;
		
		//Save original view values
		instance_destroy(objBetterCamera);
		viewStartX = camCore.view_x;
		viewStartY = camCore.view_y;
		viewStartW = camCore.view_w;
		viewStartH = camCore.view_h;
		
		if exists()
		{
			var zoom_level = 8.5;
			zoom_start = zoom_level;
			//var _ratioX = (centerX) / (zoom_level * 2);
			//var _ratioY = (centerY) / (zoom_level * 2);
			var _ratioX = (1024/2) - (viewStartW/zoom_level / 2);
			var _ratioY = (576/2) - (viewStartH/zoom_level / 2);
			//instances_activation_update(_ratioX, _ratioY, cam.view_w/zoom_level, cam.view_h/zoom_level); 
			apply_camera_settings(camCore.view_cam,
					_ratioX,_ratioY,
					camCore.view_w/zoom_level,
					camCore.view_h/zoom_level);
		}
	break;
	
	case 60:
		showReference(1024-150,100,"Fangame","3","I wanna be the G",sprRef_G);
	break;
	
	#region Show partially the arrow/answer
		
		case 75:
		case 87:
		case 100:
		case 114:
		case 128:
		case 142:
		case 155:
			//if target_object != noone and instance_exists(target_object)
			//	target_object.alarm[0] = 1;
		//break;
		case 167:
		case 181:
		case 195:
		case 208:
		case 221:
		case 234:
		case 247:
		case 259:
			zoom_start-=.5;
			var zoom_level = zoom_start;
			//var _ratioX = (centerX) - (centerX / zoom_level);
			//var _ratioY = (centerY) - (centerY / zoom_level);
			//var _ratioX = (1024/2) - (camCore.view_w / 2);
			//var _ratioY = (576/2) - (camCore.view_h / 2);
			var _ratioX = (1024/2) - (viewStartW/zoom_level / 2);
			var _ratioY = (576/2) - (viewStartH/zoom_level / 2);
			//instances_activation_update(_ratioX, _ratioY, cam.view_w/zoom_level, cam.view_h/zoom_level); 
			apply_camera_settings(camCore.view_cam,
					_ratioX,_ratioY,
					viewStartW/zoom_level,
					viewStartH/zoom_level);
		break;
	#endregion
	
	// First Flower/Circle Shows from the center
	case 281: // First Flower/Circle Shows from the center
		barrage_make_shapes_Modified(centerX,centerY,objBulletsFlowerFirstBlue,5,0,270,200,20,true,2,true);
		
		var _color = color_get_hue(c_blue);
		var _colTransformed = make_color_hsv(_color,180,255);
		var mCircle = instance_create_layer(centerX,centerY,"MagicCircle",objG_MagicCircleBlue);
		mCircle . sprite_index = sprTrollface;
		mCircle . image_blend = _colTransformed;
		mCircle . target = 200*2;
	break;
	
	// 1st Flower going on
	case 385: // 1st Flower going on
		with objBulletsFlowerFirstBlue
			distance_going = false;
	break;
	
	// 1st Flower going back
	case 435: // 1st Flower going back
		with objBulletsFlowerFirstBlue
			distance_going = true;
	break;
	
	// Second Flower/Circle Shows from the center
	case 495: // Second Flower/Circle Shows from the center
		barrage_make_shapes_Modified(centerX,centerY,objBulletsFlowerFirstRed,5,0,90,290,30,true,2,true);
		
		var _color = color_get_hue(c_red);
		var _colTransformed = make_color_hsv(_color,180,255);
		
		var mCircle = instance_create_layer(centerX,centerY,"MagicCircle",objG_MagicCircleBlue);
		mCircle . target = (290+288) * 2;
		//mCircle . image_index = 1;
		mCircle . angleSPD = -1;
		mCircle . sprite_index = sprTrollface;
		mCircle . image_blend = _colTransformed;
		//mCircle . depth = 600;
	break;
	
	// 1st & 2nd Flower going on
	case 592: // 1st & 2nd Flower going on
		with objBulletsFlowerFirstBlue
			distance_going = false;
			
		with objBulletsFlowerFirstRed
			distance_going = false;
	break;
	
	// 1st & 2nd Flower going back
	case 644: // 1st & 2nd Flower going back
		with objBulletsFlowerFirstBlue
			distance_going = true;
			
		with objBulletsFlowerFirstRed
			distance_going = true;
	break;
	
	// Bullets rotate
	case 699:
		with objBulletsFlowerFirstBlue
			angleSPD = 1;
			
		with objBulletsFlowerFirstRed
			angleSPD = -1;
	break;
	
	case 1019:
		with objG_GridBG 
		{ 
			iluminate = true;
			color_randomize = false;
			darkTarget = 50;
		}
	break;
	
	// Flash within an alternate grid (ON, OFF, ON, OFF...etc)
	case 1020:
	case 1048:
	case 1076:
	case 1103:
	case 1128:
	case 1155:
	case 1181:
	case 1208:
		with objG_GridBG 
			darkTarget = 50;

		for (var i = 0; i < elements_width; ++i) {
		    for (var j = 0; j < elements_height; ++j) {
			    // code here
				var q = i + 1;
				q %= elements_width;
				var w = j + 1;
				w %= elements_height;
				
				if i mod 2 == indexTemp
				{
					if j mod 2 == 0
					{
						with elements[# i, j] 
							darkTarget = 90;
					}
					else
					{
						with elements[# q, j] 
							darkTarget = 90;
					}
				}
			}
		}
		// Next index
		indexTemp++;
		indexTemp %= 2;
	break;
	
	
	// Flower/Circles start fading out
	case 1227: 
		with objBulletsFlowerFirstBlue
			alarm[1] = 1;
		with objBulletsFlowerFirstRed
			alarm[1] = 1;
			
		with objG_MagicCircleBlue
			alarm[1] = 1;
	
		instance_activate_object(objG_Bullet);
		with objG_Bullet { regroup = true; }
	break;
	case 1397:
		with objTroll_Template { alarm[0] = 1; }
		with objG_Bullet { alarm[1] = 1; }
	break;
	
	case 1220:
		with objG_GridBG 
		{ 
			darkTarget = 40;
			//sat_iluminate = true;
			//satTarget = 40;
		}
	break;
	case 1221:
		var line = instance_create_layer(centerX,576,"Miscellaneous",objTempGridTrailFlash);
		line . image_xscale = 512;
		line . vspeed = -7;
	break;
	
	case 1426:
		play_sfx(sndTrollEcho,.8);
		with objTroll_Template
		{
			var _copy = Create(x,y,depth+1,objDummy,sprTrollface,0,0,1,1,0,c_white,1);	
			with _copy{
				alpha_to_destination(1,0,,,,200);
				scale_to_destination(,,3,3,false,,,200);
			}
			
			angle_to_destination(0,360,0,animCurve_Cubic,2,100);
		}
	break;
	
	case 1700:
		if exists()
		{
			var _hub = instance_create_depth(objPlayer.x,objPlayer.y,0,objWindows_Icon);
			_hub . visible = false;
			_hub . name = "";
			_hub . roomTo = rStageInternetTransition;
			_hub . warp_x = 2576;
			_hub . warp_y = 896;
			
			
			instance_destroy(objG_GridBG);
			instance_destroy();
		}
	break;
}
