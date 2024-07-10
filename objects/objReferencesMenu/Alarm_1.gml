/// @description Fade out
if image_alpha > 0
{
	image_alpha -= 0.05;
	alarm[1] = 1;
}

else
	event_user(0);
