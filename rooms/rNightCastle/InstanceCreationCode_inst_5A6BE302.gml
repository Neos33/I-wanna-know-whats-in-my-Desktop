
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
		case 70:
			instance_create_layer(x,y,"Controllers",objCSI_Miami_Credits);
			audio_sound_gain(global.current_music,0,1000);
			//instance_deactivate_object(objBetterCamera);
			instance_destroy(objBetterCamera);
			var cam = camera_properties(0);
			var zoom_level = 2;
			var _ratioX = 4288 - cam.view_w / (zoom_level * 2);
			var _ratioY = cam.view_y + cam.view_h - cam.view_h / zoom_level;
			instances_activation_update(_ratioX, _ratioY-64, cam.view_w/zoom_level, cam.view_h/zoom_level); 
			apply_camera_settings(cam.view_cam,_ratioX,_ratioY,cam.view_w/zoom_level,cam.view_h/zoom_level);
			
			
			_neos = Create(x+96,y+32,"Collisions",objSpikeLeft,sprProfile_Neos,0,0,.25,.25,0,c_white,1);
			
			
		break;
		
		case 110:
			if exists(_neos)
			{
				var _x = _neos.x;
				var _y = _neos.y;
				var _glasses = Create(_x+32,_y+34,"Collisions",objDummy,sprPixelSunglasses,0,0,1.5,1.5,0,1,0);
				with _glasses
				{
					alpha_to_destination(0,1,false,,,200);
					depth -= 1;
				}
			}
		break;
	}
}

init_trigger(myTrap);