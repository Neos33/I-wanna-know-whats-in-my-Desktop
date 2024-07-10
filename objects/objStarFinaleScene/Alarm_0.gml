/// @description Fade out
if image_alpha > 0
{
image_alpha -= .05;
image_xscale += .05;
image_yscale = image_xscale;
alarm[0] = 1;

}