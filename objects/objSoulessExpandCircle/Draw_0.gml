/// @description 
//var scaleLimit = map(radius,0,radiusLimit,0,1);

if is_in_the_view()
{

	for (var i = 0; i < total; ++i) {
	    var _get_angle = 360 / total * i + angle;
		//var _x = pointX + lengthdir_x(radius, _get_angle);
		//var _y = pointY + lengthdir_y(radius, _get_angle);
	
		var _x = x + lengthdir_x(radius, _get_angle);
		var _y = y + lengthdir_y(radius, _get_angle);
	
	
		//var amgleLimit = map(radius,0,radiusLimit,0,90);
	
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprNeosTHBullet,0,_x,_y,image_xscale,image_yscale*.5,_get_angle+90,c_white,image_alpha);
		gpu_set_blendmode(bm_normal);

	}
}
//gpu_set_blendmode(bm_add);
//var _ratioScale = Wave(.5,.75,10,0);
//draw_sprite_ext(sprLightCheap,0,x,y,1-image_xscale*_ratioScale,1-image_yscale*_ratioScale,0,c_white,image_alpha*.75);
draw_sprite_ext(sprSquareBullet,0,x,y,1-image_xscale,1-image_yscale,image_angle,c_red,image_alpha);
//gpu_set_blendmode(bm_normal);
//draw_sprite_ext(sprCherry,0,x,y,1-scaleLimit,1-scaleLimit,0,c_white,image_alpha);