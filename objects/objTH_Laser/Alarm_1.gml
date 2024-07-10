/// @description Scale out
if image_yscale > 0
{
	//image_yscale -= 0.05;
	image_yscale = lerp(image_yscale,-0.25,0.20);
	alarm[1] = 1;
}
else
{
	instance_destroy();
}