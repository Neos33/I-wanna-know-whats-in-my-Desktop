/// @description 
if visible
{
	var s_width = sprite_get_width(sprite_index);
	draw_sprite_part_ext(sprite_index,0,
						0,
						0,
						s_width, (ystart-y)/image_yscale,
						x, y,
						image_xscale, image_yscale,
						c_white, 1);
}