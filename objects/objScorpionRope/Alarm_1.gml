/// @description 
with objBlockBrickScorpion
{
	if x > xstart - 32*3
	{
		if hspd == 0 
			hspd = -2;	
	}
	else
	{
		hspd = 0;
		jank = false;
		x = xstart - 32*3;
	}
}
if x >= xstart
{
	x -= 2;
	alarm[1] = 1;
}