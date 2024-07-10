visible = false;

contraption = function()
{
	var _txt = instance_create_layer(3440,816,"Miscellaneous",objText);
	_txt . font = ftDiscord;
	_txt . halign = fa_center;
	_txt . valign = fa_top;
	_txt . color = c_white;
	_txt . alpha = 0;

	_txt . text = "Please\nSave";

	_txt . use_outline = true;
	_txt . color_outline = c_black;
	
	with _txt
	{
		value_to_destination(0,1,"alpha",,,,30);	
	}
	
	global.triggersPersistent[5] = false;

	play_sfx(sndBlockChange);
	instance_destroy();
}