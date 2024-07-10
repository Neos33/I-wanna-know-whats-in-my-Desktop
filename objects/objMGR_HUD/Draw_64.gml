/// @description 

part_system_drawit(pSystem);
var c;
var _centerX = 1024 * .5;
var _edgeY = 608 - 96;
var a = image_alpha;
var offset_y = 16*a;
c = c_yellow;

draw_mgr_button(_centerX,_edgeY-32-offset_y,sprMGR_ButtonJump,1,0,c,a);
draw_mgr_button(_centerX-32,_edgeY-offset_y,sprMGR_ButtonArrow,1,180,c,a);
draw_mgr_button(_centerX+32,_edgeY-offset_y,sprMGR_ButtonArrow,1,0,c,a);

draw_sprite_ext(sprMGR_Button,im_index,_centerX,_edgeY+32-offset_y,1,1,0,c,a)
draw_sprite_ext(sprMGR_ButtonShoot,0,_centerX,_edgeY+32-offset_y+4*im_index,4,4,0,c,a);


// Draw hits information
c = c_white;
setDrawSettings(letter_font,fa_center,fa_bottom,c,1);
draw_text_transformed_color(100,120,"HITS",.5,.5,0,c,c,c,c,1);

c = c_orange;
setDrawSettings(number_font,fa_center,,c,1);
draw_text_transformed_color(100,128,punchCount,image_xscale,image_yscale,image_angle,c,c,c,c,1);

// Timer - Debug purposes
c = c_white;
setDrawSettings(fntPause2,fa_right,fa_bottom,c,1);
draw_text_transformed_color(1024,576,t,1,1,image_angle,c,c,c,c,1);

setDrawSettings();