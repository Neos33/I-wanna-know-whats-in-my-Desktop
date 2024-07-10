
function copyDepth(layerID)
{
	var temp = layer_get_id(layerID);
	if !layer_exists(temp) 
	{
		print(string_interp("Couldn't found any existence layer called [{0}]",layerID));
		print("Depth setting to Default (114514)")
		return 114514;
	}
	var tempDepth = layer_get_depth(temp);
	return tempDepth;
}

function set_vertex_point(buffer,pointX,pointY,pointZ,uvsX,uvsY,color,alpha)
{
	vertex_position_3d(buffer, pointX, pointY, pointZ);
	vertex_texcoord(buffer, uvsX, uvsY);
	vertex_color(buffer, color, alpha);
}

function testval(initial_value)
{

	// Set initial value
	if (global.testVal == undefined) global.testVal = initial_value;

	// Modify with wheel
	var _wheel = mouse_wheel_up() - mouse_wheel_down();

	if (_wheel != 0) {
	    global.testVal += _wheel;
    
	    show_debug_message("Test Value set to " + string(global.testVal));
	}

	return global.testVal;
}

function debug_detail()
{
	///@arg print_value
	///@arg ...
	var str = "[" + object_get_name(object_index) + "] ";
	for(var i=0; i<argument_count; i++) {
	    str += string(argument[i]);
	}
	show_debug_message(str);
}

function print_ext() 
{
	///@arg value_as_string
	///@arg value
    show_debug_message("/////////////////////////////////////////////////////")
 
    var _str = "---[-" + object_get_name(object_index) + "-] ";
    show_debug_message(_str);
    var _event = "";
    switch(event_type) {
        
        case ev_create: _event = "create";
        break;
        case ev_destroy: _event = "destroy";
        break;
        case ev_step: 
            switch (event_number) {
                case ev_step_begin: _event = "begin "; break;
                case ev_step_end: _event   = "end "; break;
            }
            _event += "step";
        break;
        case ev_alarm: _event      = "alarm [ " + string(event_number) + " ]"; break;
        case ev_keyboard: _event   = "keyboard"; break;
        case ev_keypress: _event   = "keypress"; break;
        case ev_keyrelease: _event = "ev_keyrelease"; break;
        case ev_mouse: _event      = "ev_mouse"; break;
        case ev_collision: _event  = "ev_collision"; break;
        case ev_other: _event      = "ev_other"; break;
        case ev_gesture: _event    = "ev_gesture"; break;
        case ev_draw:
            switch (event_number) {
                case ev_draw_begin: _event = "begin "; break;
                case ev_draw_end: _event   = "end "; break;
            }
            _event += "draw"
        break;
    }
    
    show_debug_message(_event);
 
    var i = 0
    
    while(i < argument_count) {
        _str = string(argument[i]) + " ";
        
        if i + 1 < argument_count {
            var _arg = argument[i+1];
            if !is_undefined(_arg) {
                if !is_string(_arg) {
                    i ++
                    _str += string(_arg)
                }else{
                    _str += _arg
                }
            }
        }
        i++
        show_debug_message(_str)
        
    }
    show_debug_message("/////////////////////////////////////////////////////")
}

/// @function scr_get_tile_object(tile, index)
/// @description returns object corresponting to given tile
/// @param tileset
/// @param tile position in tileset
// Credits to Po4ti
function scr_get_tile_object(tile, index)
{
	if(index == 0)
		return noone;
	
	switch(tile) {
		case "tlsCollision":
			if(index == 1) // Rocks
				return objBlock;
			if(index == 2) // Grass
				return objBlock;				
			if(index == 3) // Earth
				return objBlock;				
			break;
			
			
		default:
			return noone;
	}	
}

// Credits to renex
function inside_view(view_number = 0) 
{
	var cam = camera_properties(view_number);
	//workaround for instances without a sprite
	if (bbox_right - bbox_left + bbox_bottom - bbox_top == 0)
	return x >= cam.view_x
	    && x < cam.view_x + cam.view_w
	    && y >= cam.view_y
	    && y < cam.view_y + cam.view_h

	return bbox_right >= cam.view_x
	    && bbox_left < cam.view_x + cam.view_w
	    && bbox_bottom >= cam.view_y
	    && bbox_top < cam.view_y + cam.view_h
}


function exists(instance = objPlayer)
{
	return instance_exists(instance)	
}

function roomsAllowed()
{
	switch room{
		case rInit:
		case rIntro:
		case rVolumeCheck:
		case rTitle:
		case rFakeIntroductionStage:
			return false;
			
		default:
			return true;
	}
}