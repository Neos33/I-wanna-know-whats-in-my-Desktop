/// @description 
//draw_circle(x,y,radius,true);
//draw_self();

for (var i = 0; i < 360; i += 360 / total)
{
	var _x = x + lengthdir_x(radius, i + angle);
	var _y = y + lengthdir_y(radius, i + angle);
	var _color = map(i, 0, 360, 0, 255);
	var _blend = make_color_hsv(_color,230,255);
	
	draw_sprite_ext(sprite_index,0,_x,_y,image_xscale,image_yscale,image_angle,_blend,image_alpha);
}