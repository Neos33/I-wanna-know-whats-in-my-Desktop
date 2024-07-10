var centerX = camera_get_view_width(0) / 2;

for (var i = 0; i < global.total_saves; i++) {
	var data = datas[i];
    //draw_sprite(sprFilesBar, 0, x - 32, y + spacing * i);
	draw_sprite_ext(sprPoint1x1,0,x - 32, y + spacing * i,640,128,0,c_black,0.3);
	
	//Name
    draw_set_alpha(1);
	draw_set_font(fntMenu);
    draw_set_color(c_white);
    draw_text(x, y + spacing * i, string_interp("Data{0}", i + 1));
    
	//Difficulty
	draw_set_font(fntMenu2);
	draw_set_halign(fa_center);
    
    var draw_diff = data.difficulty;
    
    if (menu == 1 && select[0] == i) {
        draw_diff = string_interp("< {0} >", global.difficulties[select[menu]]);
    }
    
    draw_text(x + 48, y + 46 + spacing * i, draw_diff);
    
	//Deaths and Time
	draw_set_font(fntMenu3);
    draw_set_halign(fa_left);
	draw_sprite(sprDataIndicator_Death,0,x,y + 80 + spacing * i);
	draw_sprite(sprDataIndicator_Time,0,x,y + 102 + spacing * i);
	draw_text(x+24, y + 78 + spacing * i, string(data.deaths));
    draw_text(x+24, y + 100 + spacing * i, string(formatted_time(data.time)));
      
	//Clear
    if (data.clear) {
		draw_set_font(fntMenu4);
        draw_set_halign(fa_center);
        draw_text(x + 284, y + 92 + spacing * i, "Clear!");
    }
        
    if (select[0] == i) {
        draw_sprite(sprCherry, 0, 124, y + 60 + spacing * i);
        draw_sprite(sprCherry, 0, room_width - 124, y + 60 + spacing * i);
    }
}

draw_set_font(fntMenu3);
draw_set_halign(fa_center);
//Other color???

draw_text(centerX-156, 550, "[Z] Back");
draw_text(centerX+156, 550, "[Shift] Accept");
draw_set_halign(fa_left);