/// @description 
if image_alpha < 1
{
	image_alpha += 0.05;
	layer_background_alpha(BG,image_alpha);
	alarm[0] = 1;
}
