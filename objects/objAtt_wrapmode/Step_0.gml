/// @description 


image_angle = direction;

move_wrap(true,true,sprite_width);

if exists(objPlayer)
{
	if place_meeting(x,y,objPlayer) and canKill
	{
		kill_player()	
	}
}