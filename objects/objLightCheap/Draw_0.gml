/// @description 
gpu_set_tex_filter(true);
gpu_set_blendmode(bm_add);
draw_self();
gpu_set_blendmode(bm_normal);
gpu_set_tex_filter(false);