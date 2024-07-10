/// @description Burst rain
var cam = camera_properties(0);
repeat 5
{
	part_particles_create(psys,irandom_range(cam.view_x,cam.view_x+cam.view_w+300),cam.view_y-8,ptyp,1);	
}
alarm[0] = 3;