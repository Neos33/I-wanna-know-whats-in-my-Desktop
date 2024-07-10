/// @description 

var cam = camera_properties(0);

rect(cam.view_x,cam.view_y,1024,64*cinematicScale,0,c_black,1);
rect(cam.view_x,cam.view_y+cam.view_h-64*cinematicScale,1024,64,0,c_black,1);

if timer < 1599
{
	var _margin = 8;
	setDrawSettings(,fa_right,fa_bottom,c_white,1);
	draw_text(cam.view_x + cam.view_w - _margin,
			cam.view_y + cam.view_h - _margin,
			"Press 'S' key to skip cutscene");
	setDrawSettings();
}