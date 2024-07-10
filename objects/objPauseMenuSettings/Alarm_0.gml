/// @description Fade in
if image_alpha < 1
{
	image_alpha += 0.05;
	alphaScreen += 0.05;
	alphaScreen = clamp(alphaScreen,0,1);
	with objWorld { blackAlpha = other.alphaScreen }
	alarm[0] = 1;
}
else
	locked = false;