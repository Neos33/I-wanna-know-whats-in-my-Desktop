/// @description 

// Draw which reference is
var _w = sprite_get_width(spriteReference);
var _h = sprite_get_height(spriteReference);
//var _sW = sprite_get_width(sprite_index);
var _width = sprite_width / _w;
var _height = (sprite_height-17*2) / _h;
//var _height = sprite_height;

gpu_set_tex_filter(true);
draw_sprite_ext(spriteReference,image_index,pX-sprite_width/2,pY+17,_width,_height,image_angle,image_blend,image_alpha);
gpu_set_tex_filter(false);

// Gradient
draw_sprite_ext(sprGradientTransparent_1x1,0,pX-sprite_width/2+3,pY+17,.1,-max(0,sprite_width-6),-90,c_black,.6);
draw_sprite_ext(sprGradientTransparent_1x1,0,pX-sprite_width/2+3,pY+sprite_height-17,.1,max(0,sprite_width-6),90,c_black,.6);


// Draw window
draw_sprite_ext(sprite_index,image_index,pX,pY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

setDrawSettings(,fa_center,,c_black,1);
//var addZero = "";
//if number_index < 10 { addZero = "0"; }
draw_text_transformed(pX,pY,string_interp("{0} reference #{1}", type_element, number_index),image_xscale,image_yscale,0);
draw_set_valign(fa_bottom);
draw_text_transformed(pX,pY+sprite_height+4,string_interp("{0}", referenceTitle),image_xscale,image_yscale,0);
//draw_text(x,y,string(type_element)+"reference #"+string(addZero + number_index));

draw_sprite_ext(sprReference_Reflection,floor(reflectionIndex),pX-109,pY+18,image_xscale*2,image_yscale*2,image_angle,image_blend,alpha)


setDrawSettings();