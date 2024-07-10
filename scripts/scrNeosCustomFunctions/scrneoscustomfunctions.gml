// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instances_activation_update(cLeft, cTop, cWidth, cBottom)
{
	//Get layers ID to deactivate
	var layerCollisionsID = layer_get_id("Collisions");
	var layerTriggersID = layer_get_id("Triggers");
	var layerMiscID = layer_get_id("Miscellaneous");
	var layerKillersID = layer_get_id("Killers");
	//var layerInstanceID = noone;
	//if layer_exists("Instance_Under_Tiles")
	//	var layerInstanceID = layer_get_id("Instance_Under_Tiles");
	
	var layerLightsID = noone;
	if layer_exists("Cheap_Lights")
		layerLightsID = layer_get_id("Cheap_Lights");
	
	
	//Deactivate instances by layers
	instance_deactivate_layer(layerCollisionsID);
	instance_deactivate_layer(layerTriggersID);
	instance_deactivate_layer(layerMiscID);
	instance_deactivate_layer(layerKillersID);
	if layerLightsID != noone
		instance_deactivate_layer(layerLightsID);

	//Activate instances
	instance_activate_region(cLeft, cTop, cWidth, cBottom ,true);
}


function debugTestValueChange(parameter, strParameter, keyIncrement, keyDecrement, step)
{
	if is_held(keyIncrement)
	{
		parameter += step;
	}
	if is_held(keyDecrement)
	{
		parameter -= step;
	}
	
	// Output value on console
	if is_pressed(ord("C"))
	{
		print(string_interp(strParameter+" = {0}",parameter));
	}
	return parameter;
}


function camera_change_mode(targetMode, objectFollow, goX, goY, goW, goH, limitLeft, limitTop, limitWidth, limitHeight, ShiftX, ShiftY)
{
	with objBetterCamera
	{
		mode = targetMode;
		object_target = objectFollow;
		pointX = goX;
		pointY = goY;
		pointW = goW;
		pointH = goH;
		LimitX = limitLeft;
		LimitY = limitTop;
		LimitW = limitWidth;
		LimitH = limitHeight;
		shiftX = ShiftX;
		shiftY = ShiftY;
	}
}


function EaseValue(val, type)
{
	switch(type)
	{
	    case 1: //Ease in
	    case "in":
	        return power(val, 2);                                         
	    case -1: //Ease out
	    case "out":
	        return 1 - power(1 - val, 2);                                     
	    case 0: //Ease in out
	    case "inout":
	        return lerp(EaseValue(val, 1), EaseValue(val, -1), val);
	    default:
	        return val;
	}
}


function avoidance_Sync(musicId)
{
	// Correct the game time if it desyncs from real time.
	if( room_speed < 100 ) {
	    var deltaTimeStep = realTime - t;
	    if( abs( deltaTimeStep ) > 5 ) {
	        // A big lag spike, adjust music to game time.
	       audio_sound_set_track_position( musicId, t / roomSpeed );
	       realTime = t;   
	    } else if( deltaTimeStep > 0 ) {
	        room_speed = roomSpeed + 1;
	    } else {
	        // All is good.
	        room_speed = roomSpeed;
	    }
	}

	realTime += roomSpeed * delta_time / 1000000; 
	t++;
}


function barrage_make_shapes(xx, yy, object, sides, spd, angle, distance, number_per_side, makeStar = false, star_pointiness = 2, makeFlower = false, parent_objectID = noone, tagID = -1)
{
	var two_pi = 2 * pi;
	sides = clamp(sides, 2, 999);
	angle = degtorad(angle);

	var checkDistance, pointX, pointY;

	if (makeStar) sides *= 2;

	for (var i = 0; i < sides; i++) {
	    checkDistance = 1;
    
	    if (makeStar && i % 2 == 1) checkDistance = clamp(star_pointiness, 0.1, 3);
        
	    pointX[i] = xx + checkDistance * cos(angle + two_pi / sides * i);
	    pointY[i] = yy - checkDistance * sin(angle + two_pi / sides * i);
	}

	for (var i = 0; i < sides; i++) {
	    var p = (i + 1) % sides;
	    var checkAngle = arctan2(pointY[i] - pointY[p], pointX[p] - pointX[i]);
	    checkDistance = point_distance(pointX[i], pointY[i], pointX[p], pointY[p]);
    
	    for (var j = 0; j < checkDistance; j += checkDistance / number_per_side) {
	        var nowX = pointX[i] + j * cos(checkAngle);
	        var nowY = pointY[i] - j * sin(checkAngle);
	        var centerAngle = arctan2(yy - nowY, nowX - xx);
	        var centerDistance = point_distance(xx, yy, nowX, nowY);
	        var shapeDistance = distance * centerDistance;
        
	        if (makeFlower) shapeDistance = distance / centerDistance;
        
	        var s = instance_create_layer(nowX + shapeDistance * cos(centerAngle), nowY - shapeDistance * sin(centerAngle), "Miscellaneous" ,object);
	        with (s) motion_set(radtodeg(centerAngle), spd);
        
	        if (!makeFlower) {
	            s.speed *= centerDistance;
	        } else {
	            s.speed /= centerDistance;
	        }
        
			if parent_objectID != noone
				s.parent_object = parent_objectID;
				
			if tagID != -1
				s.tag = tagID;
        
	    }
	}
}


function screenFlash(_depth = -10, mode = "in", duration = 50, color = c_white, alphaStart = 1)
{
	var temp = instance_create_depth(0,0,_depth,objFlashScreen);
	temp . fadeState = mode;
	temp . image_blend = color;
	temp . time = duration;
	temp . image_alpha = alphaStart;
	switch mode 
	{
		case "in":
		case "inout":
			temp . image_alpha = 0;
		break;
	}
}


function setScale(xscale = 1, yscale)
{
	if yscale == undefined
		yscale = xscale;
		
	image_xscale = xscale;
	image_yscale = yscale;
}


function apply_camera_settings(view,xx,yy,width,height)
{
	camera_set_view_pos(view,xx,yy);
	camera_set_view_size(view,width,height);
}


function rotation_move(xx ,yy, radius, angle)
{
	x = xx + lengthdir_x(radius, angle);
	y = yy + lengthdir_y(radius, angle);
}


function move_oscillate(magnitude, period, offset, timeCount)
{
	/* Calculates an oscillating value with the given parameters.
  
	   magnitude - distance the value deviates from 0
	   period - number of steps it takes to do a full positive and negative cycle

	   Note: depends on the global variable "count" being incremented by 1 every step
  
	*/
	return magnitude * sin(((timeCount + offset) mod period) / period * pi * 2);
}


function setDrawSettings(font = fntMenu3, halign = fa_left, valign = fa_top, color = c_white, alpha = 1)
{
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign)
	draw_set_color(color);
	draw_set_alpha(alpha);
}


function rect(xx, yy, width, height, angle = 0, color, alpha)
{
	draw_sprite_ext(sprPoint1x1, 0, xx, yy, width, height, angle, color, alpha);	
}


function create_movement(xx, yy, _depth, obj, dire, spd)
{
	var index = instance_create_depth(xx, yy, _depth, obj);
	index . direction = dire;
	index . speed = spd;
	
	return index;
}


function draw_hitbox(color)
{
	draw_sprite_stretched_ext(sprRectangleOutline,0,bbox_left,bbox_top,bbox_right-bbox_left+1,bbox_bottom-bbox_top+1,color,0.8);
}


function change_valueOption(indexOption, totalOptions)
{
	var dir = (is_pressed(global.controls.right) - is_pressed(global.controls.left));
	var valueOptions = indexOption;
	if dir != 0
	{
		valueOptions += dir;
		valueOptions = wrap(valueOptions,0,totalOptions - 1);
	}
	indexOption = valueOptions;
	return indexOption
}
