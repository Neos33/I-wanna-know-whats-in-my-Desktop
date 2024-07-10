/// @description Control the menu
if (!is_held(vk_anykey)) {
	exit;
}

// Audio
//var sfxEnter = sndGT4SelectConfirmed;
var sfxMove = sndGT4MoveSelect;
var sfxSelect = sndGT4Selected;
var sfxBack = sndGT4MenuBack;
var sfxForbbiden = sndGT4NotAllowed;


if (changing_controls && is_pressed(vk_anykey)) {
	var key = keyboard_key;
    
    if (key == 160 || key == 161) {
        key = 16;
    }
    
	variable_struct_set(global.controls, string_lower(options[MENU_OPTIONS.CONTROLS][select[menu]]), key);
    save_config();
    audio_play_sound(sndJump, 0, false);
    changing_controls = false;
	exit;
}
if !locked
{
	if is_pressed(ord("X"))
	print(string_interp("Menu {0}: {1}",options[menu][select[menu]].label,global.display));
	if (is_pressed(global.controls_menu.up)) {
	    select[menu]--;
	    audio_play_sound(sfxMove, 0, false);
	}

	if (is_pressed(global.controls_menu.down)) {
	    select[menu]++;
	    audio_play_sound(sfxMove, 0, false);
	}

	var length = array_length(options[menu]);
	select[menu] += length;
	select[menu] %= length;

	switch (menu) {
		case MENU_OPTIONS.OPTIONS:
		    var ll = is_pressed(global.controls_menu.left);
			var rr = is_pressed(global.controls_menu.right);

			switch options[menu][select[menu]].type_action
			{
				case "volumeSlide": // Press left or right to change volume
				case "changeValueNormal":
					options[menu][select[menu]].on_select(); 
				break;
				case "changeValue": // Press left or right to change 
				case "toggleValue":
					if ll or rr 
					{
						options[menu][select[menu]].on_select(); 
						audio_play_sound(sfxMove,0,false);
					}
				break;
				case "enterAction": // Press shift to enter the selected menu
					if (is_pressed(global.controls_menu.accept))
					{
						if options[menu][select[menu]].label == "Online Connection" and global.game_started
						audio_play_sound(sfxForbbiden, 0, false);
						else
						{
						options[menu][select[menu]].on_select();  
						audio_play_sound(sfxSelect,0,false);
						ia = 0;
						}
					}
				break;
			}
			
			// Play a sound if you're in SFX Volume to test your volume
			if select[menu] == 1
			{
				if !testSFX
				{
					alarm[0] = 5;
					testSFX = true;
				}
			}
			else
			{
				alarm[0] = 0;
				testSFX = false;
			}
    
		    if (is_pressed(global.controls_menu.back)) {
		        save_config();
				//event_user(1);
				alarm[2] = 1;
				locked = true;
				audio_play_sound(sfxBack,0,false);
		        //room_goto(rFiles);
		    }
			break;
		
		case MENU_OPTIONS.CONTROLS:
		    if (is_pressed(global.controls_menu.accept)) {
		        if (select[menu] == length - 1) {
		            options[menu][select[menu]].on_select();
		        } else {
		            changing_controls = true;
		        }
		
				audio_play_sound(sfxSelect, 0, false);
		    }

		    if (is_pressed(global.controls_menu.back)) {
		        menu = MENU_OPTIONS.OPTIONS;
		        audio_play_sound(sfxBack, 0, false);
				ia = 0;
		    }
			break;
		
		case MENU_OPTIONS.ONLINE:
			var ll = is_pressed(global.controls_menu.left);
			var rr = is_pressed(global.controls_menu.right);

			switch options[menu][select[menu]].type_action
			{
				case "changeValueNormal": // Press left or right to change value
					options[menu][select[menu]].on_select(); 
				break;
				case "changeValue":
				case "toggleValue":
					if ll or rr 
					{
						options[menu][select[menu]].on_select(); 
						audio_play_sound(sfxMove,0,false);	
					}
				break;
				case "enterAction": // Press shift to enter the selected menu
					if (is_pressed(global.controls_menu.accept))
					{
						options[menu][select[menu]].on_select();  
					}
				break;
			}
		
			if (is_pressed(global.controls_menu.back)) {
		        menu = MENU_OPTIONS.OPTIONS;
		        audio_play_sound(sfxBack, 0, false);
				ia = 0;
		    }
			break;
	}
}