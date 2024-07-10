/// @description Draw icons and their names

var margin = 6;
gpu_set_tex_filter(true);
draw_sprite_ext(sprite,0,x+sprite_xoffset,y+sprite_yoffset,image_xscale,image_yscale,0,image_blend,image_alpha);

setDrawSettings(fntMenu,fa_center,fa_top,c_white,1);

draw_sprite_stretched_ext(sprPoint1x1,0,
						x + sprite_width / 2 - string_width(name) / 2 - margin,
						y + sprite_height + 32 - margin,
						string_width(name) + margin * 2,
						string_height(name) + margin * 2,
						c_black,0.25);

gpu_set_tex_filter(false);
draw_text_outline(x+sprite_width/2,y+sprite_height + 32, name, c_gray);

draw_set_halign(fa_left);

draw_hitbox(c_blue);
