/// @description 
var _col = make_color_hsv(0,180,255); // red 

gpu_set_tex_filter(true);
// Main aim
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_xscale,0,_col,image_alpha);

// Rotating things
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_xscale,image_angle,_col,image_alpha);

gpu_set_tex_filter(false);