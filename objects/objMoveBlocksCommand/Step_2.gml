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

		if relative_move
		{
			x = xstart + _value * destinationX;
			y = ystart + _value * destinationY;
		}
		else
		{
			var _targX = destinationX - xstart;
			var _targY = destinationY - ystart;
			x = xstart + _value * _targX;
			y = ystart + _value * _targY;
		}
		// attach the coordinates to the owner instance
		owner.hspd = x - xstart;
		owner.vspd = y - ystart;
	}
	else
		instance_destroy();
}
else
	instance_destroy();
