/// @description 
if sonicMode
{
	speed = clamp(speed,0,15);
	image_angle += speed+1;

	if exists()
	{
		gravity_direction = point_direction(x,y,objPlayer.x,objPlayer.y);
		y = min(y,room_height);
		
		if place_meeting(x,y,objPlayer)
			kill_player();
	}
}