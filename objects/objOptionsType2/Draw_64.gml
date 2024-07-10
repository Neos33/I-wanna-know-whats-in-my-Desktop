/// @description Draw options
if image_alpha == 0 exit;
setDrawSettings(ftOptionsNew,fa_center,fa_middle,c_white,image_alpha);

// [Local variables]
var options_shift_x = 96;
var centerX = options_shift_x + display_get_gui_width() / 2;
var reg = 360;
var wStr = string_width("W") - 2;

var length = array_length(options[menu]);

// Draw semi-transparent rectangle in the selected option
var recXShift = 18;
var _cateX = 70;
var _cate_space = spacing;
var _cateY = 32;
var cCat = c_white;

// Line
draw_text(_cateX,_cateY,"OPTIONS");
//draw_sprite_ext(sprPoint1x1,0,0,_cateY+16,80,1,0,c_white,image_alpha);
draw_sprite_stretched_ext(sprGradientTransparent_1x1,0,0,_cateY+16,300,1,c_white,image_alpha);

// Category Selection
draw_sprite_ext(sprPoint2x2,0,_cateX,128 + _cate_space * category_option,100,wStr,0,c_black,image_alpha*0.35);
var _cate_options = ["AUDIO","GRAPHICS","GAMEPLAY","CONTROLS","ONLINE"];
var _cate_total = array_length(_cate_options);
for (var i = 0; i < _cate_total; i++)
{
	draw_sprite_ext(sprPoint2x1,0,_cateX,128+_cate_space*i - 16,1,80,90,c_white,image_alpha*.1);
	if i = _cate_total - 1 and global.game_started cCat = c_grey;
	draw_text_colour(_cateX,128+_cate_space*i,_cate_options[i],cCat,cCat,cCat,cCat,image_alpha);
	//draw_sprite_ext(sprPoint2x1,0,_cateX,128+_cate_space*i + 16,1,80,90,c_white,image_alpha*.1);
}
draw_sprite_ext(sprPoint2x1,0,_cateX,128+_cate_space*(_cate_total-1) + 16,1,80,90,c_white,image_alpha*.1);


// Rectangle and selection draw

if !selecting_category
{	
	draw_sprite_ext(sprPoint1x1,0,centerX-reg,(wStr/2)-16 + y,reg*2,wStr*length*ia*2,0,c_black,image_alpha*0.25);
	draw_sprite_ext(sprPoint2x2,0,centerX,(wStr/2) + y + spacing * select[menu]*ia,reg,wStr*ia,0,c_black,image_alpha*0.35);
	//draw_sprite_stretched_ext(sprRectangleOutline,0,centerX-reg,(wStr/2)-16 + y + spacing * select[menu]*ia,reg*2,wStr*ia*2,c_white,image_alpha*0.35);
}
draw_set_valign(fa_top);
switch (menu) {
	case MENU_OPTIONS_SELECTION.AUDIO:
	case MENU_OPTIONS_SELECTION.GRAPHICS:
	case MENU_OPTIONS_SELECTION.GAMEPLAY:
	case MENU_OPTIONS_SELECTION.ONLINE:
		for (var i = 0; i < length; i++) {
			var option = options[menu][i];
			var c = c_white;

			// Option name
			draw_set_halign(fa_left);
			
			//if option.label == "Online Connection"
			//	if (global.game_started) c = c_grey; else c = c_white;	
				
			draw_text_colour(centerX - reg + 16, y + spacing * i*ia, option.label,c,c,c,c,image_alpha);
				
			// Option's Value
			switch (option.type_action)
			{
				case "volumeSlide":
					draw_sprite_ext(sprPoint2x2,0,centerX+reg/2+recXShift,(wStr/2) + y + spacing * i*ia,reg/2-recXShift,wStr*ia,0,c_black,image_alpha*0.3);
					draw_sprite_ext(sprOptionsValueSelector,0,centerX+recXShift*2,(wStr/2) + y + spacing * i*ia,-1,1*ia,0,c_black,image_alpha*0.3);
			
					// Draw volume bar
					draw_sprite_ext(sprPoint1x1,0,centerX + 120,(wStr/4) + y + spacing * i*ia,160,10,0,c_black,image_alpha);
					
					if i = 0 draw_sprite_part_ext(sprVolumeBar,0,0,0,global.display.volMaster*160,1,centerX + 120,(wStr/4) + y+1 + spacing * i*ia,1,8,c_white,image_alpha);
					if i = 1 draw_sprite_part_ext(sprVolumeBar,0,0,0,global.display.volBGM*160,1,centerX + 120,(wStr/4) + y+1 + spacing * i*ia,1,8,c_white,image_alpha);
					if i = 2 draw_sprite_part_ext(sprVolumeBar,0,0,0,global.display.volSFX*160,1,centerX + 120,(wStr/4) + y+1 + spacing * i*ia,1,8,c_white,image_alpha);
					
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
		var _textbox_shift_y = 304+44 + 44 * ia;
		var _box_x = options_shift_x + 521 - 389;
		
		draw_sprite_stretched_ext(sprTextBox,0,_box_x,_textbox_shift_y,778,202*0.75,c_white,image_alpha*0.8);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		
		if !selecting_category
			draw_text(_box_x + 16,_textbox_shift_y + 16,options[menu][select[menu]].description);
		else
			draw_text(_box_x + 16,_textbox_shift_y + 16,category_description[menu]);
			
		break;
	
	case MENU_OPTIONS_SELECTION.CONTROLS: 
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
		
		// Description
		var _textbox_shift_y = 304+44 + 44 * ia;
		var _box_x = options_shift_x + 521 - 389;
		
		draw_sprite_stretched_ext(sprTextBox,0,_box_x,_textbox_shift_y,778,202*0.75,c_white,image_alpha*0.8);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		
		if selecting_category
			draw_text(_box_x + 16,_textbox_shift_y + 16,category_description[menu]);
		break;
}


draw_set_font(fntMenu3);
draw_set_halign(fa_center);
draw_text(centerX-175, 548, "[Z] Back");
draw_text(centerX+175, 548, "[Shift] Accept");
draw_set_halign(fa_left);
draw_set_alpha(1);