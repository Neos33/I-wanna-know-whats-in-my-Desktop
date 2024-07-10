/// @description 
//draw_line(x+16,y+springMove,x+16,y+8);
draw_sprite_stretched_ext(sprS3Block_Spring_Thread,0,x+16,y+springMove,4,20,image_blend,image_alpha);
draw_sprite_stretched_ext(sprS3Block_Spring_Thread,0,x+48,y+springMove,4,20,image_blend,image_alpha);

draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);


// Spring
draw_sprite_ext(sprite_index,1,x,y+springMove,image_xscale,image_yscale,image_angle,image_blend,image_alpha);