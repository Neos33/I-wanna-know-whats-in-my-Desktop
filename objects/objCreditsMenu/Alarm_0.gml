/// @description Fade in
if image_alpha < 1
{
	image_alpha += 0.05;
	alarm[0] = 1;
}
else
{
	canMove = true;	 
	goBack_allowed = true;
}