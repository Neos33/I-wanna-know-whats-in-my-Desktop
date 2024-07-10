/// @description 
var cam = camera_properties(0);

var _dire = 90;
repeat 2
{
	var _s = instance_create_depth(cam.view_x,cam.view_y+cam.view_h/2,depth,objVGShadow);
	_s . direction = _dire;
	_s . gravity_direction = _dire;
	_s . gravity = .25;
	
	_dire += 180;
}

alarm[0] = 20;