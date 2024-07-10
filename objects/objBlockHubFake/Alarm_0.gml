/// @description Fade out
image_alpha -= 0.025;
alarm[0] = 1;

if image_alpha <= 0
	instance_destroy();