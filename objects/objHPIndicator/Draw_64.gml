/// @description 

var _ratio = 1024-32 / sprite_get_width(sprite_index);

var _scale = map(image_xscale,0,1024,0,1);

//draw_sprite_ext(sprite_index,0,16,8,_scale,1,0,image_blend,image_alpha);
//draw_sprite_ext(sprite_index,1,16,8,_scale*(HPCurrent/HPMax),1,0,image_blend,image_alpha);

draw_sprite_stretched(sprite_index,0,16,8+shiftY,1024-32,32);

//draw_sprite_stretched(sprite_index,1,16,8,(1024-32),32);


draw_sprite_stretched(sprHPBar,1,16+25,8+10+shiftY,(1024-32-25*2)*(HPCurrent/HPMax),12);