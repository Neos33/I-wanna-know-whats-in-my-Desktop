/// @description 
var _xscale = Wave(image_xscale*.9,image_xscale*1.1,2,0);
var _yscale = Wave(image_yscale*.9,image_yscale*1.1,2,0);
var _color = color_gem(190);

draw_sprite_ext(sprGemGlow,0,x,y,_xscale,_yscale,image_angle,_color,image_alpha);
if spin
draw_self();
else
{

if !surface_exists(surf)
	surf = surface_create(sprite_width,sprite_height);
	
surface_set_target(surf)

draw_sprite_ext(sprite_index,image_index,sprite_xoffset,sprite_yoffset,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

gpu_set_colorwriteenable(true,true,true,false);
draw_sprite_stretched_ext(sprReflectionGem,reflect_index,0,0,sprite_width,sprite_height,c_white,image_alpha*.3);
gpu_set_colorwriteenable(true,true,true,true);
surface_reset_target();


//draw_surface(surf,x - sprite_xoffset, y - sprite_yoffset);
draw_surface_ext(surf,x - sprite_xoffset, y - sprite_yoffset,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}