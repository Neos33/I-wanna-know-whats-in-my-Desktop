/// @description 
var cam = camera_properties(0);
repeat (2)
{
	var _rngX = irandom_range(cam.view_x,cam.view_x+cam.view_w);
	var _s = instance_create_layer(_rngX,2,"Instance_Under_Tiles",objJil_Bullet);
	_s . speed = random_range(3,6);
	_s . direction = 265+random(10);
}
alarm[0] = 5;