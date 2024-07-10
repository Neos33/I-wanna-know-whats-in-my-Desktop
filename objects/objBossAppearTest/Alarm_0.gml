/// @description Fade in
if image_alpha < 1
{
	image_alpha += 0.05;
	alphaShadow = image_alpha;
	alarm[0] = 1;
}
else
{
	alarm[1] = 100;	
}