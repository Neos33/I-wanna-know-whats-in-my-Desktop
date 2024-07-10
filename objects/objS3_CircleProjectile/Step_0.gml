/// @description 
if owner != noone and exists(owner)
{
	rotation_move(owner.x,owner.y,radius,angle);
	angle += owner.angleSpeed;
}