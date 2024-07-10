/// @description 
if instance_exists(owner) and owner != noone
{
	if curvePosition < endPosition
	{
		var _curveSpeed = 1/duration;
		curvePosition += _curveSpeed;
		
		var _struct = animcurve_get(curveAsset);

		var _channel = animcurve_get_channel(_struct, node);

		var _value = animcurve_channel_evaluate(_channel, curvePosition);


		if relative_alpha_mode
		{
			image_alpha = alpha_start + _value * destination_alpha;
		}
		else
		{
			var _newAngle = destination_alpha - alpha_start;
			image_alpha = alpha_start + _value * _newAngle;
		}
		
		// Apply changes to the owner instance
		owner.image_alpha = image_alpha;
	}
	else
	{
		instance_destroy();
		//owner.image_alpha = round(image_alpha);
	}
}
else
	instance_destroy();
