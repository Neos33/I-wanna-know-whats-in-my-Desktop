/// @description 
image_xscale += .5;
image_yscale = image_xscale;


image_alpha -= .002;
if image_alpha <= 0
	instance_destroy();