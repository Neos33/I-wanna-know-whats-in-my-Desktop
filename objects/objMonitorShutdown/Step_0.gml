/// @description 
if shutdown
{
	if t < time
	{
		image_yscale = lerp(image_yscale,0,t/time);
		t++;
	}
	if t == time
		instance_destroy();
	
}
