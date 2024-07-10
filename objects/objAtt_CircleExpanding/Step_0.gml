/// @description 
timer++;
if timer > 150
{
	angle += angle_speed;
	radius = 1100 + move_oscillate(800,400,rad_offset,timer-150);
}

if timer < 150
{
	radius = lerp(radius,1500,timer/150);	
	
}
if timer == 150
{
	if tag == "First circle" canKill = true;
	alarm[0] = 10;
}

if instance_exists(objPlayer)
{
	if !collision_circle(x,y,radius,objPlayer,false,true) and canKill
	{
		kill_player();
	}
}