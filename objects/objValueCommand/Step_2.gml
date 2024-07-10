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


		if relative_mode
		{
			value = value_start + _value * destination_value;
		}
		else
		{
			var _currentValue = destination_value - value_start;
			value = value_start + _value * _currentValue;
		}
		
		// Apply changes to the owner instance
		variable_instance_set(owner,parentValue,value);
		//owner.image_angle = value;
	}
	else
		instance_destroy();
}
else
	instance_destroy();
