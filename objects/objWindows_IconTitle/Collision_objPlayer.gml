if !has_entered and roomTo != noone
{
	if id != instStageJebaited 
	{
		var cam = camera_properties(0);
		instance_create_layer(cam.view_x,cam.view_y,"Controllers",objAlundraTransition);
		screenFlash(-10,"out",20,,.6);
		play_sfx(sndAlundra_Enter_Dream);
		alarm[0] = 50;
	}
	else // Cutscene - show the real way
	{
		alarm[2] = (sprite == sprPandaLUL) ? 1 : 250;
		if sprite != sprPandaLUL
		{
			alarm[3] = 100;
			alarm[4] = 10;
		}
	}
	with objPlayer 
	{
		frozen = true;
		visible = false;
	}
	global.resetAllowed = false;
	has_entered = true;
	instance_destroy(objBetterCamera);
}
