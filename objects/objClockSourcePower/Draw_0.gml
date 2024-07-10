/// @description 
for (var i = 0; i < 360; i += 360/12)
{
	var tX = xstart + lengthdir_x(573,i);
	var tY = ystart + lengthdir_y(573,i);
	
	draw_sprite_ext(sprite_index,0,tX,tY,3,3,0,c_white,.8);
}
