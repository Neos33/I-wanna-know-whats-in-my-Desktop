/// @description 
var _xscale = Wave(image_xscale*.9,image_xscale*1.1,2,0);
var _yscale = Wave(image_yscale*.9,image_yscale*1.1,2,0);
var _color = color_gem(190);

draw_sprite_ext(sprGemGlow,0,x+shakeX,y+shakeY,_xscale,_yscale,image_angle,_color,image_alpha);
//draw_self();

if !surface_exists(surf)
	surf = surface_create(sprite_width,sprite_height);
	
surface_set_target(surf)

draw_sprite_ext(sprite_index,num,sprite_xoffset+shakeX,sprite_yoffset+shakeY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

gpu_set_colorwriteenable(true,true,true,false);
draw_sprite_stretched_ext(sprReflectionGem,reflect_index,0,0,sprite_width,sprite_height,c_white,image_alpha*.3);
gpu_set_colorwriteenable(true,true,true,true);
surface_reset_target();


draw_surface(surf,x - sprite_xoffset+shakeX, y - sprite_yoffset+shakeY);

draw_sprite_ext(sprGemGlow,0,x+shakeX,y+shakeY,image_xscale*.95,image_yscale*.95,image_angle,c_white,alphaLayer*image_alpha);
