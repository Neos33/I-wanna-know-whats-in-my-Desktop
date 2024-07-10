/// @description Burst particles
if visible == true
{
	for (var i = 0; i < 360; i += 360 / total)
	{
		var _x = x + lengthdir_x(radius, i + angle);
		var _y = y + lengthdir_y(radius, i + angle);
		var _color = map(i, 0, 360, 0, 255);
		var _blend = make_color_hsv(_color,230,255);
		var _shoot_outside = point_direction(x,y,_x,_y);
	
		//part_type_gravity(ptyp, .2, _shoot_outside);
		part_type_direction(ptyp, _shoot_outside,_shoot_outside,0,0);
		part_type_color1(ptyp,_blend);
	
		part_type_speed(ptyp,8,8,.1,0);
		part_particles_create(psys, _x, _y, ptyp, 1);
	
		part_type_speed(ptyp,14,14,.1,0);
		part_particles_create(psys, _x, _y, ptyp, 1);
	}
}
alarm[0] = 5;