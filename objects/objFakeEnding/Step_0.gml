/// @description 

//if instance_exists(objPlayer)
{
	if !ESC_key_pressed and (is_pressed(global.controls_misc.quit) or is_pressed(global.controls_misc.reset))
		ESC_key_pressed = true;	
		
	if ESC_key_pressed
		run_state();
}


