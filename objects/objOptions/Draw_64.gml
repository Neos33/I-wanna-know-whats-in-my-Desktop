/// @description Draw options
if image_alpha == 0 exit;
var centerX = display_get_gui_width() / 2;

//draw_set_font(fntOptions);
draw_set_font(ftOptionsNew);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
var reg = 360;
var wStr = string_width("W") - 2;

var length = array_length(options[menu]);

// Draw semi-transparent rectangle in the selected option
var recXShift = 18;

draw_sprite_ext(sprPoint1x1,0,centerX-reg,(wStr/2)-16 + y,reg*2,wStr*length*ia*2,0,c_black,image_alpha*0.25);

draw_sprite_ext(sprPoint2x2,0,centerX,(wStr/2) + y + spacing * select[menu]*ia,reg,wStr*ia,0,c_black,image_alpha*0.35);

switch (menu) {
	case MENU_OPTIONS.OPTIONS:
	case MENU_OPTIONS.ONLINE:
		for (var i = 0; i < length; i++) {
			var option = options[menu][i];
			var c = c_white;

			// Option name
			draw_set_halign(fa_left);
			if option.label == "Online Connection"
			{
				if (global.game_started) c = c_grey; else c = c_white;	
			}
			draw_text_colour(centerX - reg + 16, y + spacing * i*ia, option.label,c,c,c,c,image_alpha);
				
			// Option's Value
			switch (option.type_action)
			{
				case "volumeSlide":
					draw_sprite_ext(sprPoint2x2,0,centerX+reg/2+recXShift,(wStr/2) + y + spacing * i*ia,reg/2-recXShift,wStr*ia,0,c_black,image_alpha*0.3);
					draw_sprite_ext(sprOptionsValueSelector,0,centerX+recXShift*2,(wStr/2) + y + spacing * i*ia,-1,1*ia,0,c_black,image_alpha*0.3);
			
					// Draw volume bar
					draw_sprite_ext(sprPoint1x1,0,centerX + 120,(wStr/4) + y + spacing * i*ia,160,10,0,c_black,image_alpha);
					if i = 0 draw_sprite_ext(sprPoint1x1,0,centerX + 120,(wStr/4) + y + spacing * i*ia,global.display.volBGM*160,10,0,c_green,image_alpha);
					if i = 1 draw_sprite_ext(sprPoint1x1,0,centerX + 120,(wStr/4) + y + spacing * i*ia,global.display.volSFX*160,10,0,c_green,image_alpha);
					
					// Draw values (not volume) - 0% to 100%
					draw_set_halign(fa_right);
					draw_text(centerX + reg - 16, y + spacing * i * ia, option.get_value());
				break;
				
				case "changeValue":
				case "changeValueNormal":
					draw_sprite_ext(sprPoint2x2,0,centerX+reg/2+recXShift,(wStr/2) + y + spacing * i*ia,reg/2-recXShift,wStr*ia,0,c_black,image_alpha*0.3);
					draw_sprite_ext(sprOptionsValueSelector,0,centerX+recXShift*2,(wStr/2) + y + spacing * i*ia,-1,1*ia,0,c_black,image_alpha*0.3);
			
					var f = string_width("___LENGTH___");
					// Draw arrows
					draw_sprite_ext(sprOptionsArrowMoveSelection,0,centerX + 200-f,(wStr/2) + y + spacing * i*ia,-1,1,0,c_white,image_alpha*0.9);
					draw_sprite_ext(sprOptionsArrowMoveSelection,0,centerX + 200+f,(wStr/2) + y + spacing * i*ia,1, 1,0,c_white,image_alpha*0.9);
					draw_set_halign(fa_center);
					draw_text(centerX + 200, y + spacing * i*ia, option.get_value());
				break;
				
				case "toggleValue":
					draw_sprite_ext(sprPoint2x2,0,centerX+reg/2+recXShift,(wStr/2) + y + spacing * i*ia,reg/2-recXShift,wStr*ia,0,c_black,image_alpha*0.3);
					draw_sprite_ext(sprOptionsValueSelector,0,centerX+recXShift*2,(wStr/2) + y + spacing * i*ia,-1,1*ia,0,c_black,image_alpha*0.3);

					var f = string_width("___LENGTH___");
				
					draw_sprite_ext(sprOptionsArrowMoveSelection,0,centerX + 200-f,(wStr/2) + y + spacing * i*ia,-1,1,0,c_white,image_alpha*0.9);
					draw_sprite_ext(sprOptionsArrowMoveSelection,0,centerX + 200+f,(wStr/2) + y + spacing * i*ia,1, 1,0,c_white,image_alpha*0.9);
					//var c1, c2;
					var c1 = c_white;
					var c2 = c_white;
					var tempTextOFF = "OFF";
					var tempTextON = "ON";
					var toggleSpacing = 32;
					
					if option.get_value() == "OFF" { c1 = c_grey; c2 = c_white; }
					else { c1 = c_white; c2 = c_grey; }
					
					draw_set_halign(fa_center);
					draw_text_colour(centerX + 200 + toggleSpacing, y + spacing * i*ia, tempTextON, c1,c1,c1,c1,image_alpha);
					draw_text_colour(centerX + 200 - toggleSpacing, y + spacing * i*ia, tempTextOFF,c2,c2,c2,c2,image_alpha);
				break;
				
				case "enterAction":
					draw_set_halign(fa_center);
					draw_text(centerX + 200, y + spacing * i*ia, option.get_value());
				break;
			}
		}
		// Description
		var tb_shiftY = 88;
		draw_sprite_stretched_ext(sprTextBox,0,521-389,304+tb_shiftY*ia,778,202*0.75,c_white,image_alpha*0.8);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_text(521-389+16,304+tb_shiftY*ia+16,options[menu][select[menu]].description);
		break;
	
	case MENU_OPTIONS.CONTROLS: 
	    for (var i = 0; i < length - 1; i++) {
	        var bind = control_bind(global.controls[$ string_lower(options[menu][i])]);
        
	        if (changing_controls && select[menu] == i) {
	            bind = "---";
	        }
        
			draw_set_halign(fa_left);
			draw_text(centerX - reg + 16, y + spacing * i * ia, string(options[menu][i])+" Button:");
			draw_set_halign(fa_right);
			draw_text(centerX + reg - 16, y + spacing * i * ia, string(bind));
	    }
		draw_set_halign(fa_left);
		draw_text(centerX - reg + 16,  y + spacing * (length - 1) * ia, options[menu][length - 1].label);
		break;
}


draw_set_font(fntMenu3);
draw_set_halign(fa_center);
draw_text(centerX-175, 556, "[Z] Back");
draw_text(centerX+175, 556, "[Shift] Accept");
draw_set_halign(fa_left);
draw_set_alpha(1);