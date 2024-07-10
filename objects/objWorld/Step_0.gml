#region Game Checks

audio_master_gain(global.display.volMaster);
if sfx_loaded and music_loaded
{
	var _audio_formula_bgm = power(global.display.volBGM,2);
	var _audio_formula_sfx = power(global.display.volSFX,2);
	audio_group_set_gain(ag_BGM,_audio_formula_bgm,0);
	audio_group_set_gain(ag_SFX,_audio_formula_sfx,0);
}

//gpu_set_texfilter(global.display.smooth);

if (global.game_started && !global.game_paused && (global.time_when_dead || instance_exists(objPlayer))) {
    time_micro += delta_time;
    global.time += time_micro div 1000000;
    time_micro %= 1000000;
}

set_caption();
#endregion

#region Main Inputs
if (global.game_started) {
	if (!global.game_paused) {
		if (is_pressed(global.controls.restart) and global.resetAllowed) {
			restart_game();
		}
	} 

	if (pause_delay < global.total_pause_delay) {
		pause_delay++;
	} else if (is_pressed(global.controls.pause) and !instance_exists(objPauseMenuSettings)) {
		global.game_paused = !global.game_paused;
		
	
		if (global.game_paused) {
			pause_screen = sprite_create_from_surface(application_surface, 0, 0, display_get_gui_width(), display_get_gui_height(), false, false, 0, 0);
			with objLastBoss
			{
				if time_source_get_state(_ts) = time_source_state_active
				{
					time_source_pause(_ts);
					//play_sfx(sndGemExplode)	
				}
			}
			
			instance_deactivate_all(true);
			instance_activate_object(objOnlinePlayer);
			//if !instance_exists(objPauseMenuSettings)
				instance_create_layer(0,0,"Controllers",objPauseMenuSettings)
		} else {
			instance_activate_all();
			instance_destroy(objPauseMenuSettings);
		
			if (sprite_exists(pause_screen)) {
				sprite_delete(pause_screen);
			}
		
			io_clear();
		}
	
		pause_delay = 0;
	}
}
#endregion

#region Misc. Inputs
if (!global.game_paused) {
	//Toggles fullscreen
	if (is_pressed(global.controls_misc.fullscreen)) {
		global.display.fullscreen ^= true;
		set_display();
		save_config();
	}

	//Reset game
	if (is_pressed(global.controls_misc.reset) and roomsAllowed()) {
		stop_music();
		event_user(0);
		//game_restart();
	}
}

//Close game
if (is_pressed(global.controls_misc.quit) and room != rFakeIntroductionStage) {
	game_end();
}
#endregion

#region Debug Inputs
if (global.debug_enable && global.game_started) {
	if (is_pressed(global.controls_debug.overlay)) {
		global.debug_overlay ^= true;
	}
	
	if (is_pressed(global.controls_debug.god_mode)) {
		global.debug_god_mode ^= true;
	}
	
	if (is_pressed(global.controls_debug.inf_jump)) {
		global.debug_inf_jump ^= true;
	}
	
	if (instance_exists(objPlayer)) {
		if (global.debug_inf_jump) {
			reset_jumps();
		}
	
		if (is_held(global.controls_debug.teleport)) {
			with (objPlayer) {
				x = mouse_x;
				y = mouse_y;
				vspeed = 0;
			}
		}
	
		if (is_pressed(global.controls_debug.save)) {
			save_game(true);
		}
	
	}
	if (is_pressed(global.controls_debug.roomU)) {
		if (room_get_name(room_previous(room)) != "rOptions") {
			instance_destroy(objPlayer);
			room_goto_previous();
		}
	}
		
	if (is_pressed(global.controls_debug.roomD)) {
		if (room != room_last) {
			instance_destroy(objPlayer);
			room_goto_next();
		}
	}
	
	if is_held(vk_control) and is_pressed(ord("T"))
	{
		if room != rTest
		{
			instance_destroy(objPlayer);
			room_goto(rTest);	
		}
	}
	
	if (is_held(global.controls_debug.speed_up)) {
		game_set_speed(1000,gamespeed_fps);
	}else game_set_speed(roomSpeed,gamespeed_fps);
}
#endregion

#region Dynamic loop songs setup - Credits to Tralexium

if audio_exists( global.current_music ) and global.audioLoopSystem.dynamicLoop
{
    var currentPosition = audio_sound_get_track_position( global.current_music );
	var totalLength = global.audioLoopSystem.loopStart + global.audioLoopSystem.loopFinish;
	
	// Jump a few steps earlier to make sure the loop is working (Debug purposes)
	if is_pressed(ord("E")) and global.debug_enable
		audio_sound_set_track_position( global.current_music, totalLength - 3 );
    
	if currentPosition > totalLength
	{
		show_debug_message(string_interp("Audio position: {0}",currentPosition));
		show_debug_message(string_interp("End loop: {0}",global.audioLoopSystem.loopFinish));
		show_debug_message(string_interp("Total lenght: {0}",totalLength));
		audio_sound_set_track_position( global.current_music, currentPosition - global.audioLoopSystem.loopFinish );	
		show_debug_message("-- Music has been looped --");
	}
}
#endregion