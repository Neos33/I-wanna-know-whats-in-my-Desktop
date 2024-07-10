/// @description 
if !punched 
{
	with other {
		frozen = true;
		visible = false;
	}
	
	with objBlock { groundSFX = ""; }
	
	//create a kid copy
	var _dire = 180;
	if instance_exists(objWindows_Icon)
		_dire = point_direction(other.x,other.y,objWindows_Icon.x+64,objWindows_Icon.y+64);
	
	var _kid = instance_create_layer(other.x,other.y,"Player",objPlayerFisted);
	_kid . direction = _dire;
	_kid . speed = (room = rStage04) ? 6 : 8;
	_kid . gravity = (room = rStage04) ? .4 : .6;
	_kid . gravity_direction = _dire;
	
	punched = true;
	var _sfx = (room = rStage04) ? sndPunchedEcho : sndPunch1;
	play_sfx(_sfx);
}
