/// @description Destroy the bullet + hit
with objMGR_HUD 
{
	punchCount++
	setScale(1.5);
}
instance_destroy(other);
part_particles_create(pp,bbox_left,other.y,tt,3);
//burst some particles
