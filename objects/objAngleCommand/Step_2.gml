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


		if relative_angle_mode
		{
			image_angle = angle_start + _value * destination_angle;
		}
		else
		{
			var _newAngle = destination_angle - angle_start;
			image_angle = angle_start + _value * _newAngle;
		}
		
		// Apply changes to the owner instance
		owner.image_angle = image_angle;
	}
	else
		instance_destroy();
}
else
	instance_destroy();
