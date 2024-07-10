/// @description Control the menu
if (!is_held(vk_anykey)) {
	exit;
}

// Controls 
var _up = is_pressed(global.controls_menu.up);
var _down = is_pressed(global.controls_menu.down);

var v_input = _down - _up;

// Audio
var sfxMove = sndGT4MoveSelect;
var sfxSelect = sndGT4Selected;
var sfxBack = sndGT4MenuBack;
var sfxForbbiden = sndGT4NotAllowed;


if (changing_controls && is_pressed(vk_anykey)) {
	var key = keyboard_key;
    
    if (key == 160 || key == 161) {
        key = 16;
    }
    
	variable_struct_set(global.controls, string_lower(options[MENU_OPTIONS_SELECTION.CONTROLS][select[menu]]), key);
    save_config();
    audio_play_sound(sndJump, 0, false);
    changing_controls = false;
	exit;
}
if !locked
{
	if is_pressed(ord("X"))
		print(string_interp("Menu {0}: {1}",options[menu][select[menu]].label,global.display));
	
	if selecting_category
	{		
		var _length = 4;
		if v_input != 0
		{
			menu += v_input;
			menu = wrap(menu,0,_length);
			category_option = menu;
			audio_play_sound(sfxMove, 0, false);
			ia = 0.75;
		}
		
		// Select category
		if (is_pressed(global.controls_menu.accept)) and selecting_category
		{
			if global.game_started and menu == _length audio_play_sound(sfxForbbiden, 0, false);
			else
			{
				selecting_category = false;
				audio_play_sound(sfxSelect, 0, false);
			}
		}
		// Exit options and save settings
		if (is_pressed(global.controls_menu.back)) and selecting_category
		{
			save_config();
			alarm[2] = 1;
			locked = true;
			audio_play_sound(sfxBack, 0, false);
		}
	}
	else
	{
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
		case MENU_OPTIONS_SELECTION.AUDIO:
		case MENU_OPTIONS_SELECTION.GRAPHICS:
		case MENU_OPTIONS_SELECTION.GAMEPLAY:
		    var ll = is_pressed(global.controls_menu.left);
			var rr = is_pressed(global.controls_menu.right);
			
			var hh_input = is_held(global.controls_menu.right) - is_held(global.controls_menu.left);

			switch options[menu][select[menu]].type_action
			{
				case "volumeSlide": // Press left or right to change volume
					if ll or rr 
					{
						options[menu][select[menu]].on_select(); 
						volumeTimer = volumeDelay;
					}
					if hh_input != 0
					{
						if volumeTimer <= 0
							options[menu][select[menu]].on_select(); 
						volumeTimer--;
					}
					else volumeTimer = volumeDelay;


				break;
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
						// Denied access while gameplay (for online options only)
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
			
			#region SFX Test volume
			// Play a sound if you're in SFX Volume to test your volume
			if select[MENU_OPTIONS_SELECTION.AUDIO] == 2 and menu == MENU_OPTIONS_SELECTION.AUDIO
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
			#endregion
			
		    if (is_pressed(global.controls_menu.back)) and !selecting_category {
				back_to_category(sfxBack);
		    }
			break;
		
		case MENU_OPTIONS_SELECTION.CONTROLS:
		    if (is_pressed(global.controls_menu.accept)) {
		        if (select[menu] == length - 1) {
		            options[menu][select[menu]].on_select();
		        } else {
		            changing_controls = true;
		        }
		
				audio_play_sound(sfxSelect, 0, false);
		    }

		    if (is_pressed(global.controls_menu.back)) {
		        back_to_category(sfxBack);
		    }
			break;
		
		case MENU_OPTIONS_SELECTION.ONLINE:
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
		        back_to_category(sfxBack);
		    }
			break;
	}
	}
}