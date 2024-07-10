/// @description 
var _color = make_color_hsv(c_red,110,255);
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprLaserBurst_Jinx,0,x,y,image_xscale,image_yscale*1.3,image_angle,_color,image_alpha);
//draw_sprite_ext(sprSuzumiLaser,0,x,y,image_xscale,image_yscale*1.3,image_angle,_color,image_alpha*.9);
gpu_set_blendmode(bm_normal);

