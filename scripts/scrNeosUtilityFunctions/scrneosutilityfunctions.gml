#region Utility 1
function Approach(a, b, amount)
{
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice because it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);

	if (a < b)
	{
	    a += amount;
	    if (a > b)
	        return b;
	}
	else
	{
	    a -= amount;
	    if (a < b)
	        return b;
	}
	return a;
}

function Wave(_from, _to, _duration, _offset)
{
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4;
}

function Record(key_record = ord("S"), currentTimer)
{
	if keyboard_check_pressed(key_record)
	{
		show_debug_message(string_interp("case {0}:",currentTimer));	
	}
}
#endregion

#region Command tween shenanigans
#region Position movement tween
function move_to_position(startX = x, startY = y, targetX, targetY, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(startX, startY, depth, objMoveCommand);
		inst . owner = id;
		inst . destinationX = targetX;
		inst . destinationY = targetY;
		inst . relative_move = Relative;
		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

function moveX_to_position(startX = x, startY = y, targetX, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(startX, startY, depth, objMoveXCommand);
		inst . owner = id;
		inst . destinationX = targetX;
		inst . relative_move = Relative;
		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

function moveY_to_position(startX = x, startY = y, targetY, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(startX, startY, depth, objMoveYCommand);
		inst . owner = id;
		inst . destinationY = targetY;
		inst . relative_move = Relative;
		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}
#endregion

function scale_to_destination(startX = image_xscale, startY = image_yscale, targetX, targetY, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objScaleCommand);
		inst . owner = id;
		
		inst . xscale_start = startX;
		inst . yscale_start = startY;
		inst . destination_scaleX = targetX;
		inst . destination_scaleY = targetY;
		inst . relative_scale_mode = Relative;

		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

function color_to_destination(StartColor = image_blend, TargetColor, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objColorCommand);
		inst . owner = id;
		
		inst . color_start = StartColor;
		inst . destination_color = TargetColor;

		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

function angle_to_destination(StartAngle = image_angle, TargetAngle, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objAngleCommand);
		inst . owner = id;
		
		inst . relative_angle_mode = Relative;
		inst . angle_start = StartAngle;
		inst . destination_angle = TargetAngle;

		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

function alpha_to_destination(StartAlpha = image_alpha, TargetAlpha, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objAlphaCommand);
		inst . owner = id;
		
		inst . relative_alpha_mode = Relative;
		inst . alpha_start = StartAlpha;
		inst . destination_alpha = TargetAlpha;	
		
		
		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

function view_position_destination(StartViewX, StartViewY, TargetViewX, TargetViewY, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objCameraPositionCommand);
	
	inst . relative_view_mode = Relative;
	inst . viewX_start = StartViewX;
	inst . viewY_start = StartViewY;
	inst . destination_viewX = TargetViewX;
	inst . destination_viewY = TargetViewY;	
	
	inst . curveAsset = curve;
	inst . node = curveSignal;
	inst . duration = Duration;
}

function view_size_destination(StartViewW, StartViewH, TargetViewW, TargetViewH, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objCameraSizeCommand);
	
	inst . relative_view_mode = Relative;
	inst . viewW_start = StartViewW;
	inst . viewH_start = StartViewH;
	inst . destination_viewW = TargetViewW;
	inst . destination_viewH = TargetViewH;	
	
	inst . curveAsset = curve;
	inst . node = curveSignal;
	inst . duration = Duration;
}


function value_to_destination(StartValue, TargetValue, Variable, Relative = false, curve = animCurve_Normal, curveSignal = 0, Duration)
{
	var inst = instance_create_depth(x, y, depth, objValueCommand);
		inst . owner = id;
		inst . relative_mode = Relative;

		inst . value_start = StartValue;
		inst . destination_value = TargetValue;

		inst . parentValue = Variable;	// String variable

		inst . curveAsset = curve;
		inst . node = curveSignal;
		inst . duration = Duration;
}

#endregion

#region shortcut on create
function Create(_x,_y,_layer,_object,sprite = sprite_index,img_index=image_index,img_speed=image_speed,xscale=1,yscale=1,angle=0,color=c_white,alpha=1)
{
	var objID;
	if is_real(_layer)
		objID = instance_create_depth(_x,_y,_layer,_object);
	else
		objID = instance_create_layer(_x,_y,_layer,_object);
		
	objID . sprite_index = sprite;
	objID . image_index = img_index;
	objID . image_speed = img_speed;
	objID . image_xscale = xscale;
	objID . image_yscale = yscale;
	objID . image_angle = angle;
	objID . image_blend = color;
	objID . image_alpha = alpha;
	
	return objID;
}

function Define(xOffset = 0, yOffset = 0,sprite = sprite_index,img_index=image_index,img_speed=image_speed,xscale=image_xscale,yscale=image_yscale,angle=image_angle,color=image_blend,alpha=image_alpha)
{
	x += xOffset;
	y += yOffset;
	sprite_index = sprite;
	image_index = img_index;
	image_speed = img_speed;
	image_xscale = xscale;
	image_yscale = yscale;
	image_angle = angle;
	image_blend = color;
	image_alpha = alpha;
}

#endregion
