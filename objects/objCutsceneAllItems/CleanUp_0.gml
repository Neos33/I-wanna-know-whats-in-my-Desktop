/// @description Destroy particles shadow

if part_system_exists(pSys)
{
	part_particles_clear(pSys);
	part_type_destroy(pTyp);
	part_system_destroy(pSys);
}