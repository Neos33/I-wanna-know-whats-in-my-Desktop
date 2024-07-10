/// @description 

hue = Wave(0,10,1,0)
image_blend = make_colour_hsv(hue,180,255);

if !FadeOut
	image_alpha = min(image_alpha + .05, 1);
else
{
	image_alpha -= .05;
	if image_alpha <= 0 instance_destroy();
}
