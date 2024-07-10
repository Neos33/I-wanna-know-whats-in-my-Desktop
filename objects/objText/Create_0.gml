/// @description 
font = ftWindows;
halign = fa_left;
valign = fa_top;
color = c_white;
alpha = 1;

text = "";

use_outline = false;
color_outline = c_black;

function draw_text_alt(_x,_y,_text)
{
	if use_outline
	{
		draw_set_color(color_outline);
		draw_text(_x+1,_y,_text);
		draw_text(_x,_y+1,_text);
		draw_text(_x-1,_y,_text);
		draw_text(_x,_y-1,_text);
	}
	draw_set_color(color);
	draw_text(_x,_y,_text);
}
