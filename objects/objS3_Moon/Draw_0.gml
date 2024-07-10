/// @description 
gpu_set_blendmode(bm_add);
gpu_set_tex_filter(true);

var cam = camera_properties(0);
var _wave = Wave(0,5,2,0);
var _waveLight = Wave(.7,1,4,0);

//repeat 2
draw_sprite_ext(sprLightCheap,0,
	cam.view_x+64+128,cam.view_y+64+128,
		image_xscale*11,image_yscale*11,0,c_yellow,_waveLight);
		
draw_sprite_ext(sprLightCheap,0,
	cam.view_x+64+128,cam.view_y+64+128,
		image_xscale*13+_wave,image_yscale*13+_wave,0,c_aqua,.2);
		
draw_sprite_general(sprite_index,0,0,0,sprite_width,sprite_height,
		cam.view_x+64,cam.view_y+64,
		image_xscale,image_yscale,0,c_black,c_white,c_white,c_white,_waveLight);
		


gpu_set_blendmode(bm_normal);
gpu_set_tex_filter(false);