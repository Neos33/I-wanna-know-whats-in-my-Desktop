/// @description Draw Pause Menu
//var screenshot = objWorld.pause_screen;
	
if image_alpha > 0
{
	setDrawSettings(ftOptionsNew,fa_center,fa_middle,c_white,image_alpha);


	var lenght = array_length(menu);
	draw_sprite_ext(sprPoint2x2,0,512,304+64+24*index,60,8,0,c_red,image_alpha*0.3);
	for (var i = 0; i < lenght; ++i) {
		
		draw_text(512,304+64+24*i,menu[i])
	}
	
	//setDrawSettings(fntPause,fa_center,fa_middle,c_white,image_alpha);
	//draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "PAUSED");
	draw_sprite_ext(sprPauseText,0,
				display_get_gui_width() / 2, display_get_gui_height() / 2, 
				1,1,0,c_white,image_alpha*.8);
				
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprPauseText,1,
				display_get_gui_width() / 2, display_get_gui_height() / 2, 
				1,1,0,c_white,image_alpha*Wave(0,.7,10,0));
	gpu_set_blendmode(bm_normal);


	setDrawSettings(fntPause2,fa_left,fa_top,c_white,image_alpha);
	draw_text(20, 525-16, string_interp("Deaths: {0}", global.deaths));
	draw_text(20, 550-16, string_interp("Time: {0}", formatted_time(global.time)));
}

// Reset values
setDrawSettings();