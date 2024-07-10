/// @description 
t++

if cutscene == 1  // Circle expanding
{
	switch t
	{
		case 1:
			with objPlayer 
			{
				frozen = true;
				visible = false;
			}
		break;
		
		case 200:
			play_sfx(sndCC_Area_Dark,1.1);
			gem[0] = Create(room_width/2,room_height/2,"Miscellaneous",objDummy,sprGem,0,0,1,1,0,c_white,1);
			gem[0] . hspeed = 6;
			gem[0] . friction = .1;
			gem[1] = Create(room_width/2,room_height/2,"Miscellaneous",objDummy,sprGem,1,0,1,1,0,c_white,1);
			gem[1] . hspeed = -6;
			gem[1] . friction = .1;
			gem[2] = Create(room_width/2,room_height/2,"Miscellaneous",objDummy,sprGem,2,0,1,1,0,c_white,1);
			gem[2] . vspeed = -6;
			gem[2] . friction = .1;
			gem[3] = Create(room_width/2,room_height/2,"Miscellaneous",objDummy,sprGem,3,0,1,1,0,c_white,1);
			gem[3] . vspeed = 6;
			gem[3] . friction = .1;
		break;
		
		case 350:
			play_sfx(sndCC_Magic_Dark,1.2);
			with gem[0] { friction = 0; move_to_position(,,2784+64,704+64,false,animCurve_Expo,2,200) }
			with gem[1] { friction = 0; move_to_position(,,96+64,160+64,false,animCurve_Expo,2,200) }
			with gem[2] { friction = 0; move_to_position(,,1952+64,288+64,false,animCurve_Expo,2,200) }
			with gem[3] { friction = 0; move_to_position(,,128+64,1408+64,false,animCurve_Expo,2,200) }
		break;
		
		case 600:
			play_sfx(sndCircleExpandIntro);
			instance_create_depth(x,y,0,objCircleRevealEverything);
			var _s = Create(0,0,"Controllers",objDummy,sprPoint1x1,0,0,room_width,room_height,0,c_white,0);
			with _s
			{
				alpha_to_destination(0,1,,,,200);
			}
		break;
		
		case 900:
			room_goto(rStageInternetZoomIn);
			with objPlayer instance_destroy();
		break;
	}
}
else // Zoom in
{
	switch t
	{
		case 1:
			with objPlayer 
			{
				frozen = true;
				//visible = false;
			}
			var s = Create(0,0,"Controllers",objDummy,sprPoint1x1,0,0,room_width,room_height,0,c_white,1);
			with s 
			{
				alpha_to_destination(1,0,false,animCurve_Normal,0,100);	
			}
			
		break;
		
		case 200:
			var _x = objPlayer.x - 1024/2;
			var _y = room_height - 576;;
			view_position_destination(0,0,_x,_y,false,animCurve_Cubic,2,200);
			view_size_destination(room_width,room_height,1024,576,false,animCurve_Cubic,2,200);
		break;
		
		case 400:
			room_goto(rStageInternetTransition);
			with objPlayer
			{
				frozen = false;	
			}
			//save_game(true);
		break;
	}
}