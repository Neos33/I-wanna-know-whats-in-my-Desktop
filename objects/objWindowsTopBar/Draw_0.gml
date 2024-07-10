/// @description 
var icons_sep = 46;
var cam = camera_properties(0);

// Draw outline windows
var _win_col = $262626;
draw_sprite_stretched_ext(sprRectangleOutline,0,cam.view_x+x1,cam.view_y+y1,x2,y2,_win_col,1);

// Draw top windows bar
draw_sprite_ext(sprPoint1x1,0,cam.view_x+x1,cam.view_y+y1,x2,30,0,$000000,1);

// Draw hover mouse
draw_sprite_ext(sprPoint1x1,0,cam.view_x+x2-45,cam.view_y+y1,45,29,0,windows_x_hovering_color,alphaIcon[0]);
draw_sprite_ext(sprPoint1x1,0,cam.view_x+x2-45*2,cam.view_y+y1,45,29,0,windows_other_hovering_color,alphaIcon[1]);
draw_sprite_ext(sprPoint1x1,0,cam.view_x+x2-45*3,cam.view_y+y1,45,29,0,windows_other_hovering_color,alphaIcon[2]);

// Draw Windows text bar
setDrawSettings(ftWindows,,fa_middle,c_white,1);
draw_sprite_ext(sprWinIcon_Gms2,0,cam.view_x+x1+16,cam.view_y+y1+14,1,1,0,c_white,1)
//draw_text(x1+28,y1+15,"Heyan Cup Trap 2 - Chill Zone");
draw_text(cam.view_x+x1+28,cam.view_y+y1+15,windowsName);

// Draw icons
draw_sprite_ext(sprWindows10_Icons,3,cam.view_x+x2-23,cam.view_y+y1+15,1,1,0,c_white,1);
draw_sprite_ext(sprWindows10_Icons,win_maximase + 1,cam.view_x+x2-23-icons_sep,cam.view_y+y1+15,1,1,0,c_white,1);
draw_sprite_ext(sprWindows10_Icons,0,cam.view_x+x2-23-icons_sep*2,cam.view_y+y1+15,1,1,0,c_white,1);

setDrawSettings();

