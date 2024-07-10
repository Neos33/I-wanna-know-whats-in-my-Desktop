/// @description 
var cam = camera_properties(0);
rect(cam.view_x,cam.view_y,1024,576,0,c_black,pitchBlack);

setDrawSettings(,fa_center,,,);
draw_text(cam.view_x+cam.view_w*.5,cam.view_y+text_y,textCredits);
if showGAMEOVER
{
	draw_set_valign(fa_middle);
	draw_text(cam.view_x+cam.view_w*.5,cam.view_y+text_y_gameover,"GAME OVER\n---------------------\nPress 'R' to try again");
	draw_set_valign(fa_top);
}

draw_set_halign(fa_right);
draw_text(cam.view_x+cam.view_w*.5-32,cam.view_y+text_y,textTitle);

draw_set_halign(fa_left)
draw_text(cam.view_x+cam.view_w*.5+32,cam.view_y+text_y,textName);

setDrawSettings();
