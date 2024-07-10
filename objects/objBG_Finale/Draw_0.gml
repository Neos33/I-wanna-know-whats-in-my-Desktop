/// @description 
var cam = camera_properties(0);
gpu_set_blendmode(bm_add);

draw_sprite_tiled_ext(sprBkg_Stars_Finale,0,cam.view_x*0.9,cam.view_y*0.9,1,1,c_white,1);

draw_sprite_ext(sprGradientTransparent_1x1,0,0,608+cam.view_y*0.75,1,room_width,90,c_red,.2);
draw_sprite_ext(sprGradientTransparent_1x1,0,0,608+cam.view_y*0.75,-1,room_width,90,c_red,.2);

draw_sprite_tiled_ext(sprBkg_Stars_Finale,1,cam.view_x*0.7,cam.view_y*0.8,1,1,c_white,1);
draw_sprite_tiled_ext(sprBkg_Stars_Finale,2,current_time*0.05+cam.view_x*0.5,cam.view_y*0.7,1,1,c_white,1);

gpu_set_blendmode(bm_normal);