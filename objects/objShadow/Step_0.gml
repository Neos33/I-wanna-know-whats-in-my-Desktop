/// @description 
if decrease_alpha
{
	if image_alpha <= 0 instance_destroy();
	image_alpha += alpha_speed;
}

if decrease_scale
{
	if image_xscale <= 0 instance_destroy();
	image_xscale += scale_speed;
	image_yscale = image_xscale;
}