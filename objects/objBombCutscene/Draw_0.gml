/// @description 
var _current = floor(bomb_anim_index);
draw_self();
draw_sprite_ext(sprBombEyes,_current,x+12*image_xscale,y+14*image_yscale,image_xscale,image_yscale,0,image_blend,image_alpha);
draw_sprite_ext(sprBombEyes,_current,x+17*image_xscale,y+14*image_yscale,image_xscale,image_yscale,0,image_blend,image_alpha);
