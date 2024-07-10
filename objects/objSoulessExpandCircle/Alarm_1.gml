/// @description 

radius = radiusHalfLimit + move_oscillate(radiusHalfLimit,duration,start,t);
//t++;

angle += angle_speed;
hspd = 0;

if t < duration
{
	t++;
	alarm[1] = 1;
}
else
{
	//alarm[2] = irandom_range(100,200);
	//hspd = speed_start;
	//value_to_destination(hspd,speed_start,"hspd",false,,,20);
	
	//Fade out
	alarm[4] = 1;
	alpha_to_destination(1,0,false,,,60);
	vspeed = random_range(-1,1);
}