/// @description 
var _title = "HEYAN CUP";
var _subtitle = "Trap Fangame Making Contest";


setDrawSettings(ftHeyanTitle,,,,1);
draw_text(textX,y,_title);

setDrawSettings(ftHeyanSubTitle,,,,1);
draw_text(textX,y+48,_subtitle);

gpu_set_tex_filter(true);
draw_sprite_ext(sprite_index,0,spriteX,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
gpu_set_tex_filter(false);


setDrawSettings();

