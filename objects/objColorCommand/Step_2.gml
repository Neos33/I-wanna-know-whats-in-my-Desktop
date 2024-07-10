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


		image_blend = merge_color(color_start, destination_color, _value);
		
		// Apply changes to the owner instance
		owner.image_blend = image_blend;
	}
	else
		instance_destroy();
}
else
	instance_destroy();
