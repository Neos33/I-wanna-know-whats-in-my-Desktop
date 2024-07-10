var _centerX = display_get_gui_width() / 2;
var _centerY = display_get_gui_height() / 2;

draw_sprite_stretched_ext(sprPoint1x1,0,0,0,display_get_gui_width(),display_get_gui_height(),c_black,alphaBG);

gpu_set_tex_filter(true);
draw_sprite_ext(sprite_index, 0, _centerX,_centerY,image_xscale*.75,image_yscale*.75,image_angle,image_blend,image_alpha);


// Game oveR
draw_sprite_ext(sprGameOver_Top,0,_centerX-centerSpace-Sep*4,_centerY,image_xscale*.75,Line1*.75,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprGameOver_Top,6,_centerX+centerSpace+Sep*4,_centerY,image_xscale*.75,Line1*.75,image_angle,image_blend,image_alpha);
// gAme ovEr
draw_sprite_ext(sprGameOver_Top,1,_centerX-centerSpace-Sep*3,_centerY,image_xscale*.75,Line2*.75,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprGameOver_Top,3,_centerX+centerSpace+Sep*3,_centerY,image_xscale*.75,Line2*.75,image_angle,image_blend,image_alpha);
// gaNe oVer
draw_sprite_ext(sprGameOver_Top,2,_centerX-centerSpace-Sep*2,_centerY,image_xscale*.75,Line3*.75,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprGameOver_Top,5,_centerX+centerSpace+Sep*2,_centerY,image_xscale*.75,Line3*.75,image_angle,image_blend,image_alpha);
// gamE Over 
draw_sprite_ext(sprGameOver_Top,3,_centerX-centerSpace-Sep,_centerY,image_xscale*.75,Line4*.75,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprGameOver_Top,4,_centerX+centerSpace+Sep,_centerY,image_xscale*.75,Line4*.75,image_angle,image_blend,image_alpha);

gpu_set_tex_filter(false);