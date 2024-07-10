/// @description Insert description here
// You can write your code in this editor

timer++;
switch timer
{
	case 0: //Get x and y form where to spawn	
		//spawnX = irandom_range(200,room_width-200);
		//spawnY = irandom_range(200,room_height-200);
		
		x = spawnX;
		y = spawnY;
		
		//audio_play_sound(sndBom_00, 0, false);
		//audio_play_sound(sndBom_02, 0, false);
		play_sfx(sndBom_00,.7);
		play_sfx(sndBom_02,.7);
		alarm[0] = 1;
		alarm[1] = 1;
		visible = true;
		//timerDelta = 80;
		timerDelta = 80;
		screenFlash(-10, "out", 30, c_white);
	break;
	
	case 2000:
		with objLaserCircle { alarm[0] = timerAlarm; }
		alarm[0] = 0;
		alarm[1] = 0;
		audio_stop_sound(sndBom_02);
		audio_stop_sound(sndBom_03);
		play_sfx(sndBom_04,.7);
		//audio_play_sound(sndBom_04, 0, false);
		visible = false;
		shake = true;
		with objBetterCamera
			shake = true;
	break;
	
	case 2100:
		//camera_set_view_pos(cam.view_cam, cam.view_x, cam.view_y);
		shake = false;
		with objBetterCamera
			shake = false;
	break;
}
/*
if shake
{
	
	var magnitudeX = random(5);
	var magnitudeY = random(5);
	
	var camX = cam.view_x + magnitudeX;
	var camY = cam.view_y + magnitudeY;
	
	camera_set_view_pos(cam.view_cam,camX,camY);
}*/
image_angle += 7;