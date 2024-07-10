/// @description Move copy snap to Parent
// You can write your code in this editor
if instance_exists(copy)
{
	copy.x = x;
	copy.y = y;
	copy.image_xscale = image_xscale;
	copy.image_yscale = image_yscale;
	copy.image_angle = image_angle;
	copy.image_alpha = image_alpha;
}
else
{
	instance_destroy(copy);	
}