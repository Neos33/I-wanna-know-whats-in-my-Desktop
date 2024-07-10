/// @description 
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);


var targetX = objPlayer.x - camW/2;
var targetY = objPlayer.y - camH/2;

targetX = clamp(targetX, 0, room_width - camW);
targetY = clamp(targetY, 0, room_height - camH);

camX = lerp(camX, targetX, CAM_SMOOTH);
camY = lerp(camY, targetY, CAM_SMOOTH);

var wheel = mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_right);

if wheel != 0
{
	wheel *= 0.1;
	
	var addW = camW * wheel;
	var addH = camH * wheel;
	
	camW += addW;
	camH += addH;
	
	camX -= addW / 2;
	camY -= addH / 2;
}

camera_set_view_pos(view_camera[0],camX,camY);
camera_set_view_size(view_camera[0],camW,camH);