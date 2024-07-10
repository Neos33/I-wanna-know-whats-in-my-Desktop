/// @description Draw


//draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
//draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle+90,image_blend,image_alpha);

//draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle+180,image_blend,image_alpha);
//draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle+270,image_blend,image_alpha);


draw_sprite_ext(sprite_index,0,x,y,image_xscale*1.5,image_yscale*1.5,image_angle,c_black,image_alpha);
draw_sprite_ext(sprite_index,0,x,y,image_xscale*1.5,image_yscale*1.5,image_angle+90,image_blend,image_alpha);

draw_sprite_ext(sprite_index,0,x,y,image_xscale*1.5,image_yscale*1.5,image_angle+180,c_black,image_alpha);
draw_sprite_ext(sprite_index,0,x,y,image_xscale*1.5,image_yscale*1.5,image_angle+270,image_blend,image_alpha);