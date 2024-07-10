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
			viewW_current = viewW_start + _value * destination_viewW;
			viewH_current = viewH_start + _value * destination_viewH;
		}
		else
		{
			var _newViewWidth = destination_viewW - viewW_start;
			var _newViewHeight = destination_viewH - viewH_start;
			viewW_current = viewW_start + _value * _newViewWidth;
			viewH_current = viewH_start + _value * _newViewHeight;
		}
		
		// Apply changes to the owner instance
		camera_set_view_size(view_camera[0],viewW_current,viewH_current);
		//owner.image_alpha = image_alpha;
	}
	else
	{
		camera_set_view_size(view_camera[0],round(viewW_current),round(viewH_current));
		instance_destroy();
	}
/*}
else
	instance_destroy();
