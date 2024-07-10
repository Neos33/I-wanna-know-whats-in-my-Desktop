/// @description Fade out
if image_alpha > 0
{
	image_alpha -= 0.05;
	alarm[1] = 1;
	
	if eventNumber == 0
		with objWorld { blackAlpha = other.image_alpha }
}
else
{
	event_user(eventNumber);
}