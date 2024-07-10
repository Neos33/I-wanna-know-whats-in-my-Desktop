/// @description 
//if instance_exists(owner) and owner != noone
//{
	if curvePosition < endPosition
	{
		var _curveSpeed = 1/duration;
		curvePosition += _curveSpeed;
		
		var _struct = animcurve_get(curveAsset);

		var _channel = animcurve_get_channel(_struct, node);

		var _value = animcurve_channel_evaluate(_channel, curvePosition);


		if relative_view_mode
		{
			viewX_current = viewX_start + _value * destination_viewX;
			viewY_current = viewY_start + _value * destination_viewY;
		}
		else
		{
			var _newViewX = destination_viewX - viewX_start;
			var _newViewY = destination_viewY - viewY_start;
			viewX_current = viewX_start + _value * _newViewX;
			viewY_current = viewY_start + _value * _newViewY;
		}
		
		// Apply changes to the owner instance
		camera_set_view_pos(view_camera[0],viewX_current,viewY_current);
	}
	else
	{
		camera_set_view_pos(view_camera[0],round(viewX_current),round(viewY_current));
		instance_destroy();
		
	}
/*}
else
	instance_destroy();
