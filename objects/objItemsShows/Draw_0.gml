/// @description 

// Draw all the items
//var object_name = asset_get_index("sprItemBoss");
/*for (var i = 0; i < total; i++)
{
	if (global.items[$ "bosses"][i]) 
	{
		//var object_name = asset_get_index(string_interp("sprItemBoss{0}", i + 1));
		var object_name = sprGem;
		var _angle = 360 / total * i;
		var _xx = itemX[i] + lengthdir_x(radius[i], _angle + dir);
		var _yy = itemY[i] + lengthdir_y(radius[i], _angle + dir);
		draw_sprite_ext(object_name,i,_xx,_yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
	}
}
