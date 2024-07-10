/// @description Stretch and spin
// You can write your code in this editor
if init
{
	var scaleDestiny = target / width;
	image_xscale = lerp(image_xscale,scaleDestiny, 0.05);
	image_yscale = image_xscale;
	image_angle += angleSPD;
}