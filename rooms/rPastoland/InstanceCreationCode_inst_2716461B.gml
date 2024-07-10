visible = false;
myTrap = new trigger_dynamic();

myTrap.action_begin = function()
{
	t = 0;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
	
	switch t
	{
		case 1:
			var _special = instance_create_layer(5392,1584,"Miscellaneous",objText);	
			_special . use_outline = true;
			_special . font = ftHeyanSubTitle;
			_special . halign = fa_center;
			_special . color = make_color_hsv(color_get_hue(c_yellow),170,255);
			_special . text = "Elastic sideways";
			with _special value_to_destination(0,1,"alpha",,,,15);
	
			var _points = instance_create_layer(5392,1632,"Miscellaneous",objText);
			_points . use_outline = true;
			_points . font = ftHeyanSubTitle;
			_points . halign = fa_center;
			_points . color = c_ltgrey;
			_points . text = "1500";
			with _points value_to_destination(0,1,"alpha",,,,15);
	
	
			var _specialR = instance_create_layer(5872,1584,"Miscellaneous",objText);
			_specialR . use_outline = true;
			_specialR . font = ftHeyanSubTitle;
			_specialR . halign = fa_center;
			_specialR . color = make_color_hsv(color_get_hue(c_yellow),170,255);
			_specialR . text = "Elastic sideways";
			with _specialR value_to_destination(0,1,"alpha",,,,15);
	
			var _pointsR = instance_create_layer(5872,1632,"Miscellaneous",objText);
			_pointsR . use_outline = true;
			_pointsR . font = ftHeyanSubTitle;
			_pointsR . halign = fa_center;
			_pointsR . color = c_ltgrey;
			_pointsR . text = "1500";
			with _pointsR value_to_destination(0,1,"alpha",,,,15);
	
	
			play_sfx(sndTonyHawk_SpecialTrick,.7);
		break;
		
		case 20:
			showReference(1024-150,576-200,"Game","1","Tony Hawk Series",sprRef_TonyHawk);
			instance_destroy();
		break;
	}
}

init_trigger(myTrap);