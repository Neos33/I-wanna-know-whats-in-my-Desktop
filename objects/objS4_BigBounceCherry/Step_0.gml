/// @description 
if growing
{
	image_xscale += .05;
	image_yscale = image_xscale;
}


if shaking
{
	var _mag = irandom_range(-5,5);
	camera_set_view_pos(view_camera[0],0,_mag);
	
	if shakeCount > 0
		shakeCount--;
		
	// Reset view
	if shakeCount == 0
		camera_set_view_pos(view_camera[0],0,0);	
}
