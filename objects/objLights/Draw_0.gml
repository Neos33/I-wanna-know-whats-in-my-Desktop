/// @description 
var cam = camera_properties(0);
if !surface_exists(light_surf)
	light_surf = surface_create(cam.view_w,cam.view_h);
	
surface_set_target(light_surf);

draw_clear_alpha(c_black,.6);

gpu_set_blendmode(bm_subtract);
gpu_set_tex_filter(true);
if instance_exists(objPlayer)
{
	if objPlayer.visible
		draw_sprite_ext(sprLightCheap,0,objPlayer.x,objPlayer.y,7,7,0,c_white,1);
}


gpu_set_tex_filter(false);
gpu_set_blendmode(bm_normal);

surface_reset_target();
draw_surface(light_surf,cam.view_x,cam.view_y);

