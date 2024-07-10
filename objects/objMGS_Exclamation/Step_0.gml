/// @description 

image_alpha = lerp(image_alpha,alphaTarget,.10);
image_xscale = lerp(image_xscale,1,.10);
image_yscale = image_xscale;

if image_alpha == 0 and alphaTarget == 0
{
	instance_destroy();	
}
