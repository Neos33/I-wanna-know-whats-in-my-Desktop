/// @description 
/*
// Draw which reference is
draw_sprite_ext(spriteReference,image_index,x,y+18,image_xscale,image_yscale,image_angle,image_blend,image_alpha);


// Draw window
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

setDrawSettings(,fa_center,,c_red,1);
var addZero = "";
if number_index < 10 { addZero = "0"; }
draw_text(x,y,string_interp("{0} reference #{1}", type_element, number_index));
//draw_text(x,y,string(type_element)+"reference #"+string(addZero + number_index));

draw_sprite_ext(sprReference_Reflection,floor(reflectionIndex),x-109,y+18,image_xscale*2,image_yscale*2,image_angle,image_blend,alpha)