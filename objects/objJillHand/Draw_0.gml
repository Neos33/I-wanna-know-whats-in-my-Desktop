/// @description draw hand and gun
//draw_self();
draw_sprite_ext(sprJillHand,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

var _ori = sign(image_xscale);
var _x = x + lengthdir_x(8,image_angle + 90-90*_ori);
var _y = y + lengthdir_y(8,image_angle + 90-90*_ori);

draw_sprite_ext(sprJillGun,image_index,_x,_y,image_xscale,image_yscale,image_angle+angle,image_blend,image_alpha);