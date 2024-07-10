contraption = function()
{
	scale_to_destination(,,0,2,true,animCurve_Elastic,0,20);
	moveY_to_position(,,-64,true,animCurve_Elastic,0,20);
	
	play_sfx(sndBlockChange);
}