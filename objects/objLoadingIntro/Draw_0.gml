/// @description 

for (var i = 0; i < 360; i += 360 / total)
{
	var _x = x + lengthdir_x(radius, i + angle);
	var _y = y + lengthdir_y(radius, i + angle);
	var _darker = map(i, 0, 360, 0, 255);
	var _blend = make_color_hsv(0,0,_darker);
	
	draw_sprite_ext(sprite_index,0,_x,_y,image_xscale,image_yscale,image_angle,_blend,image_alpha);
}