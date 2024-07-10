/// @description Fade out
if image_alpha > 0
{
	image_alpha -= 0.05;
	alarm[2] = 1;
}
else
{
	event_user(1);
}
