/// @description Particles
if is_in_the_view()
{
	for (var i = 0; i < total; ++i) {
	    var _get_angle = 360 / total * i + angle;
		//var _x = pointX + lengthdir_x(radius, _get_angle);
		//var _y = pointY + lengthdir_y(radius, _get_angle);
	
		var _x = x + lengthdir_x(radius, _get_angle);
		var _y = y + lengthdir_y(radius, _get_angle);
	
		var scaleLimit = map(radius,0,radiusLimit,0,1);
	
		part_type_scale(tt,scaleLimit,scaleLimit*.5);
		part_type_orientation(tt,_get_angle+90,_get_angle+90,0,0,0);
	
		part_particles_create(pp,_x,_y,tt,1);
	}
}
alarm[0] = 3;