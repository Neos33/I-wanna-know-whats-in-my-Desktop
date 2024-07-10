/// @description 
if init
{
	var _cam = camera_properties(0);
	var xx = _cam.view_x + _cam.view_w / 2;
	var yy = _cam.view_y + _cam.view_h / 2;

	x = xx + lengthdir_x(distance,angle);
	y = yy + lengthdir_y(distance,angle);

	angle += angleSPD;
	
	if distance_going
	{
		//distance = min(distance+2,distance_target);
		distance = lerp(distance, distance_target-96, 0.05);
	}
	else
	{
		//distance = max(distance-2,distance_start);
		distance = lerp(distance, distance_start, 0.05);
	}
}