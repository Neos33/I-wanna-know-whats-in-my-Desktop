/// @description 
if waving
{
	rotation_move(xstart,ystart,distance_fall,image_angle+270);
	//image_angle++;
	image_angle = move_oscillate(20,60,0,time_oscillate);
	time_oscillate++;
}	
