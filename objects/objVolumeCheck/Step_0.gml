/// @description 
if !go
{
	if is_pressed(global.controls_menu.accept)
	{
		go = true;
		alarm[0] = 1;
		save_config();
		//audio
		play_sfx(sndVolumeCheckAccept,1.75);
	}

	if is_pressed(global.controls_menu.back)
	{
		play_sfx(sndShoot,.5);	
	}

	var v_input = is_pressed(global.controls_menu.down) - is_pressed(global.controls_menu.up);

	if v_input != 0
	{
		index += v_input;
		index = wrap(index,0,2);
		play_sfx(sndGT4MoveSelect);
	}


	change_volume(options[index]);	
}
/*
if is_held(global.controls_menu.left) and !go
{
		
}

if is_held(global.controls_menu.right) and !go
{
		
}