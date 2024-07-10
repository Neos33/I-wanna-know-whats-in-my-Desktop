/// @description 


if current_spr != noone
{
	var cam = camera_properties(0);
	draw_sprite_ext(sprPoint1x1,0,cam.view_x,cam.view_y,cam.view_w,cam.view_h,0,c_black,.4);

	draw_sprite_part_ext(current_spr, 0,
						xx, yy, width_image, height_image,
						x, y, image_xscale*.5, image_yscale*.5,
						image_blend, image_alpha);
}

