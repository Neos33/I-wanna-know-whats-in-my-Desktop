/// @description 
if !init
{
	var _cam = camera_properties(0);
	var xx = _cam.view_x + _cam.view_w / 2;
	var yy = _cam.view_y + _cam.view_h / 2;
	

	angle_start = point_direction(x,y,xx,yy);
	distance_start = point_distance(x,y,xx,yy);
	
	angle = angle_start;
	distance = 0;
	
	
	init = true;
	visible = true;
}	