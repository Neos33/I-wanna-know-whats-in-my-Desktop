/// @description 

// Inherit the parent event
event_inherited();


if touched
{
	if !move
	{
		move = true;
		motion_set(dire, spd);
		gravity = gravi_push;
	}
	if image_alpha > 0
	{
		image_alpha -= alphaSpeed;	
		image_xscale -= alphaSpeed;
		image_yscale = image_xscale;
		image_angle += speed*reverse;
	}
	else
		instance_destroy();
}