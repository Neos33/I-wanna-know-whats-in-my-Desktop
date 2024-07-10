/// @description 
timer++;
radius = 650 + move_oscillate(500,200,50,timer);
angle += angle_speed;

if timer == 200
	value_to_destination(alphaCircleBase,0,"alphaCircleBase",,,,8);

if timer == 208 
{
	//play_sfx(sndCC_Area_Dark,2);
	instance_destroy();
}


if instance_exists(objPlayer)
{
	if !collision_circle(x,y,radius - 12,objPlayer,false,true) and canKill
	{
		kill_player();
	}
}