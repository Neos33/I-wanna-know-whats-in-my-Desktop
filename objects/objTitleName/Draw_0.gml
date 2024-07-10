/// @description 
gpu_set_tex_filter(true);
draw_sprite_ext(sprTitle1,0,x,y,image_xscale,image_yscale,0,c_white,alpha);
draw_sprite_ext(sprTitle2,0,x+234,y+115+Wave(0,8,4,0),.75,.75,0,c_white,alpha);




gpu_set_blendmode(bm_add);
draw_sprite_ext(sprTitle1,1,x,y,image_xscale,image_yscale,image_angle,image_blend,alpha*Wave(0,.7,10,0))
draw_sprite_ext(sprTitle2,1,x+234,y+115+Wave(0,8,4,0),.75,.75,0,c_white,alpha*Wave(0,.7,10,0))
gpu_set_blendmode(bm_normal);



gpu_set_tex_filter(false);