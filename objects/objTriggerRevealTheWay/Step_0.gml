/// @description 
event_inherited();

switch (timer)
{
	case 60:

		/*with objBetterCamera
		{
			mode = CAMERA.SET_POSITION;
			pointX = 1024;
			pointY = 576*2-64;
		}*/
		var cam = camera_properties(0);
		view_position_destination(cam.view_x,cam.view_y,0,-64,true,animCurve_Cubic,2,50);
		instance_destroy(objBetterCamera);
		instance_destroy();
		exit;
	break;
}