/// @description 
if !surf_begin draw_self();
if surf_begin
{
	if !surface_exists(surf_grieta)	
		surf_grieta = surface_create(surf_w,surf_h);
		
		
	surface_set_target(surf_grieta);
	draw_sprite_ext(sprite_index,1,sprite_xoffset,sprite_yoffset,1,1,image_angle,image_blend,image_alpha);
	gpu_set_colorwriteenable(1,1,1,false);
	draw_sprite_stretched_ext(sprGrieta,surf_index,0,0,surf_w,surf_h,image_blend,image_alpha);
	
	gpu_set_colorwriteenable(true,true,true,true);
	
	surface_reset_target();

	
	draw_surface(surf_grieta,x-sprite_xoffset,y-sprite_yoffset);
}