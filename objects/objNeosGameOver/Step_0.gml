/// @description 
t++
switch t
{
	case 40:
		value_to_destination(0,1,"Line1",false,animCurve_Elastic,0,60);
		value_to_destination(0,.4,"alphaBG",false,animCurve_Cubic,2,60);
	break;
	
	case 50:
		value_to_destination(0,1,"Line2",false,animCurve_Elastic,0,60);
	break;
	
	case 60:
		value_to_destination(0,1,"Line3",false,animCurve_Elastic,0,60);
	break;
	
	case 70:
		value_to_destination(0,1,"Line4",false,animCurve_Elastic,0,60);
	break;
	
	//case 110:
	//	value_to_destination(0,.4,"alphaBG",false,animCurve_Cubic,2,60);
	//break;
}