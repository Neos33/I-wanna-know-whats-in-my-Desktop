/// @description 

if owner != noone and instance_exists(owner)
{
	x = pointX + lengthdir_x(radius*percentageX, angle);
	y = pointY + lengthdir_y(radius*percentageY, angle);
	
	angle += angle_speed;
	radius += radius_speed;
	
}
