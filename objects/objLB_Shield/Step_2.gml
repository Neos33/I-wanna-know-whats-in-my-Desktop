/// @description 

if owner != noone and exists(owner)
{
	x = owner.x;
	y = owner.y;
	
	image_xscale = .75 + move_oscillate(.25,200,0,t);
	image_yscale = image_xscale;
	t++;
}

