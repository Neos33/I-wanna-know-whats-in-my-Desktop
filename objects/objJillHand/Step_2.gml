/// @description 
if owner != noone and exists(owner)
{
	var _ori = sign(image_xscale);
	x = owner.x + lengthdir_x(radius,image_angle+90 + (90+dire)*_ori);
	y = owner.y + lengthdir_y(radius,image_angle+90 + (90+dire)*_ori);
	
	if followAngle
		image_angle = owner.image_angle;
}