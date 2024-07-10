/// @description Insert description here
// You can write your code in this editor
switch fadeState
{
	case "in":
		if image_alpha < 1
			image_alpha	+= 1/time;
	break;
	case "out":
		if image_alpha > 0
			image_alpha	-= 1/time;
		else
			instance_destroy();
	break;
	case "inout":
		// Fade in 
		if image_alpha < 1 and !reverse
			image_alpha	+= 1/(time/2);
		else
			reverse = true;
			
		// Fade out and destroy
		if reverse
		{
			if image_alpha > 0
				image_alpha	-= 1/(time/2);
			else
				instance_destroy();
		}
	break;
}