/// @description 

alarm[0] = irandom_range(10,20);

repeat(3)
{
	var _h = choose(0,180);
	part_type_direction(ptyp,_h,_h,0,0);
	part_particles_create(psys,irandom(1024),418,ptyp,1);
}