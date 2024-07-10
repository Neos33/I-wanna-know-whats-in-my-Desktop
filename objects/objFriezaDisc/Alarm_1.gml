/// @description Fade out
if image_alpha <= 0 instance_destroy();

image_alpha -= .075;
image_xscale += .075;
image_yscale = image_xscale;
alarm[1] = 1;
