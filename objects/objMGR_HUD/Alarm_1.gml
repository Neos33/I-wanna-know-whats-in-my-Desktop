/// @description Fade in
if image_alpha < 1
{
	image_alpha += 0.05;
	alarm[1] = 1;
}
else
{
	canPunch = true;
}