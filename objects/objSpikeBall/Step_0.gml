/// @description 
if delay > 0
	delay--;
else
{
	if eye_angle < 360
	{
		eye_yscale = abs(.5 + lengthdir_x(.5,eye_angle));
		
		eye_angle+=5;
		
	}
	else
	{
		delay = irandom_range(100,200);
		eye_angle = 0;	
	}
}