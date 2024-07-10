/// @description 

timer++;

// Skip sequence
if timer < 1599 and is_pressed(ord("S"))
	timer = 1599;


Record(ord("X"),timer);
#region Timeline
switch timer
{
	case 1:
		with objPlayer
			frozen = true;	
	break;
	
	// Show black borders
	case 2:
		showShadows = true;
	break;
	
	// Camera manipulation
	case 4:
		/*instance_deactivate_object(objCamera2);
		var cam = camera_properties(0);
		view_position_destination(cam.view_x,cam.view_y,
					room_width/2-cam.view_w/2,room_height-cam.view_h,
					false,animCurve_Cubic,2,100);*/
					
		with objCamera2 { obj = objGemRockPlace; };
	break;
	
	
	// Item one by one
	// 1st item
	case 250:
		place_gems(itemIndex,-32,0,100);
		play_sfx(sndPlacingGemsIntoRock,3);
		itemIndex++;
	break;
	// 2nd item
	case 300:
		place_gems(itemIndex,0,32,100);
		play_sfx(sndPlacingGemsIntoRock,3);
		itemIndex++;
	break;
	// 3rd item
	case 350:
		place_gems(itemIndex,32,0,100);
		play_sfx(sndPlacingGemsIntoRock,3);
		itemIndex++;
	break;
	// 4th item
	case 400:
		place_gems(itemIndex,0,-32,100);
		play_sfx(sndPlacingGemsIntoRock,3);
		itemIndex++;
	break;
	
	case 500:
		play_sfx(sndGemsPowerBeam,2.5);
	break;
	
	
	case 550:
		play_sfx(snd_LB_Eye_laser);
		var _TargetX = 1536;
		var _TargetY = 1568;
		var Laser = Create(_TargetX,_TargetY,"Miscellaneous",objCherry,sprCherry,0,0,,,,,);
		Laser . visible = false;
		with Laser moveY_to_position(,,room_height/2,false,,,100);
		
		with objCamera2 obj = Laser;
		
		luz_de_dios = Create(_TargetX,_TargetY,"Miscellaneous",objDummy,sprSuzumiLaser,0,0,1,1,90,c_white,1);
		with luz_de_dios scale_to_destination(0,.5,932,3,false,animCurve_Elastic,0,150);
	break;
	
	
	// She appears
	case 750:
		var _TargetX = 1536;
		she = Create(_TargetX,room_height/2,copyDepth("Miscellaneous")-1,objDummy,sprSuzumiNormalIdle,0,1/5,1,1,0,c_black,1);
		//with she alpha_to_destination(0,1,false,animCurve_Cubic,0,200);
		
		var _reveal = Create(_TargetX,room_height/2 + 39,copyDepth("Miscellaneous")-2,objCherryDupe,sprGradientTransparent_1x2,0,0,1,32,270,c_white,1);
		_reveal . vspeed = -2;
		
		_reveal = Create(_TargetX,room_height/2 + 39,copyDepth("Miscellaneous")-2,objCherryDupe,sprPoint2x1,0,0,100,32,90,c_white,1);
		_reveal . vspeed = -2;
		
		// Destroy stuff placed of the bottom
		instance_destroy(objItemsShows);
		instance_destroy(objGemGotShowcase);
		instance_destroy(objGemRockPlace);
		
		//Audio
		//play_sfx(snd_LB_SheAppears,2);
		
		var _tempSound = audio_play_sound(snd_LB_SheAppears, 0, false);
		audio_sound_gain(_tempSound, 1.5, 0);
		audio_sound_pitch(_tempSound,.75);
	break;
	
	case 1000:
		with she moveX_to_position(,,144,true,animCurve_Cubic,2,60);
		alarm[0] = 1;
	break;
	
	case 1100:
		objCamera2.y = room_height - 576/2
		instance_deactivate_object(objCamera2);
		play_sfx(snd_LB_Intro_LaserGone,1);
		//instance_destroy(objCamera2);
		with luz_de_dios scale_to_destination(,,0,-3,true,animCurve_Elastic,0,40);
		var cam = camera_properties(0);
		with she moveY_to_position(,,256+256+48,true,animCurve_Expo,2,300);
		view_position_destination(cam.view_x,cam.view_y,0,256*2+48,true,animCurve_Cubic,2,300);
	break;
	

	// Boss Spawn
	case 1500:
		play_sfx(snd100OJ_Appear);
		alarm[0] = 0;
		if exists(she)
		{
			var s = instance_create_layer(she.x, she.y, "Controllers", objLastBoss_Introduction);
			s . sprite_index = sprSuzumiNormalIdle;
			s . image_alpha = 1;
		}
		instance_destroy(she);	
		instance_destroy(luz_de_dios);
		
		with objWindAmbienceMusic
			audio_sound_gain(windAmbience,0,1000);
		
	break;
	
	case 1600:
		// Create this again if player had skipped when boss is created
		if !instance_exists(objLastBoss_Introduction)
			instance_create_layer(1664, room_height/2 + 512 +48, "Controllers", objLastBoss_Introduction);
			
		if exists(she) instance_destroy(she);	
		if exists(luz_de_dios) instance_destroy(luz_de_dios);
		
		// Destroy again if the player skipped the cutscene
		instance_destroy(objItemsShows);
		instance_destroy(objGemGotShowcase);
		instance_destroy(objGemRockPlace);
		instance_destroy(objWindAmbienceMusic);
			
			
		// Play BGM and save the game
		play_music(musLastBoss,true);
		audio_set_loop(false);
		with objPlayer
			frozen = false;	
			
		global.lastCutsceneComplete = true;
		showShadows = false;
		save_game(true);
		
		instance_activate_object(objCamera2);
		objCamera2.obj = objPlayer;
		//instance_destroy(objCamera2);
		/*	var _point1 = objLastBoss_Introduction;
			var _point2 = objPlayer;
			var _dist = point_distance(_point1.x,_point1.y,_point2.x,_point2.y);
			var _dire = point_direction(_point1.x,_point1.y,_point2.x,_point2.y);
			var _x = _point1.x + lengthdir_x(_dist / 2,_dire);
			var _y = _point1.y + lengthdir_y(_dist / 2,_dire);*/
			
		var cam = camera_properties(0);
		//view_position_destination(cam.view_x,cam.view_y,objPlayer.x - 1024/2,room_height-cam.view_h,false,animCurve_Cubic,0,50);
	break;
	
	case 1750:
		var cam = camera_properties(0);
		var _xx = cam.view_x + cam.view_w / 2;
		var _yy = cam.view_y + cam.view_h / 2;
		// Have to check if the player press the "Skip" button
		if instance_exists(objLastBoss_Introduction)
		{
			_xx = objLastBoss_Introduction.x;
			_yy = objLastBoss_Introduction.y;
		}
		instance_create_layer(_xx, _yy, layer, objLastBoss);
		instance_destroy(objLastBoss_Introduction);
		instance_destroy();
		
	break;
}
#endregion


if showShadows
	cinematicScale = lerp(cinematicScale,1,0.15);
else
	cinematicScale = lerp(cinematicScale,0,0.15);
