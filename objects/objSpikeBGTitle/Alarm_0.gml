/// @description Fade in
if image_alpha < 0.1
{
	image_alpha += 0.025/10;
	alarm[0] = 1;
}
else
{
	alarm[1] = delay;	
}