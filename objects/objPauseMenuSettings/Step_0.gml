/// @description Menu

var click = is_pressed(global.controls_menu.accept);
var dir = (is_pressed(global.controls_menu.down) - is_pressed(global.controls_menu.up));

// Audio
var sfxMove = sndGT4MoveSelect;
var sfxSelect = sndGT4Selected;

var length = array_length(menu);

if !locked
{
	if dir != 0
	{
		audio_play_sound(sfxMove, 0, false);	
		index += dir;
		index = wrap(index,0,length-1);
	}

	if click
	{
		switch index
		{
			case 0: // Resume
				//event_user(0);
				locked = true;
				alarm[0] = 0;
				alarm[1] = 1;
				eventNumber = 0;
				audio_play_sound(sfxSelect, 0, false);
				audio_sound_gain(global.current_music,1,200); //Set the volume back
			break;
			case 1: // Options
				locked = true;
				audio_play_sound(sfxSelect, 0, false);
				alarm[0] = 0;
				alarm[1] = 1;
				eventNumber = 1;
			break;
			//case 2: // References
			//	locked = true;
			//	audio_play_sound(sfxSelect, 0, false);
			//	alarm[0] = 0;
			//	alarm[1] = 1;
			//	eventNumber = 2;
			//break;
			case 2: // Quit
				instance_activate_all();
				with objWorld
				{
					blackAlpha = 0;
					if (sprite_exists(pause_screen)) {
						sprite_delete(pause_screen);
					}
		
					io_clear();
					event_user(0);	
				}
				instance_destroy();
				global.game_paused = false;
				audio_sound_gain(global.current_music,1,0); 
			break;
		}
	}

}
/*
else
{
	
}