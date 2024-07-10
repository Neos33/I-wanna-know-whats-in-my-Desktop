/// @description 
var cam = camera_properties(0);

draw_sprite_ext(sprVG_Shadow,0,cam.view_x,y,cam.view_w,.05,0,c_black,image_alpha);
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprVG_Shadow,0,cam.view_x,y,cam.view_w,.25,0,c_red,image_alpha);

gpu_set_blendmode(bm_normal);