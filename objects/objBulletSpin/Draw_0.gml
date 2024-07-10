/// @description 


gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,angle,image_blend,1);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,angle+90,image_blend,1);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,-angle,image_blend,1);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,-angle+90,image_blend,1);
gpu_set_blendmode(bm_normal);