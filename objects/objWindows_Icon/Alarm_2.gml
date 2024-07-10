/// @description Pit fall Jebaited trap
var cam = camera_properties(0);
instance_create_layer(cam.view_x,cam.view_y,"Controllers",objAlundraTransition);
screenFlash(-10,"out",20,,.6);
play_sfx(sndAlundra_Enter_Dream);
		
	
alarm[0] = 50;