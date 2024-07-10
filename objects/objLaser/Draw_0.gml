/// @description Draw
// You can write your code in this editor
if image_index == 0
{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	gpu_set_blendmode(bm_normal);
}

else //Black laser
{
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale*0.75,image_angle,image_blend,image_alpha);
}