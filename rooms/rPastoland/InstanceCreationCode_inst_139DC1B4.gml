visible = false;

contraption = function()
{
	with objArrowShow
	{
		if inside_view(0)
			value_to_destination(pointY,-32*5,"pointY",true,animCurve_Cubic,2,10);
	}
	
	instance_destroy();
}	