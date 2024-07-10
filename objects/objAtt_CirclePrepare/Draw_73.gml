/// @description 


for (var i = 0; i < 360; i += 360 / total)
{
	var _x = x + lengthdir_x(radius, i + angle);
	var _y = y + lengthdir_y(radius, i + angle);
	
	draw_sprite_ext(sprite_index,0,_x,_y,image_xscale*.75,image_yscale*.75,image_angle,c_black,image_alpha);
}