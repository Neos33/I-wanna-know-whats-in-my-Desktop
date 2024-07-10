/// @description 
if s_state != 0
{
	switch (timer)
	{
		case 40:
			s_state = 2;
			value_to_destination(0,totalAnimReflectionIndex,"reflectionIndex",false,animCurve_Cubic,2,60);
		break;
		
		case 250:
			scale_to_destination(,,0,1,false,animCurve_Cubic,2,40);
		break;
		
		case 290:
			instance_destroy();
		break;
	}
	
	
	timer++;
}
