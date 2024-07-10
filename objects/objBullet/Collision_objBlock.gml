if hspeed > 0
part_particles_create(global.pBulletExplode_System,other.bbox_left,y,global.pBulletExplode_Type,1);
else
part_particles_create(global.pBulletExplode_System,other.bbox_right,y,global.pBulletExplode_Type,1);
instance_destroy();