/// @description Alpha out
if image_alpha > 0
{
	image_alpha -= 0.05;
	alarm[2] = 1;
}
else
	instance_destroy();
