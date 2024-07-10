#region Pause Overlay
if (global.game_paused) {
	draw_sprite(pause_screen, 0, 0, 0);
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();
	draw_sprite_stretched_ext(sprPoint1x1,0,0,0,_w,_h,c_black,0.4*blackAlpha);
}
#endregion

#region Debug Overlay
if (global.debug_enable && global.debug_overlay) {
    var spacing = 16;
    draw_set_font(fntMenu3);
	draw_set_color(c_white);

    if (global.game_started) {
        var xx = "N/A";
        var yy = "N/A";
        var align = "N/A";
        
        if (instance_exists(objPlayer)) {
            xx = floor(objPlayer.x);
            yy = objPlayer.y;
            align = floor(xx % 3);
        }
		
		var cameraModeAccess = 0;
		var cameraModeAccessObject = "N/A";
		var cameraInfo = [
			//string_interp("Follow Object -> {0}", //object_get_name(cameraModeAccessObject)),
			"N/A"
		];
		
		//Update variables
		if (instance_exists(objBetterCamera)) {
			cameraModeAccess = objBetterCamera.mode;
			cameraModeAccessObject = objBetterCamera.object_target;
			var cameraInfo = [
				"Follow Object",
				"Set Position",
				"Normal Transition",
				"Zoom Mode",
				"Zoom to Object"
			];
		}
		
		var camProperties = camera_properties(0);
		
		var getAudioVolume = audio_sound_get_gain(global.current_music);
		var getGroupVolume = global.display.volBGM;
		
		var info = [
			string_interp("Player (X, Y, Align, Grav): ({0}, {1}, {2}, {3})", xx, yy, align, global.grav),
			string_interp("Room: {0}", room_get_name(room)),
			string_interp("FPS: {0}", fps),
			string_interp("FPS real: {0}", fps_real),
			string_interp("Instances: {0}", instance_count),
			string_interp("Camera mode: {0}", cameraInfo[cameraModeAccess]),
			string_interp("Views parameters (X, Y, W, H): ({0}, {1}, {2}, {3})", camProperties.view_x, camProperties.view_y, camProperties.view_w, camProperties.view_h),
			string_interp("Audio volume: {0} (group: {1})", getAudioVolume, getGroupVolume)
		];
		
		var length = array_length(info);
		
		for (var i = 0; i < length; i++) {
			//draw_text_outline(0, spacing * i, info[i], c_black);
			draw_text(0, 32 + spacing * i, info[i]);
		}
    } else {
		draw_set_color(c_red);
		draw_set_halign(fa_right);
        draw_text_outline(1024, 0, "Debug Mode", c_black);
    }
}
#endregion

setDrawSettings();
