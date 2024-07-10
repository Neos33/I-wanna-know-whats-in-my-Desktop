/// @description Destroy
if (path_first = pthS3_Normal1)
	play_sfx(sndGlassBroke);
	
	
var _face = (path_first = pthS3_Normal1) ? 0 : 32;
var _dire = (path_first = pthS3_Normal1) ? 180 : 0;
repeat(50)
{
	var x_range = x - sprite_xoffset + irandom(surf_w);
	var y_range = y - sprite_yoffset + irandom(surf_h);
	var escombros = Create(x_range,y_range,"Instance_Under_Tiles",objCherry,sprCherryWhite,0,0,.5,.5,0,c_white,.5);
	escombros . speed = 2;
	escombros . direction = _dire + 180 + irandom_range(-40,40);
	escombros . gravity = .2;
	escombros . gravity_direction = _dire;
	escombros . x -= _face;
}


instance_destroy();