/// @description 
//draw_circle(x,y,radius,true);
gpu_set_blendmode(bm_add);
//var al = 30 / radius;
//draw_set_alpha(al);
//draw_circle_color(x,y,radius,c_black,c_green,false);
//draw_set_alpha(1);

var _w = radius / 128;  //256 / 2 = 128;
draw_sprite_ext(sprCircleShockWave,0,x,y,_w,_w,0,c_green,alphaCircleBase);

gpu_set_blendmode(bm_normal);
//draw_self();

for (var i = 0; i < 360; i += 360 / total)
{
	var _x = x + lengthdir_x(radius, i + angle);
	var _y = y + lengthdir_y(radius, i + angle);
	var _color = map(i, 0, 360, 0, 255);
	var _blend = make_color_hsv(_color,230,255);
	
	draw_sprite_ext(sprite_index,0,_x,_y,image_xscale,image_yscale,image_angle,_blend,image_alpha);
}

//draw_circle(x,y,radius-10,true);