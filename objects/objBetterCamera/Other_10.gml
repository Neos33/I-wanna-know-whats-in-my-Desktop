/// @description Move camera
var cam = camera_properties(0);

switch (mode)
{
	case CAMERA.FOLLOW_OBJECT:
		if !instance_exists(object_target) break;
		
		targetX = object_target.x - cam.view_w/2 + shiftX; 
        targetY = object_target.y - cam.view_h/2 + shiftY; 
		
		if LimitX != undefined and LimitY != undefined and LimitW != undefined and LimitH != undefined
		{
			targetX = clamp(targetX, LimitX, LimitW - cam.view_w); 
	        targetY = clamp(targetY, LimitY, LimitH - cam.view_h);
		}
	break;
	
	case CAMERA.NORMAL_TRANSITION:
	    if !instance_exists(object_target) break;
		
		targetX = ShiftX + (cam.view_w * floor(object_target.x / cam.view_w));
        targetY = ShiftY + (cam.view_h * floor(object_target.y / cam.view_h));
	break;
	
	case CAMERA.SET_POSITION:
		targetX = pointX;
		targetY = pointY;
	break;
	
	case CAMERA.ZOOM_OUT:
		targetX = pointX;
		targetY = pointY;
		targetW = pointW;
		targetH = pointH;
		
	break;
	case CAMERA.ZOOM_TO_OBJECT:
		if !instance_exists(object_target) break;
		targetX = object_target.x - cam.view_w/2; 
        targetY = object_target.y - cam.view_h/2; 
		
		targetW = pointW;
		targetH = pointH;
		/*var wheel = mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_right)
		if wheel != 0
		{
			wheel *= 0.1;
			targetW = cam.view_w * (1 + wheel);
			targetH = cam.view_h * (1 + wheel);
		}*/
		//if cam.view_w = 1024 and cam.view_h = 608
			//mode = CAMERA.FOLLOW_OBJECT;
			
		
	break;
}
	
if (!leaveRoom)
{
    targetX = clamp(targetX, 0, room_width - cam.view_w); 
    targetY = clamp(targetY, 0, room_height - cam.view_h);
}
    
if (!init)    //On the first frame snap instantly to the player instead of moving smoothly.
{
	cam.view_x = targetX;
	cam.view_y = targetY;
	cam.view_w = targetW;
	cam.view_h = targetH;
	apply_camera_settings(cam.view_cam,cam.view_x,cam.view_y,cam.view_w,cam.view_h);
	region_deactivate(targetX, targetY, targetW, targetH, 1024, 576);
    alarm[0] = 5; //Instances deactivation
    init = true;
}

if (init)
{
	if shake
	{
		var camX = targetX + irandom(shakeMagnitude);
		var camY = targetY + irandom(shakeMagnitude);
		
		cam.view_x = camX;
		cam.view_y = camY;
	}
	
	cam.view_x = lerp(cam.view_x, targetX, smoothLerp);
	cam.view_y = lerp(cam.view_y, targetY, smoothLerp);
	cam.view_w = lerp(cam.view_w, targetW, smoothLerp);
	cam.view_h = lerp(cam.view_h, targetH, smoothLerp);
	
	apply_camera_settings(cam.view_cam,cam.view_x,cam.view_y,cam.view_w,cam.view_h);
	//camera_set_view_pos(cam.view_cam,cam.view_x,cam.view_y);
	//camera_set_view_size(cam.view_cam,cam.view_w,cam.view_h);
}
	
	
	

