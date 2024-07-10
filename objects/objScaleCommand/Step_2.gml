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

		if relative_scale_mode
		{
			image_xscale = xscale_start + _value * destination_scaleX;
			image_yscale = yscale_start + _value * destination_scaleY;
		}
		else
		{
			var _scaleX = destination_scaleX - xscale_start;
			var _scaleY = destination_scaleY - yscale_start;
			image_xscale = xscale_start + _value * _scaleX;
			image_yscale = yscale_start + _value * _scaleY;
		}
		// attach the scale to the owner instance
		owner.image_xscale = image_xscale;
		owner.image_yscale = image_yscale;
	}
	else
		instance_destroy();
}
else
	instance_destroy();
