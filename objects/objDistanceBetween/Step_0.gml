/// @description 
if instance_exists(objLastBoss) and instance_exists(objPlayer)
{
	var _point1 = objLastBoss;
	var _point2 = objPlayer;
	var _dist = point_distance(_point1.x,_point1.y,_point2.x,_point2.y);
	var _dire = point_direction(_point1.x,_point1.y,_point2.x,_point2.y);
	x = _point1.x + lengthdir_x(_dist / 2,_dire);
	y = _point1.y + lengthdir_y(_dist / 2,_dire);
	
	if is_targeted
	{
		if _dist > distance_factor
		{
			with objCamera2 { obj = objPlayer; }
		}
		else
		{
			with objCamera2 { obj = objDistanceBetween; }
		}
	}
	if is_pressed(ord("V"))
		print(_dist)
}