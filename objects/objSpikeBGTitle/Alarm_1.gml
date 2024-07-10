/// @description Fade out and destroy
if image_alpha > 0
{
	image_alpha -= 0.025/10;
	alarm[1] = 1;
}
else
	instance_destroy();